#!/usr/bin/env python3
"""
NeetCode 150 — 骨架生成腳本

執行方式（從專案根目錄）：
    python scripts/generate.py

生成結果：
    problems/<category>/<id>_<slug>/
        README.md       # 題目說明
        solution.py     # Python 骨架
        solution.dart   # Dart 骨架
        solution.swift  # Swift 骨架

並同時更新根目錄 README.md 進度表。
"""

import os
import textwrap
from collections import defaultdict

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PROBLEMS_DIR = os.path.join(BASE_DIR, "problems")
ROOT_README = os.path.join(BASE_DIR, "README.md")

# ─────────────────────────────────────────────
# 完整題目清單（分類, 題號, slug, 標題, 難度）
# slug 採 LeetCode kebab-case 直接轉 snake_case
# ─────────────────────────────────────────────
PROBLEMS = [
    # 01 Arrays & Hashing (9)
    ("01_arrays_and_hashing", "0217", "contains_duplicate", "Contains Duplicate", "Easy"),
    ("01_arrays_and_hashing", "0242", "valid_anagram", "Valid Anagram", "Easy"),
    ("01_arrays_and_hashing", "0001", "two_sum", "Two Sum", "Easy"),
    ("01_arrays_and_hashing", "0049", "group_anagrams", "Group Anagrams", "Medium"),
    ("01_arrays_and_hashing", "0347", "top_k_frequent_elements", "Top K Frequent Elements", "Medium"),
    ("01_arrays_and_hashing", "0271", "encode_and_decode_strings", "Encode and Decode Strings", "Medium"),
    ("01_arrays_and_hashing", "0238", "product_of_array_except_self", "Product of Array Except Self", "Medium"),
    ("01_arrays_and_hashing", "0036", "valid_sudoku", "Valid Sudoku", "Medium"),
    ("01_arrays_and_hashing", "0128", "longest_consecutive_sequence", "Longest Consecutive Sequence", "Medium"),

    # 02 Two Pointers (5)
    ("02_two_pointers", "0125", "valid_palindrome", "Valid Palindrome", "Easy"),
    ("02_two_pointers", "0167", "two_sum_ii_input_array_is_sorted", "Two Sum II - Input Array Is Sorted", "Medium"),
    ("02_two_pointers", "0015", "3sum", "3Sum", "Medium"),
    ("02_two_pointers", "0011", "container_with_most_water", "Container With Most Water", "Medium"),
    ("02_two_pointers", "0042", "trapping_rain_water", "Trapping Rain Water", "Hard"),

    # 03 Sliding Window (6)
    ("03_sliding_window", "0121", "best_time_to_buy_and_sell_stock", "Best Time to Buy and Sell Stock", "Easy"),
    ("03_sliding_window", "0003", "longest_substring_without_repeating_characters", "Longest Substring Without Repeating Characters", "Medium"),
    ("03_sliding_window", "0424", "longest_repeating_character_replacement", "Longest Repeating Character Replacement", "Medium"),
    ("03_sliding_window", "0567", "permutation_in_string", "Permutation in String", "Medium"),
    ("03_sliding_window", "0076", "minimum_window_substring", "Minimum Window Substring", "Hard"),
    ("03_sliding_window", "0239", "sliding_window_maximum", "Sliding Window Maximum", "Hard"),

    # 04 Stack (6)
    ("04_stack", "0020", "valid_parentheses", "Valid Parentheses", "Easy"),
    ("04_stack", "0155", "min_stack", "Min Stack", "Medium"),
    ("04_stack", "0150", "evaluate_reverse_polish_notation", "Evaluate Reverse Polish Notation", "Medium"),
    ("04_stack", "0739", "daily_temperatures", "Daily Temperatures", "Medium"),
    ("04_stack", "0853", "car_fleet", "Car Fleet", "Medium"),
    ("04_stack", "0084", "largest_rectangle_in_histogram", "Largest Rectangle in Histogram", "Hard"),

    # 05 Binary Search (7)
    ("05_binary_search", "0704", "binary_search", "Binary Search", "Easy"),
    ("05_binary_search", "0074", "search_a_2d_matrix", "Search a 2D Matrix", "Medium"),
    ("05_binary_search", "0875", "koko_eating_bananas", "Koko Eating Bananas", "Medium"),
    ("05_binary_search", "0153", "find_minimum_in_rotated_sorted_array", "Find Minimum in Rotated Sorted Array", "Medium"),
    ("05_binary_search", "0033", "search_in_rotated_sorted_array", "Search in Rotated Sorted Array", "Medium"),
    ("05_binary_search", "0981", "time_based_key_value_store", "Time Based Key-Value Store", "Medium"),
    ("05_binary_search", "0004", "median_of_two_sorted_arrays", "Median of Two Sorted Arrays", "Hard"),

    # 06 Linked List (11)
    ("06_linked_list", "0206", "reverse_linked_list", "Reverse Linked List", "Easy"),
    ("06_linked_list", "0021", "merge_two_sorted_lists", "Merge Two Sorted Lists", "Easy"),
    ("06_linked_list", "0143", "reorder_list", "Reorder List", "Medium"),
    ("06_linked_list", "0019", "remove_nth_node_from_end_of_list", "Remove Nth Node From End of List", "Medium"),
    ("06_linked_list", "0138", "copy_list_with_random_pointer", "Copy List with Random Pointer", "Medium"),
    ("06_linked_list", "0002", "add_two_numbers", "Add Two Numbers", "Medium"),
    ("06_linked_list", "0141", "linked_list_cycle", "Linked List Cycle", "Easy"),
    ("06_linked_list", "0287", "find_the_duplicate_number", "Find the Duplicate Number", "Medium"),
    ("06_linked_list", "0146", "lru_cache", "LRU Cache", "Medium"),
    ("06_linked_list", "0023", "merge_k_sorted_lists", "Merge k Sorted Lists", "Hard"),
    ("06_linked_list", "0025", "reverse_nodes_in_k_group", "Reverse Nodes in k-Group", "Hard"),

    # 07 Trees (15)
    ("07_trees", "0226", "invert_binary_tree", "Invert Binary Tree", "Easy"),
    ("07_trees", "0104", "maximum_depth_of_binary_tree", "Maximum Depth of Binary Tree", "Easy"),
    ("07_trees", "0543", "diameter_of_binary_tree", "Diameter of Binary Tree", "Easy"),
    ("07_trees", "0110", "balanced_binary_tree", "Balanced Binary Tree", "Easy"),
    ("07_trees", "0100", "same_tree", "Same Tree", "Easy"),
    ("07_trees", "0572", "subtree_of_another_tree", "Subtree of Another Tree", "Easy"),
    ("07_trees", "0235", "lowest_common_ancestor_of_a_binary_search_tree", "Lowest Common Ancestor of a Binary Search Tree", "Medium"),
    ("07_trees", "0102", "binary_tree_level_order_traversal", "Binary Tree Level Order Traversal", "Medium"),
    ("07_trees", "0199", "binary_tree_right_side_view", "Binary Tree Right Side View", "Medium"),
    ("07_trees", "1448", "count_good_nodes_in_binary_tree", "Count Good Nodes in Binary Tree", "Medium"),
    ("07_trees", "0098", "validate_binary_search_tree", "Validate Binary Search Tree", "Medium"),
    ("07_trees", "0230", "kth_smallest_element_in_a_bst", "Kth Smallest Element in a BST", "Medium"),
    ("07_trees", "0105", "construct_binary_tree_from_preorder_and_inorder_traversal", "Construct Binary Tree from Preorder and Inorder Traversal", "Medium"),
    ("07_trees", "0124", "binary_tree_maximum_path_sum", "Binary Tree Maximum Path Sum", "Hard"),
    ("07_trees", "0297", "serialize_and_deserialize_binary_tree", "Serialize and Deserialize Binary Tree", "Hard"),

    # 08 Tries (3)
    ("08_tries", "0208", "implement_trie_prefix_tree", "Implement Trie (Prefix Tree)", "Medium"),
    ("08_tries", "0211", "design_add_and_search_words_data_structure", "Design Add and Search Words Data Structure", "Medium"),
    ("08_tries", "0212", "word_search_ii", "Word Search II", "Hard"),

    # 09 Heap / Priority Queue (7)
    ("09_heap_priority_queue", "0703", "kth_largest_element_in_a_stream", "Kth Largest Element in a Stream", "Easy"),
    ("09_heap_priority_queue", "1046", "last_stone_weight", "Last Stone Weight", "Easy"),
    ("09_heap_priority_queue", "0973", "k_closest_points_to_origin", "K Closest Points to Origin", "Medium"),
    ("09_heap_priority_queue", "0215", "kth_largest_element_in_an_array", "Kth Largest Element in an Array", "Medium"),
    ("09_heap_priority_queue", "0621", "task_scheduler", "Task Scheduler", "Medium"),
    ("09_heap_priority_queue", "0355", "design_twitter", "Design Twitter", "Medium"),
    ("09_heap_priority_queue", "0295", "find_median_from_data_stream", "Find Median from Data Stream", "Hard"),

    # 10 Backtracking (10)
    ("10_backtracking", "0078", "subsets", "Subsets", "Medium"),
    ("10_backtracking", "0039", "combination_sum", "Combination Sum", "Medium"),
    ("10_backtracking", "0040", "combination_sum_ii", "Combination Sum II", "Medium"),
    ("10_backtracking", "0046", "permutations", "Permutations", "Medium"),
    ("10_backtracking", "0090", "subsets_ii", "Subsets II", "Medium"),
    ("10_backtracking", "0079", "word_search", "Word Search", "Medium"),
    ("10_backtracking", "0131", "palindrome_partitioning", "Palindrome Partitioning", "Medium"),
    ("10_backtracking", "0017", "letter_combinations_of_a_phone_number", "Letter Combinations of a Phone Number", "Medium"),
    ("10_backtracking", "0022", "generate_parentheses", "Generate Parentheses", "Medium"),
    ("10_backtracking", "0051", "n_queens", "N-Queens", "Hard"),

    # 11 Graphs (13)
    ("11_graphs", "0200", "number_of_islands", "Number of Islands", "Medium"),
    ("11_graphs", "0695", "max_area_of_island", "Max Area of Island", "Medium"),
    ("11_graphs", "0133", "clone_graph", "Clone Graph", "Medium"),
    ("11_graphs", "0286", "walls_and_gates", "Walls and Gates", "Medium"),
    ("11_graphs", "0994", "rotting_oranges", "Rotting Oranges", "Medium"),
    ("11_graphs", "0417", "pacific_atlantic_water_flow", "Pacific Atlantic Water Flow", "Medium"),
    ("11_graphs", "0130", "surrounded_regions", "Surrounded Regions", "Medium"),
    ("11_graphs", "0207", "course_schedule", "Course Schedule", "Medium"),
    ("11_graphs", "0210", "course_schedule_ii", "Course Schedule II", "Medium"),
    ("11_graphs", "0261", "graph_valid_tree", "Graph Valid Tree", "Medium"),
    ("11_graphs", "0323", "number_of_connected_components_in_an_undirected_graph", "Number of Connected Components in an Undirected Graph", "Medium"),
    ("11_graphs", "0684", "redundant_connection", "Redundant Connection", "Medium"),
    ("11_graphs", "0127", "word_ladder", "Word Ladder", "Hard"),

    # 12 Advanced Graphs (6)
    ("12_advanced_graphs", "0332", "reconstruct_itinerary", "Reconstruct Itinerary", "Hard"),
    ("12_advanced_graphs", "1584", "min_cost_to_connect_all_points", "Min Cost to Connect All Points", "Medium"),
    ("12_advanced_graphs", "0743", "network_delay_time", "Network Delay Time", "Medium"),
    ("12_advanced_graphs", "0778", "swim_in_rising_water", "Swim in Rising Water", "Hard"),
    ("12_advanced_graphs", "0269", "alien_dictionary", "Alien Dictionary", "Hard"),
    ("12_advanced_graphs", "0787", "cheapest_flights_within_k_stops", "Cheapest Flights Within K Stops", "Medium"),

    # 13 1-D Dynamic Programming (12)
    ("13_1d_dp", "0070", "climbing_stairs", "Climbing Stairs", "Easy"),
    ("13_1d_dp", "0746", "min_cost_climbing_stairs", "Min Cost Climbing Stairs", "Easy"),
    ("13_1d_dp", "0198", "house_robber", "House Robber", "Medium"),
    ("13_1d_dp", "0213", "house_robber_ii", "House Robber II", "Medium"),
    ("13_1d_dp", "0005", "longest_palindromic_substring", "Longest Palindromic Substring", "Medium"),
    ("13_1d_dp", "0647", "palindromic_substrings", "Palindromic Substrings", "Medium"),
    ("13_1d_dp", "0091", "decode_ways", "Decode Ways", "Medium"),
    ("13_1d_dp", "0322", "coin_change", "Coin Change", "Medium"),
    ("13_1d_dp", "0152", "maximum_product_subarray", "Maximum Product Subarray", "Medium"),
    ("13_1d_dp", "0139", "word_break", "Word Break", "Medium"),
    ("13_1d_dp", "0300", "longest_increasing_subsequence", "Longest Increasing Subsequence", "Medium"),
    ("13_1d_dp", "0416", "partition_equal_subset_sum", "Partition Equal Subset Sum", "Medium"),

    # 14 2-D Dynamic Programming (11)
    ("14_2d_dp", "0062", "unique_paths", "Unique Paths", "Medium"),
    ("14_2d_dp", "1143", "longest_common_subsequence", "Longest Common Subsequence", "Medium"),
    ("14_2d_dp", "0309", "best_time_to_buy_and_sell_stock_with_cooldown", "Best Time to Buy and Sell Stock with Cooldown", "Medium"),
    ("14_2d_dp", "0518", "coin_change_ii", "Coin Change II", "Medium"),
    ("14_2d_dp", "0494", "target_sum", "Target Sum", "Medium"),
    ("14_2d_dp", "0097", "interleaving_string", "Interleaving String", "Medium"),
    ("14_2d_dp", "0329", "longest_increasing_path_in_a_matrix", "Longest Increasing Path in a Matrix", "Hard"),
    ("14_2d_dp", "0115", "distinct_subsequences", "Distinct Subsequences", "Hard"),
    ("14_2d_dp", "0072", "edit_distance", "Edit Distance", "Medium"),
    ("14_2d_dp", "0312", "burst_balloons", "Burst Balloons", "Hard"),
    ("14_2d_dp", "0010", "regular_expression_matching", "Regular Expression Matching", "Hard"),

    # 15 Greedy (8)
    ("15_greedy", "0053", "maximum_subarray", "Maximum Subarray", "Medium"),
    ("15_greedy", "0055", "jump_game", "Jump Game", "Medium"),
    ("15_greedy", "0045", "jump_game_ii", "Jump Game II", "Medium"),
    ("15_greedy", "0134", "gas_station", "Gas Station", "Medium"),
    ("15_greedy", "0846", "hand_of_straights", "Hand of Straights", "Medium"),
    ("15_greedy", "1899", "merge_triplets_to_form_target_triplet", "Merge Triplets to Form Target Triplet", "Medium"),
    ("15_greedy", "0763", "partition_labels", "Partition Labels", "Medium"),
    ("15_greedy", "0678", "valid_parenthesis_string", "Valid Parenthesis String", "Medium"),

    # 16 Intervals (6)
    ("16_intervals", "0057", "insert_interval", "Insert Interval", "Medium"),
    ("16_intervals", "0056", "merge_intervals", "Merge Intervals", "Medium"),
    ("16_intervals", "0435", "non_overlapping_intervals", "Non-overlapping Intervals", "Medium"),
    ("16_intervals", "0252", "meeting_rooms", "Meeting Rooms", "Easy"),
    ("16_intervals", "0253", "meeting_rooms_ii", "Meeting Rooms II", "Medium"),
    ("16_intervals", "1851", "minimum_interval_to_include_each_query", "Minimum Interval to Include Each Query", "Hard"),

    # 17 Math & Geometry (8)
    ("17_math_and_geometry", "0048", "rotate_image", "Rotate Image", "Medium"),
    ("17_math_and_geometry", "0054", "spiral_matrix", "Spiral Matrix", "Medium"),
    ("17_math_and_geometry", "0073", "set_matrix_zeroes", "Set Matrix Zeroes", "Medium"),
    ("17_math_and_geometry", "0202", "happy_number", "Happy Number", "Easy"),
    ("17_math_and_geometry", "0066", "plus_one", "Plus One", "Easy"),
    ("17_math_and_geometry", "0050", "powx_n", "Pow(x, n)", "Medium"),
    ("17_math_and_geometry", "0043", "multiply_strings", "Multiply Strings", "Medium"),
    ("17_math_and_geometry", "2013", "detect_squares", "Detect Squares", "Medium"),

    # 18 Bit Manipulation (7)
    ("18_bit_manipulation", "0136", "single_number", "Single Number", "Easy"),
    ("18_bit_manipulation", "0191", "number_of_1_bits", "Number of 1 Bits", "Easy"),
    ("18_bit_manipulation", "0338", "counting_bits", "Counting Bits", "Easy"),
    ("18_bit_manipulation", "0190", "reverse_bits", "Reverse Bits", "Easy"),
    ("18_bit_manipulation", "0268", "missing_number", "Missing Number", "Easy"),
    ("18_bit_manipulation", "0371", "sum_of_two_integers", "Sum of Two Integers", "Medium"),
    ("18_bit_manipulation", "0007", "reverse_integer", "Reverse Integer", "Medium"),
]

