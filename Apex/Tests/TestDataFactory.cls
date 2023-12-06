@isTest
public class TestDataFactory {

    public static final String ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    public static final String Record_Type_1 = 'Name';

    public static String generateRandomString(Integer length) {
        final String chars = ALPHABET;
        String randStr = '';
        while (randStr.length() < length) {
            Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
            randStr += chars.substring(idx, idx + 1);
        }
        return randStr;
    }
    public static String getRandomString(Integer length) {
        return generateRandomString(length);
    }
    public static String getRandomString() {
        return generateRandomString(25);
    }

    private static Integer randomWithLimit(Integer upperLimit) {
        Integer rand = Math.round(Math.random() * 1000);
        return Math.mod(rand, upperLimit);
    }
    public static Account generateAccount() {
        return generateAccount(getRandomString());
    }

    public static Account generateAccount(String name) {
        Id recordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get(Record_Type_1).getRecordTypeId();

        Account acc = new Account();
        acc.Name = name;
        acc.RecordTypeId = recordTypeId;
        insert acc;

        return acc;
    }

    public static Account generateAccountWithAgreementHolder(String name) {
        Id recordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get(Record_Type_1).getRecordTypeId();

        Account accAgreement = new Account();
        accAgreement.Name = name + ' Agreement';
        accAgreement.RecordTypeId = recordTypeId;
        insert accAgreement;

        Account acc = new Account();
        acc.Name = name;
        insert acc;

        return acc;
    }

    public static Opportunity generateOpportunity() {
        Account account = generateAccount();
        return generateOpportunity(getRandomString(), Date.today() + 1, Constants.OPPORTUNITY_STATUSES.STAGE_NEW, account, 'Dream Finance');
    }
    
    public static Opportunity generateOpportunity(String name, Date closeDate, String stage, Account account, String template) {
        Opportunity opp = new Opportunity();
        opp.Name = name;
        opp.CloseDate = closeDate;
        opp.StageName = stage;
        opp.AccountId = account.Id;
        insert opp;
        return opp;
    }

    public static Opportunity generateOpportunityWithoutTemplate(String name, Date closeDate, String stage, Account account) {
        Opportunity opp = new Opportunity();
        opp.Name = name;
        opp.CloseDate = closeDate;
        opp.StageName = stage;
        opp.AccountId = account.Id;
        insert opp;
        return opp;
    }

    public static Opportunity generateOpportunityWithRecordType(
            String name,
            Date closeDate,
            String stage,
            Account account,
            String recordType
    ) {
        Opportunity opp = new Opportunity();
        opp.Name = name;
        opp.CloseDate = closeDate;
        opp.StageName = stage;
        opp.AccountId = account.Id;
        opp.RecordTypeId = recordType;
        insert opp;
        return opp;
    }

    public static Lead generateLead() {
        return generateLead(getRandomString(), getRandomString(), getRandomString(), 'New', randomWithLimit(1000000) + '@testemail.com');
    }

    public static Lead generateLead(String status, Boolean autoresponse) {
        return generateLead(
                getRandomString(),
                getRandomString(),
                getRandomString(),
                status,
                randomWithLimit(1000000) + '@testemail.com',
                autoresponse ? System.now() : null
        );
    }
    public static Lead generateLead(String company, String firstName, String lastName, String status, String email) {
        return generateLead(company, firstName, lastName, status, email, null);
    }
    public static Lead generateLead(String company, String firstName, String lastName, String status, String email, Datetime automation) {
        Lead lead = new Lead();
        lead.Company = company;
        lead.FirstName = firstName;
        lead.LastName = lastName;
        lead.Status = status;
        lead.Email = email;
        lead.LeadSource = 'Website Form';
        insert lead;
        return lead;
    }
    public static Lead getNewLead() {
        return getNewLead('Email', 'Processing', 'English');
    }
    public static Lead getNewLead(String leadSource, String language) {
        Lead lead = new Lead();
        lead.Company = getRandomString();
        lead.FirstName = getRandomString();
        lead.LastName = getRandomString();
        lead.Status = 'New';
        lead.Email = randomWithLimit(1000000) + '@testemail.com';
        lead.LeadSource = leadSource;
        return lead;
    }

