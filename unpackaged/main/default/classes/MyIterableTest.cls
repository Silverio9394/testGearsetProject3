@IsTest
public class MyIterableTest {

    @IsTest
    public static void testIterableForLoop(){
        List<String> strings = new List<String>{'Hello','World'};
            
        MyIterable myIt = new MyIterable(strings);
        
        for(String str : myIt){
            System.debug(str);
        }
    }
}