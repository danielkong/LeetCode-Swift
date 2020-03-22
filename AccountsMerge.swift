// 721. Accounts Merge -- medium
/**

*/
/**
    Solution 1: DFS -- graph, visited
        Runtime: O(sum(ailogai))
        Space: O(sum(ai))

    Solution 2: Disjoint Set Union  (Union Find)
        Runtime: O(AlogA)
        Space: O(A)

*/

class Solution {
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var res = [[String]]()
        if accounts == nil || accounts.count == 0 || accounts[0].count == 0 {
            return res
        }
        var graph = [String: [String]]()
        var nameDict = [String: String]()
        for account in accounts {
            let name = account[0]
            let count = account.count
            for i in 1..<count {
                let email = account[i]
                if nameDict[email] == nil {
                    nameDict[email] = name
                }
                if i >= 2 {
                    graph[email, default: []].append(account[i - 1])
                    graph[account[i - 1], default: []].append(email)
                }
            }
        }
        var visited = Set<String>()
        for email in nameDict.keys {
            if visited.contains(email) {
                continue
            }
            var path = [String]()
            dfs(graph, &path, email, &visited)
            path = path.sorted()
            path.insert(nameDict[email]!, at: 0)
            res.append(path)
        }
        return res
    }
    private func dfs(_ graph: [String: [String]], _ path: inout [String], _ email: String, _ visited: inout Set<String>) {
        if visited.contains(email) {
                return
        }
        path.append(email)
        visited.insert(email)
        if let nexts = graph[email] {
            for next in nexts {
                dfs(graph, &path, next, &visited)
            }
        }
    }
}

class Solution {
    class DisjointSetUnion {
        var parent = Array(repeating: 0, count: 10001)

        public init()  {
            for i in 0...10000 {
                parent[i] = i
            }
        }
        public  func find(_ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(parent[x])
            }
            return parent[x]
        }

        public  func union(_ x: Int, _ y: Int) {
            parent[find(x)] = find(y)
        }

    }
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        // dict, key as name, if value contains one of new values, merge into one, otherwise, append a new array
        // name -> [[emails],[email]]
        var dsu = DisjointSetUnion.init()
        var emailToName = [String: String]()
        var emailToID = [String: Int]()

        var id = 0
        for account in accounts {
            var name = ""
            for email in account {
                if name == ""{
                    name = email
                    continue
                }
                emailToName[email] = name
                if emailToID[email] == nil {
                    emailToID[email] = id
                    id += 1
                }
                dsu.union(emailToID[account[1]]!, emailToID[email]!)
            }
        }

        var ans = [Int:[String]]()
        for email in emailToName.keys {
            let index = dsu.find(emailToID[email]!)
            if ans[index] != nil {
                ans[index]!.append(email)
            } else {
                ans[index] = [email]
            }
        }

        var res = [[String]]()
        for value in ans.values {
            var test = value.sorted()
            test.insert(emailToName[value[0]]!, at: 0)
            res.append(test)
        }
        return res
    }
}

// Fastest solution swift:
/*
Question: Merge accounts of emails

Assumptions:
* Input could be empty?
* Could an account has empty emails?
* Different accounts might have the same name
* Bu the same account must have the same name

Approach: Union Find
* Use index to identify accounts
    * idToEmails = [Int: Set<String>]
    * emailToId = [String: Int]
    * nameToId = [String: Int]
* Use union find to join accounts
* Traverse the accounts
    * For each account, traverse the emails
        * nameToId[name] = index
        * For each email
            * If emailToId[email] != nil
                * union(i, index)
                * insert all emails to set and break
            * Else emailToId[email] = i
* Now idToEmails contains all unique accounts with their emails
* Traverse all id in idToEmails 
    * Sort the emails
    * Append to result array

*/

class Solution {
    private var parents = [Int]()
    
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        guard !accounts.isEmpty else { return [[String]]() }
        
        parents = [Int](repeating: 0, count: accounts.count)
        for i in 0..<accounts.count { parents[i] = i }
        
        var idToEmails = [Int: Set<String>]()
        var emailToId = [String: Int]()
        
        // Join accounts
        for i in 0..<accounts.count {
            let account = accounts[i]
            let name = account[0]
            
            for j in 1..<account.count {
                let email = account[j]
                if let index = emailToId[email] {
                    union(index, i)
                } else {
                    emailToId[email] = i
                }                
            }
        }
                
        // Insert emails to map, id -> emails
        for i in 0..<accounts.count {
            let root = find(i)
            let account = accounts[i]
            for j in 1..<account.count {
                idToEmails[root, default: Set<String>()].insert(account[j])
            }
        }
                
        var res = [[String]]()
        for (key, value) in idToEmails {
            var arr = [accounts[key][0]]
            arr += Array(value).sorted()
            res.append(arr)
        }
        
        return res
    }
    
    private func find(_ x: Int) -> Int {
        var root = parents[x]
        while root != parents[root] {
            root = parents[root]
        }
        parents[x] = root
        return root
    }
    
    private func union(_ x: Int, _ y: Int) {
        let rootX = find(x)
        let rootY = find(y)
        if rootX != rootY {
            parents[rootY] = rootX
        }
    }
}

// Solution 4
class Solution {
    
    private var parents = [Int]()
    
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        guard !accounts.isEmpty else { return [[String]]() }
        
        parents = [Int](repeating: 0, count: accounts.count)
        for i in 0..<accounts.count { parents[i] = i }
        
        // Step 1: Connect components 
        var emailToId = [String: Int]()
        for i in 0..<accounts.count {
            let account = accounts[i]            
            for j in 1..<account.count {
                let email = account[j]
                if let id = emailToId[email] {
                    union(id, i)
                } else {
                    emailToId[email] = i
                }
            }
        }
        
        // Step 2: Add emails to root id
        var idToEmails = [Int: Set<String>]()
        for i in 0..<accounts.count {
            let root = find(i)
            let account = accounts[i]
            for j in 1..<account.count {
                idToEmails[root, default: Set<String>()].insert(account[j])
            }
        }
        
        // Step 3: 
        var res = [[String]]()
        for (id, emails) in idToEmails {
            var arr = [String]()
            arr.append(accounts[id][0])
            arr.append(contentsOf: Array(emails).sorted())
            res.append(arr)
        }
        
        return res
    }
    
    private func union(_ i: Int, _ j: Int) {
        let rootA = find(i)
        let rootB = find(j)
        if rootA != rootB {
            parents[rootA] = rootB
        }
    }
    
    private func find(_ i: Int) -> Int {
        var root = i
        while root != parents[root] {
            root = parents[root]
        }
        parents[i] = root
        return root
    } 
}