# 部分題目為 LeetCode Premium，僅限訂閱者觀看
PREMIUM = {"0271", "0286", "0261", "0323", "0269", "0252", "0253"}

# 分類顯示名稱（用於根 README）
CATEGORY_TITLES = {
    "01_arrays_and_hashing": "Arrays & Hashing",
    "02_two_pointers": "Two Pointers",
    "03_sliding_window": "Sliding Window",
    "04_stack": "Stack",
    "05_binary_search": "Binary Search",
    "06_linked_list": "Linked List",
    "07_trees": "Trees",
    "08_tries": "Tries",
    "09_heap_priority_queue": "Heap / Priority Queue",
    "10_backtracking": "Backtracking",
    "11_graphs": "Graphs",
    "12_advanced_graphs": "Advanced Graphs",
    "13_1d_dp": "1-D Dynamic Programming",
    "14_2d_dp": "2-D Dynamic Programming",
    "15_greedy": "Greedy",
    "16_intervals": "Intervals",
    "17_math_and_geometry": "Math & Geometry",
    "18_bit_manipulation": "Bit Manipulation",
}


# ─────────────────────────────────────────────
# 模板生成函式
# ─────────────────────────────────────────────

def leetcode_url(slug: str) -> str:
    return f"https://leetcode.com/problems/{slug.replace('_', '-')}/"


