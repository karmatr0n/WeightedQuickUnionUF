// Playground - WeightedQuickUnionUF:  Weighted quick-union (without path compression).

import UIKit

class WeightedQuickUnionUF
{
    var id: [Int] = []
    var sz: [Int] = []
    var counter: Int = 0
    
    init(n:Int) {
        sz =  [Int](count: n, repeatedValue: 1)
        for var i: Int = 0; i < n; i++ {
            id.append(i)
        }
        counter = n
    }
    
    func count() -> Int {
        return counter
    }
    
    func find(var p: Int) -> Int {
        while p != id[p] {
            p = id[p]
        }
        return p
    }
    
    func connected(p: Int, q: Int) -> Bool {
        return find(p) == find(q)
    }
    
    func union(p: Int, q: Int) -> Void {
        let rootP: Int = find(p)
        let rootQ: Int = find(q)
        
        if rootP == rootQ {
            return
        }
        
        if sz[rootP] < sz[rootQ] {
            id[rootP] = rootQ
            sz[rootQ] += sz[rootP]
        }
        else {
            id[rootQ] = rootP
            sz[rootP] += sz[rootQ]
        }
        
        counter--
    }
}

let s1: [Int] = [4, 3, 6, 9, 2, 8, 5, 7, 6, 1, 6]
let s2: [Int] = [3, 8, 5, 4, 1, 9, 0, 2, 1, 0, 7]
let n: Int = 10

var i: Int = 0
var uf: WeightedQuickUnionUF = WeightedQuickUnionUF(n:n)


while i < n {
    var p: Int = s1[i]
    var q: Int = s2[i]
    if !uf.connected(p, q: q) {
        uf.union(p, q:q)
        println("\(p) \(q)")
    }
    i++
}
println("\(uf.count()) components")
