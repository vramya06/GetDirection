public with sharing class cc2 {

    public String getExt2M1() {
        return null;
    }


    public String ext1M1 { get; set; }
    public List<Account> getListAcc()
    {
        List<Account> myAcc = [SELECT id , name from Account];
        return myAcc;
    }
    public List<Opportunity> getListOpp()
    {
        List<Opportunity> myOpp = [SELECT id , name from Opportunity];
        return myOpp;
    }

}