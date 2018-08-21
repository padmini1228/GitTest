<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <outboundMessages>
        <fullName>NewOp1</fullName>
        <apiVersion>42.0</apiVersion>
        <description>Message sent when an opportunity is successfully closed</description>
        <endpointUrl>https://btssalesforce.servicebus.windows.net/notifications/opportunity</endpointUrl>
        <fields>AccountId</fields>
        <fields>Amount</fields>
        <fields>CloseDate</fields>
        <fields>ExpectedRevenue</fields>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>padmini.sidugonde@zensar.com</integrationUser>
        <name>NewOp1</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>Closed Opportunity</fullName>
        <actions>
            <name>NewOp1</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
