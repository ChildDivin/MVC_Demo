//
//  WebserviceCaller.h
//  BlockPrograming
//
//  Created by Tops on 1/1/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AppDelegate;
typedef void(^WebMasterSuccessBlock)(id responseData);
typedef void(^WebMasterFailureBlock)(NSError *error);

typedef void(^SiAlertSuccessBlock)();
typedef void(^SiAlertCancelBlock)();


@interface WebserviceCaller : NSObject
+ (WebserviceCaller *)sharedSingleton;
-(void)baseWscalldispatch:(NSMutableDictionary *)params :(NSString *)fileNameURL success:(WebMasterSuccessBlock)successBlock;

-(void)baseWscalldispatchWithFail:(NSMutableDictionary *)params :(NSString *)fileNameURL
                          success:(WebMasterSuccessBlock)successBlock fail:(WebMasterFailureBlock)failBolck;

-(void)BaseWsCall:(NSMutableDictionary *)params :(NSString *)fileNameURL
          success:(WebMasterSuccessBlock)successBlock;
-(void)BaseWsCallWithFail:(NSMutableDictionary *)params :(NSString *)fileNameURL
                  success:(WebMasterSuccessBlock)successBlock  Failur :(WebMasterFailureBlock) FailerBloc;
-(void)baseImageUplaod:(NSMutableDictionary *)params :(NSString *)fileNameURL :(UIImage *)image :(NSString *)tag :(NSString *)strImageID
                sucess:(WebMasterSuccessBlock)successBlock;

-(void)baseMultipleImageUplaod:(NSMutableDictionary *)params :(NSString *)fileNameURL :(NSArray *)image :(NSArray *)tag
                        sucess:(WebMasterSuccessBlock)successBlock;

-(void)CustomAlert :(NSString *)title message:(NSString *)message OkButtonTitle:(NSString *)OkButtonTitle CancelButtonTitle:(NSString *)CancelButtonTitle
             success:(SiAlertSuccessBlock)successBlock
             Failure:(SiAlertCancelBlock)failure;

-(void)AjNotificationView :(NSString *)title :(int)AJNotificationType;
- (BOOL)isconnectedToNetwork ;

//-(void)callWebServiceImage:(NSMutableDictionary *)params :(NSString *)fileNameURL :(UIImage *)image :(NSString *)imgParamName success:(WebMasterSuccessBlock)onSuccess failure:(WebMasterFailureBlock)onFailure ;

@end
