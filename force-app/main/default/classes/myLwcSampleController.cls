public with sharing class myLwcSampleController {
  @AuraEnabled
  public static Account registerAccount(String inputName){
    Account newAcc = new Account(Name=inputName);
    insert newAcc;
    return newAcc;
  }

  @AuraEnabled
  public static List<Account> searchAccount(String searchName){
    if(String.isBlank(searchName)){
      return [SELECT Id, Name FROM Account LIMIT 10];
    }
    return [SELECT Id, Name FROM Account WHERE Name =: searchName];
  }
}