def make_readme(num: str, title: str, difficulty: str, url: str) -> str:
    return textwrap.dedent(f"""\
        # {num}. {title}

        **Difficulty**: {difficulty}  
        **URL**: {url}

        ## Description

        > 請前往 LeetCode 題目頁面查看完整描述。

        ## Examples

        ```
        // 在此填入範例
        ```

        ## Constraints

        - 在此填入限制條件

        ## Notes

        <!-- 自由填寫解題思路、時間複雜度、空間複雜度 -->
    """)


def make_python(num: str, title: str, difficulty: str, url: str) -> str:
    return textwrap.dedent(f'''\
        """
        Problem: {num}. {title}
        Difficulty: {difficulty}
        URL: {url}

        Description:
            請前往 LeetCode 題目頁面查看完整描述。

        Example 1:
            Input:  TODO
            Output: TODO

        Constraints:
            - TODO
        """
        # from typing import List, Optional


        class Solution:
            def solve(self) -> None:
                # TODO: 在此實作你的解法
                pass


        if __name__ == "__main__":
            s = Solution()

            # Test 1
            # result = s.solve(...)
            # assert result == expected, f"Test 1 failed: {{result}}"

            print("All tests passed!")
    ''')


def make_dart(num: str, title: str, difficulty: str, url: str) -> str:
    return textwrap.dedent(f'''\
        // Problem: {num}. {title}
        // Difficulty: {difficulty}
        // URL: {url}
        //
        // Description:
        //   請前往 LeetCode 題目頁面查看完整描述。
        //
        // Example 1:
        //   Input:  TODO
        //   Output: TODO

        // TODO: 在此實作你的解法

        void main() {{
          // Test 1
          // final result = solve(...);
          // assert(result == expected, 'Test 1 failed: $result');

          print('All tests passed!');
        }}
    ''')