    public static Campaign generateCampaign(String name) {
        return generateCampaign(name, 'English');
    }
    public static CampaignMember generateCampaignMemeber(
            Id campaignId,
            Id currentCampaignStep,
            Id leadId,
            Id contactId,
            String firstEmailWeekday,
            Boolean launchManually,
            Date startDateOfMailing,
            String avatarEmailAddress
    ) {
        CampaignMember cmapaignMember = new CampaignMember(
                CampaignId = campaignId,
                LeadId = leadId,
                ContactId = contactId
        );
        return cmapaignMember;
    }

    public static Campaign_Step__c generateCampaignStep(
            Id campaignId,
            String templateId,
            Id nextStep,
            Integer durationDays,
            Boolean isFirstStep
    ) {
        Campaign_Step__c step = new Campaign_Step__c(
                Campaign__c = campaignId,
                Name = templateId,
                Email_Template_String__c = templateId,
                Next_Campaign_Step__c = nextStep,
                Duration_Days__c = durationDays,
                Is_First_Step__c = isFirstStep
        );
        return step;
    }

    public static Onboarding__c generateOnboarding(String name, Account account, String status, RecordType recordType) {
        UtilityTriggerHelper.isDepartmentCheckActive = false;
        Onboarding__c onb = new Onboarding__c();
        onb.Name = name;
        onb.AccountId__c = account.Id;
        onb.Status__c = status;
        onb.RecordTypeId = recordType.Id;
        insert onb;
        return onb;
    }

    public static Onboarding__c generateOnboarding(String name, Id accountId, String status, Id recordTypeId) {
        return generateOnboarding(name, new Account(Id = accountId), status, new RecordType(Id = recordTypeId));
    }


    public static EmailTemplate generateEmailTemplate(
            String name,
            String devName,
            Boolean isActive,
            String folderId,
            String templateType,
            String UIType
    ) {
        EmailTemplate emTemplate = new EmailTemplate();
        emTemplate.Name = name;
        emTemplate.DeveloperName = devName;
        emTemplate.IsActive = isActive;
        emTemplate.FolderId = folderId;
        emTemplate.TemplateType = templateType;
        emTemplate.UIType = UIType;
        emTemplate.HtmlValue = 'Test_Body';
        insert emTemplate;
        return emTemplate;
    }

    public static Messaging.InboundEmail.BinaryAttachment generateBinaryAttachment(String body, String fileName, String mimeTypeSubType) {
        Messaging.InboundEmail.BinaryAttachment attachment = new Messaging.InboundEmail.BinaryAttachment();
        attachment.body = blob.valueOf(body);
        attachment.fileName = fileName;
        attachment.mimeTypeSubType = mimeTypeSubType;
        return attachment;
    }

    public static Messaging.InboundEmail generateInboundEmail(
            String subject,
            String fromAddress,
            List<String> emailToAddresses,
            String plainTextBody,
            String fromName,
            Messaging.InboundEmail.BinaryAttachment[] binaryAttachments
    ) {
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        email.subject = subject;
        email.fromAddress = fromAddress;
        email.plainTextBody = plainTextBody;
        email.fromName = fromName;
        email.binaryAttachments = binaryAttachments;
        email.toAddresses = emailToAddresses;
        return email;
    }

    public static AccountTeamMember generateAccountTeamMember(Account acc, String teamMemberRole, User user) {
        UtilityTriggerHelper.isDepartmentCheckActive = false;
        AccountTeamMember accTeamMember = new AccountTeamMember(AccountId = acc.Id, TeamMemberRole = teamMemberRole, UserId = user.Id);
        insert accTeamMember;
        return accTeamMember;
    }

    public static Task generateTask(Id parentId) {
        Task taskObj = new Task();
        taskObj.Subject = 'Test';
        taskObj.OwnerId = UserInfo.getUserId();
        taskObj.Status = 'Open';
        taskObj.WhoId = parentId;
        taskObj.ActivityDate = Date.today().addDays(7);
        insert taskObj;
        return taskObj;
    }

