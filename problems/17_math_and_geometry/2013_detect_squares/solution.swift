// 2013. Detect Squares
import Foundation
class DetectSquares {
    var cnt: [Int: Int] = [:]
    var points: [(Int, Int)] = []
    func key(_ x: Int, _ y: Int) -> Int { x * 2001 + y }
    func add(_ point: [Int]) {
        let k = key(point[0], point[1])
        cnt[k, default: 0] += 1
        points.append((point[0], point[1]))
    }
    func count(_ point: [Int]) -> Int {
        let px = point[0], py = point[1]
        var total = 0
        for (x, y) in points {
            if abs(x - px) != abs(y - py) || x == px || y == py { continue }
            let a = cnt[key(x, py)] ?? 0
            let b = cnt[key(px, y)] ?? 0
            total += a * b
        }
        return total
    }
}
let ds = DetectSquares()
ds.add([3, 10]); ds.add([11, 2]); ds.add([3, 2])
if ds.count([11, 10]) != 1 { fatalError("a") }
if ds.count([14, 8]) != 0 { fatalError("b") }
ds.add([11, 2])
if ds.count([11, 10]) != 2 { fatalError("c") }
print("All tests passed!")
