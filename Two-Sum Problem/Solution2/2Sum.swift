
/*!
    Determines if there are any entries a[i] + a[j] == k in the array.
    This is an O(n) solution.
    The array must be sorted for this to work!
- parameter a: <#a description#>
- parameter k: <#k description#>

- returns: <#return value description#>
*/
func twoSumProblem(a: [Int], k: Int) -> ((Int, Int))? {
    var i = 0
    var j = a.count - 1
    
    while i < j {
        let sum = a[i] + a[j]
        if sum == k {
            return (i, j)
        } else if sum < k {
            ++i
        } else {
            --j
        }
    }
    return nil
}