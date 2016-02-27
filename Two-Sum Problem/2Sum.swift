//
//  2Sum.swift
//  
//
//  Created by Bean on 16/2/27.
//
//
func twoSumProblem(a: [Int], k: Int) -> ((Int,Int))? {
    var map = [Int: Int]()
    
    for i in 0 ..< a.count {
        if let newK = map[a[i]] {
            return (newK, i)
        } else {
            map[k - a[i]] = i
        }
    }
    
    return nil
}
