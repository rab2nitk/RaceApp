public class importDataFromCSVController {
    public Blob csvFileBody{get;set;}
    public string csvAsString{get;set;}
    public String[] csvFileLines{get;set;}
    Public List<MazeImpl.Point> result {get;set;}
    public String output {get;set;}
    public List<List<Integer>> mazeMatrix {get;set;}
    public MazeImpl.Point destination {get;set;}
    public MazeImpl.Point sourceT {get;set;}
    
    public importDataFromCSVController(){
        csvFileLines = new String[]{}; 
    }
    
    public void importCSVFile(){   
        List<List<Integer>> maze = new List<List<Integer>>();
        MazeImpl.Point pX;
        MazeImpl.Point pY;
        try{
            csvAsString = csvFileBody.toString();
            csvFileLines = csvAsString.split('\n'); 
            
            for(Integer i=0;i<csvFileLines.size();i++){
                string[] csvRecordData = csvFileLines[i].split(',');
                List<Integer> columns = new List<Integer>();
                System.debug('columns ='+csvRecordData );
                if(csvRecordData.size() == 2){
                    System.debug('csvRecordData='+csvRecordData);
                    string[] source= csvFileLines[i].split(',');
                    if(String.isNotBlank(source[0]) && String.isNotEmpty(source[1])){
                        Integer tx = Integer.valueof(source[0].trim());
                        Integer ty = Integer.valueof(source[1].trim());
                        System.debug('tx='+tx+'ty='+ty);
                        System.debug('i=='+i+'csvFileLines='+csvFileLines.size());
                        if(i == csvFileLines.size()-2){
                            
                            pX = new MazeImpl.Point(tx,ty);
                            sourceT  = pX;
                            System.debug('pX='+px);
                        }
                        //Store Destination
                        if(i == csvFileLines.size()-1){
                            
                            pY = new MazeImpl.Point(tx,ty);  
                            destination = pY;
                            System.debug('pY='+pY); 
                        }
                    }
                    
                }else{
                    System.debug('csvRecordData='+csvRecordData);
                    for(String cols : csvRecordData){
                        // System.debug('cols='+cols);
                        if(String.isNotBlank(cols) && String.isNotEmpty(cols)){
                            Integer tt = Integer.valueof(cols.trim());
                            columns.add(tt);    
                        }
                        
                    }
                    
                    maze.add(columns);
                }
                
            }
            mazeMatrix  = maze;  
            MazeImpl  maz = new MazeImpl();
            result = maz.run(maze,pX,pY);
            
        }
        catch (Exception e)
        {
            System.debug('err='+e.getMessage()+'Line='+e.getLineNumber());
            ApexPages.Message errorMessage = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured while importin data Please make sure input csv file is correct');
            ApexPages.addMessage(errorMessage);
        }  
    }
}