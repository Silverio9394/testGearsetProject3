@isTest
public class BatchApexErrorEventTriggerTest {
	@isTest
    public static void PilotRatingBatchTest(){
        Mission__c m = new Mission__c();
        m.Subject__c = 'Capture the Sky!';
        m.Status__c = 'Complete';
        insert m;
        
        try{
            
            Test.startTest();
            Database.executeBatch(new PilotRatingBatch());
            Test.stopTest();
        } catch (Exception e){
            System.debug('e: ' + e);
        }
		// The batch job fires BatchApexErrorEvent if it fails, so deliver the event.
		Test.getEventBus().deliver();
    }
}