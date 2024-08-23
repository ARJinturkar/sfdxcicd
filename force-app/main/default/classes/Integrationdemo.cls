@RestResource(urlMapping='/Integration/')
global with sharing class Integrationdemo {
   @httpGet
    global static AccWrapper Integrationdemo() {
        Map<String,String>  Indu = RestContext.request.params;
        List<Account> Accls = new List<Account>();
        String Indus = Indu.get('Industry');
        Accls =  [Select id, Name , annualrevenue from Account where annualrevenue != null and Industry = :Indus order by AnnualRevenue DESC limit 10];
        Set<ID> idset = new Set<ID>();
        for(Account acc : Accls){
            idset.add(acc.Id);
        }
        List<Contact> con = [Select Id, Name from Contact where AccountId IN :idset ];
        List<Case> ca = [Select Id, priority from Case where AccountID IN :idset];
       AccWrapper accwrap = new AccWrapper();
         accwrap.acclist= Accls;
         accwrap.conList= con;
         accwrap.caselist= ca;

         return accwrap;

    }

    @httpPost
    global static String Createaccount(String accName, String accRating , String accIndustry){
        Account acc = new Account();
        acc.Name= accName;
        acc.Rating= accRating;
        acc.Industry= AccIndustry;
        

        try {
            insert acc;
            return 'Account Created';
        } catch (Exception ex) {
            return 'Something Wrong';
        }
    }
    global class AccWrapper
    {
        global List<Account> acclist;
        global List<Contact> conList;
        global List<Case> caselist;
    }
}