def make_swift(num: str, title: str, difficulty: str, url: str) -> str:
    return textwrap.dedent(f'''\
        // Problem: {num}. {title}
        // Difficulty: {difficulty}
        // URL: {url}
        //
        // Description:
        //   請前往 LeetCode 題目頁面查看完整描述。
        //
        // Example 1:
        //   Input:  TODO
        //   Output: TODO

        class Solution {{
            func solve() {{
                // TODO: 在此實作你的解法
            }}
        }}

        // MARK: - Tests
        let s = Solution()

        // Test 1
        // let result = s.solve(...)
        // assert(result == expected, "Test 1 failed: \\(result)")

        print("All tests passed!")
    ''')


# ─────────────────────────────────────────────
# 根 README 生成
# ─────────────────────────────────────────────

def make_root_readme() -> str:
    by_cat: dict[str, list] = defaultdict(list)
    for cat, num, slug, title, diff in PROBLEMS:
        by_cat[cat].append((num, slug, title, diff))

    lines = []
    lines.append("# NeetCode 150")
    lines.append("")
    lines.append("練習計畫：用 **Dart**、**Swift**、**Python** 三種語言解完 [NeetCode 150](https://neetcode.io/practice/practice/neetcode150) 全部 150 道題。")
    lines.append("")
    lines.append("## 快速開始")
    lines.append("")
    lines.append("```bash")
    lines.append("# Python（直接執行單題）")
    lines.append("python problems/01_arrays_and_hashing/0001_two_sum/solution.py")
    lines.append("")
    lines.append("# Dart")
    lines.append("dart run problems/01_arrays_and_hashing/0001_two_sum/solution.dart")
    lines.append("")
    lines.append("# Swift")
    lines.append("swift problems/01_arrays_and_hashing/0001_two_sum/solution.swift")
    lines.append("```")
    lines.append("")
    lines.append("> 🔒 標記表示 LeetCode Premium 題目，需訂閱才能於 LeetCode 上練習，可前往 [NeetCode.io](https://neetcode.io/) 觀看免費版本。")
    lines.append("")
    lines.append("---")
    lines.append("")
    lines.append("## 進度追蹤")
    lines.append("")
    lines.append("> 圖例：⬜ 未開始 ｜ ✅ 完成")
    lines.append("")

    for idx, cat in enumerate(sorted(CATEGORY_TITLES.keys()), start=1):
        items = by_cat[cat]
        title = CATEGORY_TITLES[cat]
        lines.append(f"### {cat[:2]} {title}（{len(items)} 題）")
        lines.append("")
        lines.append("| # | 題目 | 難度 | Dart | Swift | Python |")
        lines.append("|---|------|------|:----:|:-----:|:------:|")
        for num, slug, ptitle, diff in items:
            url = leetcode_url(slug)
            lock = " 🔒" if num in PREMIUM else ""
            lines.append(f"| {num} | [{ptitle}]({url}){lock} | {diff} | ⬜ | ⬜ | ⬜ |")
        lines.append("")

    return "\n".join(lines) + "\n"


