global with sharing class GetKnowledgeRecords{
@auraEnabled
public static list<KnowledgeArticleVersion> getAllknowledge()
    {
       list<KnowledgeArticleVersion> knowart =[select  id,  Title, ArticleType, KnowledgeArticleId, Language, VersionNumber,ArticleNumber, LastModifiedById, LastPublishedDate from KnowledgeArticleVersion WHERE Language = 'en_US'  AND  publishStatus = 'Online' WITH  DATA CATEGORY Iphone__c Below All__c ORDER BY Title ASC];
       return knowart;
    }

}