public class FutureExample {
    @future(callout=true)    
    static void myFutureMethod(Set<Id> ids) {
        List<Contact> contacts = [SELECT Id, LastName, FirstName, Email
            FROM Contact WHERE Id IN :ids];
        for (Contact con: contacts) {
            String response = someClass.calloutMethod(con.Id,
                con.FirstName,
                con.LastName,
                con.Email);
        }
    }
}