# ─────────────────────────────────────────────
# 主程式
# ─────────────────────────────────────────────

def main() -> None:
    created = 0
    skipped = 0

    for category, num, slug, title, difficulty in PROBLEMS:
        url = leetcode_url(slug)
        folder = os.path.join(PROBLEMS_DIR, category, f"{num}_{slug}")
        os.makedirs(folder, exist_ok=True)

        files = {
            "README.md":     make_readme(num, title, difficulty, url),
            "solution.py":   make_python(num, title, difficulty, url),
            "solution.dart": make_dart(num, title, difficulty, url),
            "solution.swift": make_swift(num, title, difficulty, url),
        }

        for filename, content in files.items():
            path = os.path.join(folder, filename)
            if os.path.exists(path):
                skipped += 1
                continue
            with open(path, "w", encoding="utf-8") as f:
                f.write(content)
            created += 1

    # 寫入根 README（每次都覆寫，因內容由清單自動產生）
    with open(ROOT_README, "w", encoding="utf-8") as f:
        f.write(make_root_readme())

    total_problems = len(PROBLEMS)
    print(f"完成！共 {total_problems} 道題目")
    print(f"  建立：{created} 個檔案")
    print(f"  跳過（已存在）：{skipped} 個檔案")
    print(f"  已更新：{ROOT_README}")
    print(f"\n專案路徑：{PROBLEMS_DIR}")


if __name__ == "__main__":
    main()
