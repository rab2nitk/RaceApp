public with sharing class NewRaceApexController {
    @AuraEnabled
    public static Race__c newRaceDB(Race__c race) {
  
        insert race;
        return race;
    }

}