public class MazeImpl{
    public class Point{
        
        Integer x;
        Integer y;
        public Point(Integer pX, Integer pY){
            this.x = pX;
            this.y = PY;
        }
    }
    public class queueNode{
        public Point pt;
        public Integer dist;
        public queueNode(Point pt,Integer dist){
            this.pt = pt;
            this.dist = dist;
        }
    }
    
    Point source;
    Point dest;
    Map<Point,Point> pathMap = new Map<Point,Point>();
    List<List<Integer>> maze = new List<List<Integer>>();
    public Integer ROWX;
    public Integer COLY;
    // check whether given cell (row, col) is a valid 
    // cell or not. 
    
    // These arrays are used to get row and column 
    // numbers of 4 neighbours of a given cell 
    Integer[] rowNum = new Integer[]{-1, 0,0,1};
        Integer[] colNum = new Integer[]{0, -1,1,0};
            List<Point> result = new List<Point>();
    
    public List<Point> getResultCoordinates(){
        printPath(source,dest,pathMap);
        return result;     
    }
    boolean isValid(Integer row, Integer col) 
    { 
        // return true if row number and column number 
        // is in range 
        
        return (row >= 0) && (row < ROWX) && 
            (col >= 0) && (col < COLY); 
    } 
    public List<List<boolean>> reset(List<List<Boolean>> visited){
        //I'll fill them up with a loop here  
        for(Integer i = 0; i < ROWX; i++) {
            //create the 'columns'
            List<boolean> columns = new List<boolean>();
            for(Integer j = 0; j <COLY; j++) {
                boolean d = false;
                columns.add(d);
            }
            visited.add(columns);
        }
        return visited;
    }
    public Integer printPath(Point px,Point dest,Map<Point,Point> pathMap){
        System.debug('pathMap='+pathMap);
        System.debug('px='+px+'dest='+dest);
        if(px.x == dest.x && px.y == dest.y){
            return 1;
        }else{
            Point path;
            for(Point pathX : pathMap.keySet()){
                System.debug('patxhX=='+pathX);
                if(pathX.x == dest.x && pathX.y == dest.y){
                    path = pathMap.get(pathX);    
                }
            }
            
            System.debug('path=='+path);
            result.add(path);
            return (printPath(px,path,pathMap));
        }
    }
    public Integer BFS(List<List<Integer>> maze, Point src, Point dest){
        
        //System.debug('maze[src.x][src.y]1='+maze[src.x][src.y]);
        //System.debug('maze[src.x][src.y]2='+maze[src.x][src.y]);
        
        // check source and destination cell 
        // of the matrix have value 1 
        if(maze[src.x][src.y] == 0 || maze[dest.x][dest.y] == 0) 
            return -1; 
        
        List<List<Boolean>> visited = new List<List<Boolean>>();
        reset(visited);
        visited[src.x][src.y] = true; 
        AccountQueue q = new AccountQueue();
        queueNode s = new queueNode(src,0);
        q.enqueue(s);
        //System.debug('q=='+q);
        while(!q.isEmpty()){
            queueNode curr = q.first(); 
            //System.debug('curr='+curr);
            Point pt = curr.pt;
            // If we have reached the destination cell, 
            // we are done 
            if (pt.x == dest.x && pt.y == dest.y){
                result.add(dest);
                return curr.dist;
            } 
            
            q.dequeue();
            // System.debug('deque='+q); 
            for (Integer i = 0; i < 4; i++) 
            { 
                Integer row = pt.x + rowNum[i]; 
                Integer col = pt.y + colNum[i]; 
                // System.debug('row='+row);
                //System.debug('cols='+col);
                // if adjacent cell is valid, has path and 
                // not visited yet, enqueue it.
                //System.debug(' isValid='+isValid(row,col));
                
                if (isValid(row, col) 
                    && maze[row][col] == 1 && !visited[row][col]) 
                { 
                    // mark cell as visited and enqueue it 
                    visited[row][col] = true; 
                    //System.debug('row='+row+'col='+col);
                    Point adj = new Point(row,col);
                    Integer distc = curr.dist + 1;
                    system.debug('adj ='+adj+'curr ='+curr );
                    pathMap.put(adj,curr.pt);
                    System.debug('currX='+curr.pt.x+'currY='+curr.pt.y+'distc ='+distc +'curr.dist='+curr.dist);
                    queueNode Adjcell = new queueNode(adj,distc); 
                    q.enqueue(Adjcell); 
                    //system.debug('adj ='+adj);
                    //System.debug('q==t='+q);
                } 
            }
            
        }
        
        return -1;
    }
    public List<Point> run(List<List<Integer>> mazeInput,MazeImpl.Point pX,MazeImpl.Point pY){
        
        maze = mazeInput;
        ROWX = maze.size();
        COLY = maze.get(0).size();
        System.debug('ROWX ='+ROWX);
        
        System.debug('COLY ='+COLY );
        source = pX;
        dest = pY;
        Integer dist = BFS(maze, source, dest); 
        System.debug('dist ='+dist);
        result.clear();
        printPath(source,dest,pathMap);
        return result;
    }
}