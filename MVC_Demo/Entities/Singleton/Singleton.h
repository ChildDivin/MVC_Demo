//
//  Singleton.h
//  InstagramApp
//
//  Created by Webinfoways on 15/02/13.
//  Copyright (c) 2013 WebPlanex. All rights reserved.
//

#import <Foundation/Foundation.h>
//static NSMutableArray *arrUserPhotos;
@interface Singleton : NSObject {
    NSString *strDBPath;
    int intAppStateFlag;
    int intMatchIgnoreFlag;
    int intUserISNew;
    NSString *strNotificationMessageId;
    NSString *strNotificationMessageUserId;
    NSString *strNotificationMessageUserName;
    NSString *strButtonFlag;
    
}
@property (nonatomic, retain) NSString *strMyproFlag;
@property (nonatomic, retain) NSString *strDBPath;
@property (nonatomic, retain) NSString *strToken;
@property (nonatomic, retain) NSString *strPhotoIgnore;
@property (nonatomic, retain) NSString *strNewUser;
@property (nonatomic, retain) NSString *strLat;
@property (nonatomic, retain) NSString *strLong;
@property (nonatomic, retain) NSString *strMatchIgnoreCall;
@property (nonatomic, strong) id UserDetails;
@property (nonatomic, strong) NSMutableArray *arrUserPhotos;
@property (nonatomic, strong) NSMutableArray *arrNotifi_Data;
@property (nonatomic, strong) NSString *strNotificationMessageId;
@property (nonatomic, strong) NSString *strNotificationMessageUserId;
@property (nonatomic, strong) NSString *strNotificationMessageUserName;
@property (nonatomic, strong) NSString *strNotificationMessageUserImg;


+ (Singleton *)sharedSingleton;
- (NSString *) getBaseURL;

-(void) setDBPath : (NSString *) path;
-(NSString *) getDBPath;

-(void) setUserDetailsMethod : (id ) data;
-(id ) getUserDetails;

-(void) setDeviceToken : (NSString *) str;
-(NSString *) getDeviceToken;

-(void) setLatLongMethod : (NSString *)strLat :(NSString *)strLong;
-(NSString *) getLatMethod;
-(NSString *) getLongMethod;

-(void) setPhotoalbumIgnore : (NSString *) str;
-(NSString *)getPhotoalbumIgnore;
// New USer flag for display welscome screen in Near Screen
-(void) setNewUserFlagM : (NSString *) strNew;
-(NSString *)getNewUserFlagM;
//Set User photos

-(void) setUserProfileImagesM: (NSMutableArray *) arr;
-(NSMutableArray *)getUserProfileImagesM;

-(void) setmyprofileFlagM : (NSString *) str;
-(NSString *) getmyprofileFlagM;

-(void)setAppStateFlag :(int)intFlag;
-(int)getAppStateFlag;

-(void)setNotificationMessageId :(NSString *)strId;
-(NSString *)getNotificationMessageId;

-(void)setNotificationMessageUserId :(NSString *)strId;
-(NSString *)getNotificationMessageUserId;

-(void)setNotificationMessageUserName :(NSString *)strId;
-(NSString *)getNotificationMessageUserName;

-(void)setNotificationMessageUserImg :(NSString *)strId;
-(NSString *)getNotificationMessageUserImg;

-(void)setIsNewUserNotoficaton :(int)intFlag;
-(int)getIsNewUserNotoficaton;

-(void)setMatchCallIgnoreFlagM:(int)intFlagMatch;
-(int)getMatchCallIgnoreFlagM;

-(void)setButtoHideFlag :(NSString *)strId;
-(NSString *)getButtoHideFlag;
@end
