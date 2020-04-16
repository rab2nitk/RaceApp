public interface Queue{
    //returns the number of entries in the queue
    Integer size();
 
    //returns true if there are no entries in the queue
    boolean isEmpty();
 
    //places the record at the end of the queue
    void enqueue(MazeImpl.queueNode o);
 
    //returns the entry at the front of the queue but does not remove it
    MazeImpl.queueNode first();
 
    //returns and removes the entry at the front of the queue
    MazeImpl.queueNode dequeue();
}