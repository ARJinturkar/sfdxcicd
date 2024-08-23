@IsTest
public class temperatureTest{

    @isTest
    private static void testTemperature()
    {
        System.assertEquals(21.11, temperature.temp(70));
        System.assertEquals(4.44, temperature.temp(40));
    }

}
