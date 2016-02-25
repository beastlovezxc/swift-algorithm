//
//  Quene.swift
//
//
//  Created by Bean on 16/2/25.
//
//

/*
队列的实现
*/
public struct Queue<T> {
    var array = [T]()
    
    // 检查队列是否为空
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    // 返回队列的元素个数
    public var count: Int {
        return array.count
    }
    
    // 元素入队
    public mutating func enqueue(element: T) {
        array.append(element)
    }
    
    // 元素出队
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    // 返回位于 Queue 开始处的对象但不将其移除。
    public func peek() -> T? {
        return array.first
    }
}