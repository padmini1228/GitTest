public without sharing class accountctrl {

    public List<Account> account{set;get;}
    
    public accountctrl(){
    
    account = [select id, Name,Type from Account];
    
    
    }

@AuraEnabled
    public static List<Account> getAccount() {
        List<Account> account= 
                [SELECT Id, Name, Type FROM Account];
        //Add isAccessible() check
        return account;
    }


}