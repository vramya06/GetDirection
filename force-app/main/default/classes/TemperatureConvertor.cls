public class TemperatureConvertor {
   public static void FahrenheitToCelsius(decimal fh)
   {
       decimal celsius = ((fh-32)*5)/9;
       System.debug('Temperature in celsius:' +celsius.setScale(2));
   }

}