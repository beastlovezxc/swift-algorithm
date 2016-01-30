//
//  File.swift
//  
//
//  Created by Bean on 16/1/30.
//
//
/*
    The recursive version of binary search
*/
func binarySearch<T: Comparable>(a: [T], key: T, range: Range<Int>) -> Int? {
    if range.startIndex >= range.endIndex {
        return nil
    } else {
        let midIndex = range.startIndex + (range.endIndex - range.startIndex) / 2
            if a[midIndex] > key {
                return binarySearch(a,key: key, range: range.startIndex ..< midIndex)
            } else if a[midIndex] < key {
                return binarySearch(a, key: key, range: midIndex+1 ..< range.endIndex)
            } else {
                return midIndex
            }
    }
}

/*
    The iterative version of binarySearch
*/
func binarySearch<T: Comparable>(a: [T], key: T) -> Int? {
    var range = 0 ..< a.count
    while range.startIndex < range.endIndex {
        let midIndex = range.startIndex + (range.endIndex - range.startIndex) / 2
        if a[midIndex] == key {
            return midIndex
        } else if a[midIndex] < key {
            range.startIndex = midIndex + 1
        } else {
            range.endIndex = midIndex
        }
    }
    return nil
}