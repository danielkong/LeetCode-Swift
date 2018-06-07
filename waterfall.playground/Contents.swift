    func wallsAndGates(_ rooms: inout [[Int]]) {
        // method 1: find gate(0) then update INF/value to shortest value
        // method 2: for each INF, find closest gate(0)
        
        for i in 0..<rooms.count {
            for j in 0..<rooms[0].count {
                if rooms[i][j] == 0 {
                    updateMap(i,j,&rooms, 0)
                }
            }
        }
    }
    
    func updateMap(_ i: Int, _ j: Int, _ rooms: inout [[Int]], _ val: Int) {
        if (i < 0 || i >= rooms.count || j < 0 || j >= rooms[0].count || rooms[i][j] < val) { return }
        rooms[i][j] = val
        updateMap(i-1, j, &rooms, val+1)
        updateMap(i+1, j, &rooms, val+1)
        updateMap(i, j-1, &rooms, val+1)
        updateMap(i, j+1, &rooms, val+1)
    }
    
    var matrix = [[0,-1,2147483647,-1],[-1,2147483647,-1,0]]
    wallsAndGates(&matrix)
    print(matrix)


//    [[Int,-1,0,Int],
//     [Int,Int,Int,-1],
//     [Int,-1,Int,-1],
//     [0,-1,Int,Int]]

