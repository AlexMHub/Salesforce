public with sharing class Constants {

    public static final OnboardingManagersApiConstants ONBOARDING_MANAGERS_API = new OnboardingManagersApiConstants();
    public static final TeamMemberRoles TEAM_MEMBER_ROLES = new TeamMemberRoles();
    public static final UserRoles USER_ROLES = new UserRoles();
    public static final OpportunityStatuses OPPORTUNITY_STATUSES = new OpportunityStatuses();
    public static final RecordTypeDeveloperName RECORD_TYPE_DEV_NAME = new RecordTypeDeveloperName();
    public static final OppRecordTypeDeveloperName OPP_RECORD_TYPE_DEV_NAME = new OppRecordTypeDeveloperName();
    public static final LeadStatuses LEAD_STATUSES = new LeadStatuses();
    public static final AccountRelationshipStatuses ACCOUNT_RELATIONSHIP_STATUSES = new AccountRelationshipStatuses();
    public static final LeadSource LEAD_SOURCE = new LeadSource();
    public static final LeadType LEAD_TYPE = new LeadType();
    public static final UserProfilesName USER_PROFILES_NAME = new UserProfilesName();
    public static final CaseStatuses CASE_STATUSES = new CaseStatuses();
 


    public class CaseOrigins {
        public final String EMAIL = 'Email';
    }

    public class CaseSourses {
        public final String SOURCE_FOR_EMAIL_TO_CASE_CLIENT = 'Client';
    }

    public class UserProfilesName {
        public final String SYS_ADMIN = 'System Administrator';
    }

    public class RecordTypeDeveloperName {
        public final String REVIEW = 'REVIEW';
    }

    public class OnboardingStatuses {
        public final String STATUS_NEW = 'New';
    }

    public class OppRecordTypeDeveloperName {
        public final String FINANCIAL = 'Financial';
        public final String SALE = 'SALE';
    }


    public class CaseStatuses {
        public final String CASE_STATUS_NEW = 'New';
        public final String CASE_STATUS_IN_PROGRESS = 'In Progress';
        public final String CASE_STATUS_CLOSED_MANUALLY = 'Closed - manually';
    }

    public class EmailSender {
        public final String LEAD_GEN_AVATAR = 'LeadGen’s Avatar';
        public final String SALES_LEAD_OWNER = 'Sales Lead Owner';
        public final String SALES_COMMON = 'Sales Common email';
        public final String ACCOUNTS_COMMON = 'Accounts Common email';
    }

    TeamMemberRoles teamMemberRoles = new TeamMemberRoles();
        public final Map<String, String> USER_ROLE_BY_TEAM_MEMBER_ROLE = new Map<String, String>{
            teamMemberRoles.TEAM_MEMBER_ROLE_MANAGER => this.USER_ROLE_MANAGERS_LEAD
        };

    public class LeadStatuses {
        public final String LEAD_STATUS_NEW = 'New';
        public final String LEAD_STATUS_TODO = 'To Do';
        public final String LEAD_STATUS_TO_RESPONSE = 'To Response';
    }

    public class LeadSource {
        public final String EMAIL = 'Email';
        public final String UNDEFINED = '- (Undefined)';
    }

    public class LeadType {
        public final String INBOUND_LEAD_TYPE = 'Inbound';
        public final String UNDEFINED_LEAD_TYPE = 'Undefined (Closed By Automation)';
    }

    public class UserRoles {
        public final String USER_ROLE_HEAD_ACCOUNT_MANAGER = 'Head of Customer Success';
        public final String USER_ROLE_HEAD_SUPPORT_MANAGER = 'Head of Support';
        public final String USER_ROLE_HEAD_SALES_MANAGER = 'Head of Sales';
        public final String USER_ROLE_MANAGERS_LEAD = 'Managers Lead';

        public final Set<String> USER_ROLES_SET = new Set<String>{
            this.USER_ROLE_MANAGERS_LEAD
        };

        public final Set<String> HEAD_USER_ROLES_SET = new Set<String>{
            this.USER_ROLE_HEAD_ACCOUNT_MANAGER,
            this.USER_ROLE_HEAD_SALES_MANAGER,
            this.USER_ROLE_HEAD_SUPPORT_MANAGER
        };
    }

    
}
