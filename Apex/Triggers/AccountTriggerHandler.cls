public with sharing class AccountTriggerHandler{

    public static final String SOBJECT_TYPE_ACCOUNT = 'Account';

    public Enum TRIGGER_CONTEXT {
        ALL,
    	BEFORE_INSERT,
    	BEFORE_UPDATE,
    	BEFORE_DELETE,
    	AFTER_INSERT,
    	AFTER_UPDATE,
    	AFTER_DELETE,
    	AFTER_UNDELETE
    }

    public void OnBeforeInsert(List<Account> newAccounts){
        //code...
    }

	
    public void OnBeforeUpdate(List<Account> updatedAccounts, List<Account> oldAccounts, Map<Id, Account> updatedAccountsMap, Map<Id, Account> oldAccountsMap){   
        //code...
	}

	
    public void OnBeforeDelete(List<Account> oldAccounts, Map<Id, Account> oldAccountsMap){
        //code...
    }

    public void OnAfterInsert(List<Account> newAccounts, Map<Id, Account> newAccountsMap){
        //code...
    }

    public void OnAfterUpdate(List<Account> updatedAccounts, List<Account> oldAccounts, Map<Id, Account> updatedAccountsMap, Map<Id, Account> oldAccountsMap){
        //code...
    }

    public void OnAfterDelete(List<Account> oldAccounts, Map<Id, Account> oldAccountsMap){
        //code...
    }

	
    public void OnAfterUndelete(List<Account> newAccounts, Map<Id, Account> newAccountsMap){
        //code...
    }

}