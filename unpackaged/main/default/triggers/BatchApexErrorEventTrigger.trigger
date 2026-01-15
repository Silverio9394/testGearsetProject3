trigger BatchApexErrorEventTrigger on BatchApexErrorEvent (after insert) {
    List<Error_Log__c> logsToInsert = new List<Error_Log__c>();
    
    for (BatchApexErrorEvent ev : Trigger.new){
        System.debug('ev: ' + ev);
        Error_Log__c el = new Error_Log__c();
    	el.Name = ev.EventUuid;
        el.Async_Apex_Job_Id__c = ev.AsyncApexJobId;
        el.Message__c = ev.Message;
        el.Stacktrace__c = ev.StackTrace;
        el.Job_Scope__c = ev.JobScope;
        el.Location__c = ev.Phase;
        el.Type__c = ev.ExceptionType;
        logsToInsert.add(el);
    }
		
    insert logsToInsert;
}