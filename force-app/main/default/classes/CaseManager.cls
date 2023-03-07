@RestResource(urlMapping ='/Cases/*')
Global with sharing  class CaseManager {
@HttpGet
    global static case getCaseById(){
        RestRequest request =RestContext.request;
        string caseId =request.requestURI.substring(request.requestURI.lastIndexof('/')+1);
        case result =[select CaseNumber,Subject,Status,Origin,Priority from case where Id=:caseId];
        return result;
        
    }
@HttpPost
    global static Id createCase(string sub,string sts,string ori,string pro)
     {
         case thiscase =new case(subject =sub,status=sts,origin=ori,priority=pro);
         insert thiscase;
         return thiscase.Id;
        
    }
@HttpDelete
    global static void deleteCase()
    {
         RestRequest request =RestContext.request;
        string caseId =request.requestURI.substring(request.requestURI.lastIndexof('/')+1);
        case thisCase =[select Id from case where id=:caseId];
        Delete thisCase;
    }
@HttpPut
          global static Id upsertCase(string sub,string sts,string ori,string pro,string id)
     {
         case thiscase =new case(Id=id,subject =sub,status=sts,origin=ori,priority=pro);
         insert thiscase;
         return thiscase.Id;
        
    }
@HttpPatch
     global static ID updateCaseFields()
    {
       RestRequest request =RestContext.request;
        string caseId =request.requestURI.substring(request.requestURI.lastIndexof('/')+1);
        case thisCase =[select Id from case where Id =:caseId];
        Map<string,object> params = (Map<string,object>)JSON.deserializeUntyped(request.requestBody.tostring());
        for(string fieldName:params.keySet())
        {
            thiscase.put(fieldName,params.get(fieldName));
         }
        update thiscase;
        return thiscase.Id;
    }
    
}