//
//  LeetCode66.swift
//  MianshiTi
//
//  Created by app-01 on 2019/8/15.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import Foundation

class Solution66 {
    func plusOne(_ digits: [Int]) -> [Int] {
        var r = Array(digits)
        var last = digits.last!
        var lastIndex = digits.count-1
        if last+1 >= 10 {
            var jinwei = true
            while jinwei {
                jinwei = last+1 >= 10
                r[lastIndex] = (last+1)%10
                if lastIndex == 0 {
                    if jinwei {
                        r.insert(1, at: 0)
                    }
                    break
                }
                last = r[lastIndex-1]
                lastIndex = lastIndex - 1
            }
        } else {
            r[lastIndex] = last+1
        }
        
        return r
    }
    
    //a^b %p = ((a%p)^b) % p
    //(a*b) %p = (a%p * b%p) %p
    let mod = 1337
    func superPow(_ a: Int, _ b: [Int]) -> Int {
        var ret = 1
        var modNumber = a
        for i in 0 ... b.count-1 {
            ret = (ret * qpow(x: modNumber, n: b[b.count-1-i])) % mod
            modNumber = qpow(x: modNumber%mod, n: 10) % mod
        }
        return ret
    }
    
    func qpow(x:Int, n:Int) -> Int {
        var r = 1
        var m = n
        var base = x%mod
        while m > 0 {
            if (m & 1) > 0 {
                r = (r * base) % mod
            }
            base = (base * base) % mod
            m = m >> 1
        }
        return r
    }
    
    func myPow(_ x: Double, _ n: Int) -> Double {
        var ret = 1.0
        var m = abs(n)
        var base = x
        while m>0 {
            if m&1 > 0 {
                ret = ret*base
            }
            base = base*base
            m = m>>1
        }
        if n < 0 {
            ret = 1/ret
        }
        return ret
    }

    func findSubsequences491(_ nums: [Int]) -> [[Int]] {
        if nums.count == 0 {
            return []
        }
        
        var r:[[Int]] = []
        var dic:[[Int]:Int] = [:]
        for i in 0 ... (1<<nums.count) - 1 {
            var newObj:[Int] = []
            for j in 0...nums.count-1 {
                if (i & 1<<j) == (1<<j) {
                    if newObj.count == 0 {
                        newObj.append(nums[j])
                    } else if nums[j] >= newObj.last! {
                        newObj.append(nums[j])
                    }
                }
            }
            if newObj.count >= 2 && dic[newObj] == nil {
                r.append(newObj)
                dic[newObj] = 1
            }
        }
        
        return r
    }
    
