<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_campaign_details</fullName>
        <description>Send campaign details</description>
        <protected>false</protected>
        <recipients>
            <recipient>padmini.sidugonde@zensar.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Demo_Email_Template</template>
    </alerts>
    <fieldUpdates>
        <fullName>campaign_field</fullName>
        <field>IsActive</field>
        <literalValue>1</literalValue>
        <name>campaign field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Campaign workflow</fullName>
        <actions>
            <name>Send_campaign_details</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>campaign_field</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Test</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <tasks>
        <fullName>Approval_Task</fullName>
        <assignedTo>padmini.sidugonde@zensar.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Campaign.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Approval Task</subject>
    </tasks>
    <tasks>
        <fullName>Test</fullName>
        <assignedTo>padmini.sidugonde@zensar.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Campaign.EndDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Test</subject>
    </tasks>
</Workflow>
