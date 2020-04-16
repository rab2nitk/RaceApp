public class AccountQueue implements Queue{
    
    private List<MazeImpl.queueNode> Accounts;
    
    //default constructor
    public AccountQueue(){
        this.accounts = new List<MazeImpl.queueNode>();
    }
    
    //returns the number of accounts in the queue
    public Integer size(){
        return accounts.size();
    }
    
    //returns true if there are no accounts in the queue
    public boolean isEmpty(){
        return accounts.isEmpty();
    }
    
    //places the account at the end of the queue
    public void enqueue(MazeImpl.queueNode o){
        //Account newAccount = (Account) o;
        accounts.add(o);
    }
    
    //returns the account at the front of the queue
    public MazeImpl.queueNode first(){
        if(isEmpty()){
            return null;
        }
        
        return accounts.get(0);
    }
    
    //returns and removes the account at the front of the queue
    public MazeImpl.queueNode dequeue(){
        if(isEmpty()){
            return null;
        }
        
        MazeImpl.queueNode firstAccount = accounts.get(0);
        accounts.remove(0);
        return firstAccount;
    }
}