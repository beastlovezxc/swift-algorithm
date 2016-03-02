//
//  BinaryTree.swift
//  
//
//  Created by Bean on 16/3/2.
//
//
/*!
A general-purpose binary tree
Nodes don't have a reference to their parent.

- Node:      <#Node description#>
- Empty:     <#Empty description#>
- let.Node:: <#let.Node: description#>
*/
public indirect enum BinaryTree<T> {
    case Node(BinaryTree<T>, T, BinaryTree<T>)
    case Empty
    
    public var count: Int {
        switch self {
        case let .Node(left, _, right):
            return left.count + 1 + right.count
        case .Empty:
            return 0
        }
    }
}

extension BinaryTree: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .Node(left, value, right):
            return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
        case .Empty:
            return ""
        }
    }
}

extension BinaryTree {
    public func traverseInOrder(@noescape process: T-> Void) {
        if case let .Node(left, value, right) = self {
            left.traverseInOrder(process)
            process(value)
            right.traverseInOrder(process)
        }
    }
    public func traversePreOrder(@noescape process: T-> Void) {
        if case let .Node(left, value, right) = self {
            process(value)
            left.traversePreOrder(process)
            right.traversePreOrder(process)
        }
    }
    public func traversePostOrder(@noescape proess: T-> Void) {
        if case let .Node(left, value, right) = self {
            left.traversePostOrder(process)
            right.traversePostOrder(process)
            process(value)
        }
    }
}