# Belebel EC Project Infra 
                                                               |

## Preparation
- `{{ PROJECT_NAME_DETAIL}}` is `Belebel EC Project`
- `{{ PROJECT_NAME }}` is `belebel-ec`
- `{{ DOMAIN_NAME }}` is `belmate.site`
- in `{{ PROJECT_NAME }}-infra` repository, branch name is `production`, `development` when it starts development
- so, please rename the `main` to `production`.
- Rename the README title from `AWS FullStack Production` to `{{ PROJECT_NAME_DETAIL }} Infra`

## Phase 1 (Identity and Access Management Layer)
- Change all the variable in run.sh
- Create `{{ PROJECT_NAME }}-{{ APP_ENV }}-admin` User with IAMFullAccess Permission and CloudFormaitonFullAccess Permission.
- Generate AccessKey and SecretKey of `{{ PROJECT_NAME }}-{{ APP_ENV }}-admin` User
- Run 
``` 
sh automation/run.sh 1
```
- Wait for `1.1 Starts` 
- Input the AccessKey and SecretKey of `{{ PROJECT_NAME }}-{{ APP_ENV }}-admin` User
- Wait for `1.2 Done`  
- Generate and Input the AccessKey and SecretKey of `{{ PROJECT_NAME }}-{{ APP_ENV }}-deployment` User


## Phase 2 (Network Layer)
- Run 
```
sh automation/run.sh 2
```
- Please register the name servers in the onamae.com to complete this phase
- Please wait for 
  - DNS to finish the NameServerRecords and check `nslookup -type=NS {{ DOMAIN_NAME }}`
  - SSL to certificate the issue. 

## Phase 3 (Storage Layer)
- Store Database Credentials(DB\_USER, DB\_PASSWORD, DB\_NAME, DB\_PORT) in Secrets Manager.
- Store CodeBuild Credential(AWS\_ACCOUNT\_ID, APP\_ENV, DOCKER\_USERNAME, DOCKER\_PASSWORD)
- Run 
```
sh automation/run.sh 3
```
- Wait for `## 3.2 Done` 
- Store Database Credentials(DB\_HOST) in Secrets Manager.
- Build Docker Images of Server and Client for Phase 4 with CodeBuild.
- Check whether we can connect to the database via Database Management Tool(@cin-chan uses TablePlus for free.)
- Create a Table with tokiorisk-ocr-db repository.
- Create Cognito in GUI
- Store Database Credentials(DOMAIN\_URL, COGNITO\_USER\_POOL\_ID, COGNITO\_APP\_CLIENT\_ID) in Secrets Manager.
- Setup Cognito 
  - Create an App Client with Confidential Client, Don't Generate Client Secret, Check ALLOW\_CUSTOM\_AUTH, ALLOW\_USER\_SRP\_AUTH, ALLOW\_ADMIN\_USER\_PASSWORD\_AUTH, ALLOW\_USER\_PASSWORD\_AUTH.
  - Refrsh Token Expiration with 1day, Access TOken Expiration with 30 min, ID Token Expiratino with 30 min
  - Set Domain Name in Tokiorisk OCR Project in AppIntegration.
  - How quickly should temporary passwords set by administrators expire if not used? ==>> 3 Days
  - Attributes 
    - Which standard attributes are required? => email 
    - Do you want to add custom attributes? => custom:userID
    - How do you want your end users to sign in? => Username
  - Do you want to customize your user invitation messages?
    - need to change Email Subject and Email message, not SMS Message(Not Used in our service)
  - Do you want to customize your email verification messages?
    - need to change Email Subject and Email message(Not Used in our service) and set Code in Verification type.
- Set S3FullAccess and CognitoPowerUser to ServerTask Role.
- Create a S3 Bucket (`tokiorisk`)
- Update www.{{ Domain Name }} and api.{{ Domain Name }} with A Record in Route53 manually.

## Phase 4 

- Run ```sh automation/run.sh 4```

- Deployment completed

