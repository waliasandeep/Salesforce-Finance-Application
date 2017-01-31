/*
    This class is used to update the Stock prices
    =============================================================
    Name                    Date                        version
    =============================================================   
    Sandeep Walia         12/28/2016                       1.1
    =============================================================  
*/
/**
* @author 
* @description -//
*/
global class batchUpdateStockPrice implements Database.Batchable<sObject>,Database.AllowsCallouts, Database.Stateful{

  // Query, whih contains all active accounts
  
  
  
  /**
  * @description - Start Method
  * @param BC 
  * @return Database.QueryLocator 
  */
   global Database.QueryLocator start(Database.BatchableContext BC)
   {
   	  //Fetching all the Stocks that are present in the org	
      String Query='SELECT Id,Market_Name__c,Stock_Code__c,Name FROM Stocks_Tracked__c ORDER BY CreatedDate DESC';
		


      return Database.getQueryLocator(Query);
   }
   /**
   * @description - Execute Method, In this method passing all  active accounts for processing.
   * @param BC 
   * @param scope 
   */
   global void execute(Database.BatchableContext BC, List<Stocks_Tracked__c> scope){
    
     
     List<Stocks_Tracked__c> lstStocks = new List<Stocks_Tracked__c>();
     String urlApp='';
       map<string,Id> m=new map<string,Id>();
    if(scope!= null && scope.size()>0)
    {
      for(Stocks_Tracked__c objStocks : scope)
      { 
        if (objStocks.Market_Name__c != null && objStocks.Stock_Code__c != null )
        {
          urlApp+=(objStocks.Market_Name__c+':'+objStocks.Stock_Code__c+',');
          m.put(objStocks.Market_Name__c+objStocks.Stock_Code__c,objStocks.Id);  
        }
      }
    }

     if(urlApp != '')
      {
         //Insert the new statement records for new month.
         System.debug('results========================================'+urlApp);
          getGoogleFinance.updatePrices(urlApp,m);
         //Database.SaveResult[] results = Database.Insert(lstStocks,false);
         //System.debug('results========================================'+results);
      }
    }
    /**
    * @description -Finish Method
    * @param BC 
    */
   global void finish(Database.BatchableContext BC){
   }
}