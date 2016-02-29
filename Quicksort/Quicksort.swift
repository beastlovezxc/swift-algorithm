import Foundation

func quicksort<T: Comparable>(a: [T]) -> [T] {
    if a.count <= 1 {
        return a
    } else {
        let pivot = a[a.count/2]
        let less = a.filter { $0 < pivot}
        let equal = a.filter { $0 == pivot}
        let greater = a.filter { $0 > pivot}
        return quicksort(less) + equal + quicksort(greater)
    }
}

func partitionLomuto<T: Comparable>(inout a: [T], low: Int, high: Int) -> Int {
    
    let pivot = a[high]
    
    var i = low
    
    for j in low..<high {
        if a[j] <= pivot {
            (a[i], a[j]) = (a[j], a[i])
            i += 1
        }
    }
    (a[i], a[high]) = (a[high], a[i])
    return i
}

func quicksortLomuto<T: Comparable>(intou a:[T], low: Int, high: Int) {
    if low < high {
        let p = partitionLomuto(&a, low: low, high: high)
        quicksortLomuto(&a, low: low, high: p - 1)
        quicksortLomuto(&a, low: p + 1, high: high)
    }
}

func partitionHoare<T: Comparable>(inout a:[T], low: Int, high: Int) -> Int {
    let pivot = a[low]
    var i = low - 1
    var j = high + 1
    
    while true {
        repeat { j -= 1 } while a[j] > pivot
        repeat { i += 1 } while a[i] < pivot
        
        if i < j {
            swap(&a[i], &a[j])
        } else {
            return j
        }
    }
}

func quicksortHoare<T: Comparable>(inout a:[T], low:Int, high: Int) {
    if low < high {
        let p = partitionHoare(&a, low: low, high: high)
        quicksortHoare(&a, low: low, high: p)
        quicksortHoare(&a, low: p + 1, high: high)
    }
}

public func random(min min: Int, max: Int) -> Int{
    assert(min < max)
    return min + Int(arc4random_uniform(UInt32(max - min + 1)))
}

func quicksortRandom<T: Comparable>(inout a: [T], low: Int, high: Int) {
    if low < high {
        let pivotIndex = random(min: low, max: high)
        
        (a[pivotIndex], a[high]) = (a[high], a[pivotIndex])
        
        let p = partitionLomuto(&a, low: low, high: high)
        quicksortRandom(&a, low: low, high: p - 1)
        quicksortRandom(&a, low: p + 1, high: high)
    }
}

public func swap<T>(inout a: [T], _ i: Int, _ j: Int) {
    if i != j {
        swap(&a[i], &a[j])
    }
}

func partitionDutchFlag<T: Comparable>(inout a: [T], low: Int, high: Int,pivotIndex: Int) -> (Int, Int) {
    let pivot = a[pivotIndex]
    
    var smaller = low
    var equal = low
    var larger = high
    
    while equal <= larger {
        if a[equal] < pivot {
            swap(&a, smaller, equal)
            smaller += 1
            equal += 1
        } else if a[equal] == pivot {
            equal += 1
        } else {
            swap(&a, equal, larger)
            larger -= 1
        }
    }
    return (smaller, larger)
}

func quicksortDutchFlag<T: Comparable>(inout a:[T], low: Int, high: Int) {
    if low < high {
        let pivotIndex = random(min: low, max: high)
        let (p,q) = partitionDutchFlag(&a, low: low, high: high, pivotIndex: pivotIndex)
        quicksortDutchFlag(&a, low: low, high: p - 1)
        quicksortDutchFlag(&a, low: q + 1, high: high)
    }
}
