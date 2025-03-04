//
//  FBLogin.m
//  SalamPlanet
//
//  Created by Saad Khan on 04/11/2014.
//  Copyright (c) 2014 SalamPlanet. All rights reserved.
//

#import "FBLogin.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"

@implementation FBLogin
@synthesize delegate;
-(id)initWithKey:(NSString *)accountKey{
    self=[super init];
    if (self) {
        fbAccountkey=accountKey;
        [self facebookAccountInit];
    }
    return self;
}
-(void)facebookAccountInit
{
    if (!self.accountStore) {
        self.accountStore = [[ACAccountStore alloc]init];
    }
    ACAccountType *FBaccountType= [self.accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierFacebook];
    
    NSDictionary *dictFB = [NSDictionary dictionaryWithObjectsAndKeys:fbAccountkey,ACFacebookAppIdKey,@[@"email"],ACFacebookPermissionsKey, nil];
    
    [self.accountStore requestAccessToAccountsWithType:FBaccountType options:dictFB completion:
     ^(BOOL granted, NSError *e) {
         if (granted)
         {
             NSArray *accounts = [self.accountStore accountsWithAccountType:FBaccountType];
             //it will always be the last object with single sign on
             self.facebookAccount = [accounts lastObject];
             ACAccountCredential *facebookCredential = [self.facebookAccount credential];
             NSString *accessToken = [facebookCredential oauthToken];
             NSLog(@"Facebook Access Token: %@", accessToken);
             NSLog(@"facebook account =%@",self.facebookAccount);
             [self performSelectorOnMainThread:@selector(getMyFBInfo) withObject:nil waitUntilDone:NO];
//             [self getMyFBInfo];
         }
         else
         {
             NSLog(@"Please enable facebook from setting.");
             [self performSelectorOnMainThread:@selector(callDelegateFailedToFetchAnyAccount) withObject:nil waitUntilDone:NO];
         }
     }];
}
-(void)callDelegateFailedToFetchAnyAccount{
    [delegate failedToFetchAnyAccount];
}
-(void)callDelegateProfileHasBeenFetchedSuccessfullyWithInfo:(FBUserSelf *)fbUser{
    [delegate fbProfileHasBeenFetchedSuccessfullyWithInfo:fbUser];
}
-(void)callDelegatefbProfileDidNotFetched{
     [delegate fbProfileDidNotFetched];
}
-(void)getMyFBInfo
{
    
    NSURL *requestURL = [NSURL URLWithString:@"https://graph.facebook.com/me"];
    
    SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeFacebook requestMethod:SLRequestMethodGET URL:requestURL parameters:nil];
    NSLog(@"%@",request);
    request.account = self.facebookAccount;
    [request performRequestWithHandler:^(NSData *data, NSHTTPURLResponse *response, NSError *error) {
        
        if(!error)
        {
            NSDictionary *list =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            FBUserSelf * fbUser=[[FBUserSelf alloc]initWithDictionary:list];
            [self performSelectorOnMainThread:@selector(callDelegateProfileHasBeenFetchedSuccessfullyWithInfo:) withObject:fbUser waitUntilDone:NO];
        }
        else
        {
            NSLog(@"error from get%@",error);
            [self performSelectorOnMainThread:@selector(callDelegateFailedToFetchAnyAccount) withObject:nil waitUntilDone:NO];
        }
        
    }];
}
-(void)fetchUserInfo
{
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"/v2.3/me" parameters:nil]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 FBUserSelf * fbUser=[[FBUserSelf alloc]initWithDictionary:(NSDictionary*)result];
                 [self performSelectorOnMainThread:@selector(callDelegateProfileHasBeenFetchedSuccessfullyWithInfo:) withObject:fbUser waitUntilDone:NO];

             }
             else{
                 NSLog(@"Failed to fetch user info : %@", error.debugDescription);
                 [self performSelectorOnMainThread:@selector(callDelegatefbProfileDidNotFetched) withObject:nil waitUntilDone:NO];
                 //ShowMessage(kAppName, @"Something went wrong.Please try again later");
             }
             
         }];
     
    }
    else{
        [self loginFB];
    }
}

-(void)loginFB
{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile",@"email",@"user_birthday"]
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
         if (error) {
             NSLog(@"Process error");
            [appdelegate removeLoadingIndicator];
             ShowMessage(kAppName, @"Authentication Failed. Something wrong happened. Please try again later.");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
             [appdelegate removeLoadingIndicator];
             ShowMessage(kAppName, @"Authentication Canceled");
             
         } else {
             NSLog(@"Logged in");
             [self fetchUserInfo];
         }
     }];
}

@end
