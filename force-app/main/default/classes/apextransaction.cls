public class apextransaction {
    public static void insertaccountandlead(string accname,string leadname, string companyname)
    {
    account a = new account(name ='accname');
    insert a;
    lead l1 = new lead(lastname ='leadname',company='companyname');
    insert l1;
    lead l2 = new lead(lastname ='leadname',company='APPLE');
    insert l2;
    }

    

}