    public static User generateSysAdmin() {
        Profile userProfile = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1];
        return generateUser(userProfile.Id, null, false);
    }

    public static User generateUser(String profileId, String userRoleId, Boolean isUnavailableForNpa) {
        String randomString = getRandomString();
        return new User(
                FirstName = randomString,
                LastName = randomString,
                Alias = 'aacco',
                Email = randomString + '@testemail.com',
                Username = randomString + '@testemail.com',
                CommunityNickname = 'User' + randomString,
                ProfileId = profileId,
                UserRoleId = userRoleId,
                LocaleSidKey = 'en_US',
                TimeZoneSidKey = 'GMT',
                LanguageLocaleKey = 'en_US',
                EmailEncodingKey = 'UTF-8'
        );
    }

    public static void deactivateOrgUsers() {
        List<User> users = [
                SELECT Id
                FROM User
                WHERE Id != :UserInfo.getUserId() AND IsActive = TRUE AND UserRole.Name IN :Constants.USER_ROLES.USER_ROLES_SET
        ];
        for (User u : users) {
            u.IsActive = false;
        }
        update users;
    }

    public static ContentNote generateContentNote() {
        String content = 'Hello';
        ContentNote note = new ContentNote(Title = 'Test', Content = Blob.valueOf(content));
        insert note;
        return note;
    }

    public static ContentDocumentLink createContentDocumentLink(Id documentId, Id recordId) {
        ContentDocumentLink contentDocumentLink = new ContentDocumentLink();
        contentDocumentLink.LinkedEntityId = recordId;
        contentDocumentLink.ContentDocumentId = documentId;
        insert contentDocumentLink;
        return contentDocumentLink;
    }

    public static Contact generateContact(Id accountId) {
        return generateContact(getRandomString(), accountId, null, false);
    }

    public static Contact generateContact(Id accountId, String email) {
        return generateContact(getRandomString(), accountId, email, null, false);
    }

    public static Contact generateContact(String lastName, Id accountId, Id merchantId, Boolean useForTmRequest) {
        Contact ct = new Contact();
        return generateContact(lastName, accountId, null, merchantId, useForTmRequest);
    }

    public static Contact generateContact(String lastName, Id accountId, String email) {
        Contact ct = new Contact();
        ct.LastName = lastName;
        ct.AccountId = accountId;
        ct.Email = email;
        insert ct;
        return ct;
    }

    public static Contact generateContactWithEmail(String lastName, Id accountId,  String email) {
        Contact ct = new Contact();
        ct.LastName = lastName;
        ct.AccountId = accountId;
        ct.Email = email;
        insert ct;
        return ct;
    }

    public static Case generateCase(String status, String webEmail) {
        Id recordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByDeveloperName()
                .get(Record_Type_1)
                .getRecordTypeId();
        status = status == null ? Constants.CASE_STATUSES.CASE_STATUS_NEW : status;
        Case cs = new Case();
        cs.RecordTypeId = recordTypeId;
        cs.Status = status;
        cs.SuppliedEmail = webEmail;
        insert cs;
        return cs;
    }

    public static EmailMessage generateEmailMessage(Id parentId, Boolean incoming) {
        EmailMessage em = new EmailMessage();
        em.ParentId = parentId;
        em.Incoming = incoming;
        insert em;
        return em;
    }

    public static Group generateGroup(String devName, String type) {
        Group gr = new Group();
        gr.Name = devName;
        gr.DeveloperName = devName;
        gr.Type = type;
        insert gr;
        return gr;
    }

    public static GroupMember generateGroupMember(Id groupId, Id userId) {
        GroupMember gm = new GroupMember();
        gm.GroupId = groupId;
        gm.UserOrGroupId = userId;
        insert gm;
        return gm;
    }

    public static Map<String, UserRole> generateUserRoles() {
        Map<String, UserRole> roles = new Map<String, UserRole>();
        for (String role : Constants.USER_ROLES.USER_ROLES_SET) {
            UserRole userRole = new UserRole(DeveloperName = generateRandomString(10), Name = role);
            roles.put(role, userRole);
        }
        insert roles.values();
        return roles;
    }
}
