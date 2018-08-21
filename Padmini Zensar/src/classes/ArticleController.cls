public class ArticleController{

    public List<SelectOption> getdynamiclist() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('Test1','Test1'));
        options.add(new SelectOption('Test2','Test2'));
        
        return options;
    }


    public String selectedcategory { get; set; }

    public List<Knowledge__kav> articles { get; set; }

    public ArticleController()
    {
    articles  =[select  id,  Title, ArticleType, KnowledgeArticleId, Article_true__c,Language, VersionNumber,ArticleNumber, LastModifiedById, LastPublishedDate from Knowledge__kav WHERE Language = 'en_US'  AND  publishStatus = 'Online' WITH  DATA CATEGORY Iphone__c Below All__c ORDER BY Title ASC];
     }

    
    
    public static list<KnowledgeArticleVersion> getArticles ()
    {
       list<KnowledgeArticleVersion> articles  =[select  id,  Title, ArticleType, KnowledgeArticleId, Language, VersionNumber,ArticleNumber, LastModifiedById, LastPublishedDate from KnowledgeArticleVersion WHERE Language = 'en_US'  AND  publishStatus = 'Online' WITH  DATA CATEGORY Iphone__c Below All__c ORDER BY Title ASC];
       return articles;
    }
    
    
             
        public List<SelectOption> getDatacategories() {
            List<SelectOption> options = new List<SelectOption>();
            for (knowledge__DataCategorySelection datacat: [Select Id,DataCategoryName,ParentId from knowledge__DataCategorySelection ])
                options.add(new SelectOption(datacat.ID,datacat.DataCategoryName ));           
            return options;
        }
        
        
        public static List<DescribeDataCategoryGroupResult> describeDataCategoryGroupSample(){
    List<DescribeDataCategoryGroupResult> describeCategoryResult;
    try {
        //Creating the list of sobjects to use for the describe call
        List<String> objType = new List<String>();
        objType.add('KnowledgeArticleVersion');
        objType.add('Question');

        //Describe Call
        describeCategoryResult = Schema.describeDataCategoryGroups(objType);

        //Using the results and retrieving the information
        for(DescribeDataCategoryGroupResult singleResult : describeCategoryResult){
            //Getting the name of the category
            singleResult.getName();
            //Getting the name of label
            singleResult.getLabel();
            //Getting description
            singleResult.getDescription();
            //Getting the sobject
            singleResult.getSobject();
        }
    } catch(Exception e){
    }
    return describeCategoryResult;
}
        
       
}