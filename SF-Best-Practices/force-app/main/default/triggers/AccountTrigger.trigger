trigger AccountTrigger on Account (before insert, before update, before delete,  after insert, after update, after delete, after undelete) {

    AccountTriggerHandler handler = new AccountTriggerHandler();

    if( TriggerSettingUtility.isTriggerActive(AccountTriggerHandler.SOBJECT_TYPE_ACCOUNT, null) ){
        if( Trigger.isBefore ){

            if( Trigger.isInsert && TriggerSettingUtility.isTriggerActive(AccountTriggerHandler.SOBJECT_TYPE_ACCOUNT, AccountTriggerHandler.TRIGGER_CONTEXT.BEFORE_INSERT) ){
                handler.OnBeforeInsert(Trigger.new);
            }

            if( Trigger.isUpdate && TriggerSettingUtility.isTriggerActive(AccountTriggerHandler.SOBJECT_TYPE_ACCOUNT, AccountTriggerHandler.TRIGGER_CONTEXT.BEFORE_UPDATE) ){
                handler.OnBeforeUpdate(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
            }

            if( Trigger.isDelete && TriggerSettingUtility.isTriggerActive(AccountTriggerHandler.SOBJECT_TYPE_ACCOUNT, AccountTriggerHandler.TRIGGER_CONTEXT.BEFORE_DELETE) ){
                handler.OnBeforeDelete(Trigger.old, Trigger.oldMap);
            }
        }
        else if( Trigger.isAfter ){

            if( Trigger.isInsert && TriggerSettingUtility.isTriggerActive(AccountTriggerHandler.SOBJECT_TYPE_ACCOUNT, AccountTriggerHandler.TRIGGER_CONTEXT.AFTER_INSERT) ){
                handler.OnAfterInsert(Trigger.new, Trigger.newMap);
            }

            if( Trigger.isUpdate && TriggerSettingUtility.isTriggerActive(AccountTriggerHandler.SOBJECT_TYPE_ACCOUNT, AccountTriggerHandler.TRIGGER_CONTEXT.AFTER_UPDATE) ){
                handler.OnAfterUpdate(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
            }

            if( Trigger.isDelete && TriggerSettingUtility.isTriggerActive(AccountTriggerHandler.SOBJECT_TYPE_ACCOUNT, AccountTriggerHandler.TRIGGER_CONTEXT.AFTER_DELETE) ){
                handler.OnAfterDelete(Trigger.old, Trigger.oldMap);
            }

            if( Trigger.isUndelete && TriggerSettingUtility.isTriggerActive(AccountTriggerHandler.SOBJECT_TYPE_ACCOUNT, AccountTriggerHandler.TRIGGER_CONTEXT.AFTER_UNDELETE) ){
                handler.OnAfterUndelete(Trigger.new, Trigger.newMap);
            }
        }
    }

}