    var arr:[Int] = []
    func preorderTraversal144(_ root: TreeNode?) -> [Int] {
        helper144(root)
        return arr
    }
    func helper144(_ root:TreeNode?) {
        if let t = root {
            arr.append(t.val)
            helper144(root?.left)
            helper144(root?.right)
        }
    }
    func helper144_2(_ root:TreeNode?) {
        if let t = root {
            var nodes:[TreeNode] = []
            nodes.append(t)
            while nodes.count > 0 {
                let node = nodes.removeLast()
                arr.append(node.val)
                if let nr = node.right {
                    nodes.append(nr)
                }
                if let nl = node.left {
                    nodes.append(nl)
                }
            }
        }
    }
    func splitIntoFibonacci842(_ S: String) -> [Int] {
        var arr:[Int] = []
        var arrStr:[String] = []
        var usedNumCount = 0
        helper842(S,answer: &arr,useCount: &usedNumCount, strArr: &arrStr)
        return arr
    }
    func helper842(_ S:String, answer asArr: inout [Int], useCount uc: inout Int, strArr strs: inout [String]) {
        for i in 1...S.count {
            if i+uc > S.count {
                break
            }
            let idx1 = S.index(S.startIndex, offsetBy: i+uc)
            let idx2 = S.index(idx1, offsetBy: -i)
            let str = S[idx2..<idx1]
            if let strValue = Int(String(str)) {
                if i > 1 && strValue > 0 && Int(String(S[idx2..<S.index(idx1, offsetBy: -i+1)])) == 0 {
                    break
                }
                uc = uc+i
                asArr.append(strValue)
                strs.append(String(str))
            } else {
                break
            }
            
            if asArr.count >= 3 {
                if asArr[asArr.count-1] - asArr[asArr.count-2] == asArr[asArr.count-3] {
                    helper842(S, answer: &asArr, useCount: &uc, strArr: &strs)
                    if uc == S.count {
                        break
                    } else {
                        asArr.removeLast()
                        uc = uc - numBits(strs.removeLast())
                    }
                } else if asArr[asArr.count-1] - asArr[asArr.count-2] > asArr[asArr.count-3]  {
                    asArr.removeLast()
                    uc = uc - numBits(strs.removeLast())
                    break
                } else {
                    asArr.removeLast()
                    uc = uc - numBits(strs.removeLast())
                }
            } else {
                helper842(S, answer: &asArr, useCount: &uc, strArr: &strs)
                if uc == S.count {
                    if (asArr.count < 3) {
                        asArr.removeLast()
                        uc = uc - numBits(strs.removeLast())
                    }
                    break
                } else {
                    asArr.removeLast()
                    uc = uc - numBits(strs.removeLast())
                }
            }
        }
    }
    private func numBits(_ num:String) -> Int {
        
        return num.count
    }
    func widthOfBinaryTree662_noIndex(_ root: TreeNode?) -> Int {
        var result = 0
        if root != nil {
            var curLevelNodes:[TreeNode?] = []
            curLevelNodes.append(root)
            var leftIndex = 0
            var rightIndex = 0
            while true {
                leftIndex = -1
                rightIndex = -1
                for i in 0...curLevelNodes.count-1 {
                    if curLevelNodes[i] != nil {
                        leftIndex = i
                        break
                    }
                }
                for i in 0...curLevelNodes.count-1 {
                    if curLevelNodes[curLevelNodes.count-1-i] != nil {
                        rightIndex = curLevelNodes.count-1-i
                        break
                    }
                }
                if leftIndex == rightIndex && leftIndex == -1 {
                    break
                }
                var cur:[TreeNode?] = []
                result = max(result, rightIndex-leftIndex+1)
                for i in leftIndex...rightIndex {
                    let item = curLevelNodes[i]
                    cur.append(item?.left)
                    cur.append(item?.right)
                }
                curLevelNodes = cur
            }
        }
        return result
    }
    func widthOfBinaryTree662(_ root: TreeNode?) -> Int {
        var result = 0
        var nodes:[TreeNode?] = []
        var nodeLevelIndex:[Int] = []
        var nodeIndexes:[Int] = []
        var curLevelIndex:[Int] = []
        var alllevels:[Int] = []
        
        if let r = root {
            nodes.append(r)
            nodeIndexes.append(0)
            nodeLevelIndex.append(0)
            curLevelIndex.append(1)
            alllevels.append(1)
            while nodes.count > 0 {
                let topnode = nodes.removeFirst()
                let topnodeIndex = nodeLevelIndex.removeFirst()
                let l = curLevelIndex.removeFirst()
                
                if let ln = topnode?.left {
                    nodes.append(ln)
                    nodeLevelIndex.append(2*topnodeIndex+1)
                    nodeIndexes.append(2*topnodeIndex+1)
                    
                    curLevelIndex.append(l+1)
                    alllevels.append(l+1)
                }
                if let rn = topnode?.right {
                    nodes.append(rn)
                    nodeLevelIndex.append(2*topnodeIndex+2)
                    nodeIndexes.append(2*topnodeIndex+2)
                    
                    curLevelIndex.append(l+1)
                    alllevels.append(l+1)
                }
            }
        }
        
        
        var levelFirstHasValue = false
        var levelFirst = 0
        var levelSecond = 0
        var idx = 0
        var level = 1
        for i in alllevels {
            if levelFirstHasValue == false {
                levelFirstHasValue = true
                level = i
                levelFirst = nodeIndexes[idx]
                levelSecond = nodeIndexes[idx]
            } else {
                if i == level {
                    levelSecond = nodeIndexes[idx]
                } else {
                    level = i
                    levelFirst = nodeIndexes[idx]
                    levelSecond = nodeIndexes[idx]
                }
                result = max(result, levelSecond - levelFirst + 1)
            }
            
            idx = idx+1
        }
        return result
    }
    private func nodeNum(_ level:Int) -> Int {
        let f = pow(2.0, Double(level-1))
        return Int(f)
    }
    
