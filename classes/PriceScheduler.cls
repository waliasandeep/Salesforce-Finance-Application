//------------------------------------------------------------------------------------------------------------------------------------------
//Scheduled Class to update stock price 
//------------------------------------------------------------------------------------------------------------------------------------------
global class PriceScheduler implements schedulable{
    global void execute(SchedulableContext SC) {
        batchUpdateStockPrice obj =new batchUpdateStockPrice();
        database.executeBatch(obj);
    }
    
}