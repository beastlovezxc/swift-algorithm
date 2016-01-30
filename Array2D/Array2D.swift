//
//  Array2D.swift
//  
//
//  Created by Bean on 16/1/30.
//
//

public struct Array2D<T> {
    public let columns: Int
    public let rows: Int
    private var array: [T]
    
    public init(columns: Int, rows: Int, initialValue: T) {
        self.columns = columns
        self.rows = rows
        array = .init(count: columns * rows, repeatValue: initialValue)
    }
    
    public subscript(column: Int, row: Int) -> T {
        get {
            return array[row*columns + column]
        }
        set {
            array[row*columns + column] = newValue
        }
    }
}