    public func createTree(_ num: inout [Int]) -> TreeNode? {
        var nodes:[TreeNode] = []
        var rootNode:TreeNode?
        var emptyTree = true
        while num.count > 0 {
            if nodes.count == 0 {
                if emptyTree == false {
                    break
                }
                emptyTree = false
                let node = TreeNode(num.removeFirst())
                rootNode = node
                nodes.append(node)
            } else {
                let topNode = nodes.removeFirst()
                if num.isEmpty {
                    break
                }
                var f = num.removeFirst()
                
                if f >= 0 {
                    topNode.left = TreeNode(f)
                    nodes.append(topNode.left!)
                }
                if num.isEmpty {
                    break
                }
                f = num.removeFirst()
                if f >= 0 {
                    topNode.right = TreeNode(f)
                    nodes.append(topNode.right!)
                }
            }
        }
        return rootNode
    }
    func findMaxForm474(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        var arr:[(Int,Int)] = []
        for item in strs {
            arr.append(helper474(item))
        }
        
        var maxValue = 0
        for i in 0...(1<<arr.count)-1 {
            var mm = m
            var nn = n
            var count = 0
//            var oneCount = 0
            var originI = (1<<arr.count)-1  - i
            if originI <= (1<<maxValue)-1 {
                break
            }
//            while originI != 0 {
//                oneCount = oneCount+1
//                originI = originI & (originI-1)
//            }
//            if oneCount <= maxValue {
//                continue
//            }
//            originI = i
            for j in 0...arr.count-1 {
                if originI>>j <= (1<<(maxValue-count))-1 {
                    break
                }
                
                if originI&(1<<j) == 1<<j {
                    if mm >= arr[j].0 {
                        mm = mm-arr[j].0
                    } else {
                        continue
                    }
                    if nn >= arr[j].1 {
                        nn = nn-arr[j].1
                    } else {
                        continue
                    }
                    count = count+1
                    if mm == 0 && nn == 0 {
                        break
                    }
                }
            }
            maxValue = max(maxValue, count)
        }
        
        return maxValue
    }
    func h474(_ arr:[(Int,Int)], _ index:inout Int, _ count:inout Int, _ mm:inout Int, _ nn:inout Int, _ maxValue:inout Int) {
        if index >= arr.count {
            maxValue = max(maxValue, count)
            return
        }
        let item = arr[index]
        if mm >= item.0 {
            mm = mm-item.0
        } else {
            index = index+1
            h474(arr, &index, &count, &mm, &nn, &maxValue)
            return
        }
        if nn >= item.1 {
            nn = nn-item.1
        } else {
            index = index+1
            h474(arr, &index, &count, &mm, &nn, &maxValue)
            return
        }
        count = count+1
        index = index+1
        h474(arr, &index, &count, &mm, &nn, &maxValue)
    }
    func helper474(_ str:String) -> (Int,Int) {
        var m = 0
        var n = 0
        for item in str {
            if item == "0" {
                m = m+1
            }
            if item == "1" {
                n = n+1
            }
        }
        return (m,n)
    }
}
