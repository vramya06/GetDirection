public class StringArrayTest {
    public static List<String> generateStringArray(Integer arrayLength) {
        List<String> stringList = new List<String>();
        for (Integer i = 0; i < arrayLength; i++) {
            stringList.add('Test ' + i);
        }
        return stringList;
    }
}