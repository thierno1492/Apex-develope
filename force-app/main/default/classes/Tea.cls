public class Tea{
    public static  Map<Integer, String> orderTea(){
        Map<Integer, String> m = new Map<Integer, String>(); // Define a new map
        m.put(1, 'First entry');                  // Insert a new key-value pair in the map
        m.put(2, 'Second entry');
        System.debug('first debug '+ m);                   // Insert a new key-value pair in the map
        System.assert(m.containsKey(1));  // Assert that the map contains a key
        String value = m.get(2); 
        String valueLis = m.get(1);               // Retrieve a value, given a particular key
        System.debug('value del m get '+ value);  
        System.debug('value del m get '+ valueLis);  
        System.assertEquals('Second entry', value);
        Set<Integer> s = m.keySet(); 
        System.debug('set integer '+ s); 
           // Return a set that contains all of the keys in the map
        return m;
    }
}