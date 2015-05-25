//
//  Singleton.m
//  InstagramApp
//
//  Created by Webinfoways on 15/02/13.
//  Copyright (c) 2013 WebPlanex. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton
@synthesize arrUserPhotos;
@synthesize strDBPath,strToken,strPhotoIgnore,strNewUser,strLat,strLong,strMyproFlag,strMatchIgnoreCall,arrNotifi_Data,strNotificationMessageUserName,strNotificationMessageUserId,strNotificationMessageId,strNotificationMessageUserImg;

static Singleton *singletonObj = NULL;

+ (Singleton *)sharedSingleton {
    @synchronized(self) {
        if (singletonObj == NULL)
            singletonObj = [[self alloc] init];
      //  arrUserPhotos =[[NSMutableArray alloc] init];
    }
    return(singletonObj);
}

// Server URL
- (NSString *) getBaseURL {
    //return @"http://192.168.0.143/parles/trunk/ws/";
    return @"http://topsdemo.in/mit/parles/ws/";
}

//Database path
-(void) setDBPath : (NSString *) path {
    self.strDBPath = path;
}
-(NSString *) getDBPath {
    return self.strDBPath;
}


// UserLoginInformation
-(void) setUserDetailsMethod : (id ) data{
    self.UserDetails=data;
}
-(id ) getUserDetails{
    return self.UserDetails;
}

//token
-(void) setDeviceToken : (NSString *) str{
    strToken=str;
}
-(NSString *) getDeviceToken{
    return strToken;
}

-(void) setPhotoalbumIgnore : (NSString *) str{
    strPhotoIgnore=str;
}
-(NSString *)getPhotoalbumIgnore{
    return strPhotoIgnore;
}

-(void) setNewUserFlagM : (NSString *) strNew;{
    strNewUser=strNew;
}
-(NSString *)getNewUserFlagM{
    return strNewUser;
}

-(void) setUserProfileImagesM:(NSMutableArray *) arr
{
    arrUserPhotos=arr;
}
-(NSMutableArray *)getUserProfileImagesM;
{
    return arrUserPhotos;
}

-(void) setLatLongMethod : (NSString *)str_lat :(NSString *)str_long
{
    strLong=str_lat;
    strLong=str_long;
}
-(NSString *) getLatMethod
{
    return strLat;
}
-(NSString *) getLongMethod
{
    return strLong;
}
-(void) setmyprofileFlagM : (NSString *) str
{
    strMyproFlag=str;
}
-(NSString *) getmyprofileFlagM
{
    return strMyproFlag;
}

-(void)setAppStateFlag :(int)intFlag {
    intAppStateFlag = intFlag;
}
-(int)getAppStateFlag {
    return intAppStateFlag;
}

-(void)setMatchCallIgnoreFlagM:(int)intFlagMatch {
    intMatchIgnoreFlag = intFlagMatch;
}
-(int)getMatchCallIgnoreFlagM {
    return intMatchIgnoreFlag;
}

-(void)setIsNewUserNotoficaton :(int)intFlag {
    intUserISNew = intFlag;
}
-(int)getIsNewUserNotoficaton {
    return intUserISNew;
}

-(void)setNotificationMessageId :(NSString *)strId {
    strNotificationMessageId = strId;
}
-(NSString *)getNotificationMessageId {
    return strNotificationMessageId;
}

-(void)setNotificationMessageUserId :(NSString *)strId {
    strNotificationMessageUserId = strId;
}
-(NSString *)getNotificationMessageUserId {
    return strNotificationMessageUserId;
}

-(void)setNotificationMessageUserName :(NSString *)strId {
    strNotificationMessageUserName = strId;
}
-(NSString *)getNotificationMessageUserName {
    return strNotificationMessageUserName;
}

-(void)setNotificationMessageUserImg :(NSString *)strId {
    strNotificationMessageUserImg = strId;
}
-(NSString *)getNotificationMessageUserImg {
    return strNotificationMessageUserImg;
}

// hide mail button in other user profile from favorite User screen
-(void)setButtoHideFlag :(NSString *)strId {
    strButtonFlag = strId;
}
-(NSString *)getButtoHideFlag{
    return strButtonFlag;
}

@end
