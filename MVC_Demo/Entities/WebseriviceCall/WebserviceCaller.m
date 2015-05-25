//
//  WebserviceCaller.m
//  BlockPrograming
//
//  Created by Tops on 1/1/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "WebserviceCaller.h"
#import "AppDelegate.h"
#import "Reachability.h"
#import "Singleton.h"
#import "AFNetworking.h"

@implementation WebserviceCaller{
    AppDelegate *appDel;
}

static WebserviceCaller *singletonObj = NULL;
+ (WebserviceCaller *)sharedSingleton {
    @synchronized(self) {
        if (singletonObj == NULL)
            singletonObj = [[self alloc] init];
    }
    return(singletonObj);
}
- (id) init {
    appDel=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    return self;
}

-(void)baseWscalldispatch:(NSMutableDictionary *)params :(NSString *)fileNameURL
                  success:(WebMasterSuccessBlock)successBlock
{
    if ([self isconnectedToNetwork]) {
        NSString *url= [NSString stringWithFormat:@"%@%@",[[Singleton sharedSingleton] getBaseURL],fileNameURL];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if ([[responseObject objectForKey:@"FLAG"] boolValue]) {
                successBlock(responseObject);
            }else{
                //[StaticClass ShowAlert:[responseObject objectForKey:@"MESSAGE"]];;
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            //        [self AjNotificationView:@"Server Error " :AJNotificationTypeRed];
            //[StaticClass ShowAlert:@"Server Error "];
            //[StaticClass ShowAlert:error.description];
        }];
    }
}
-(void)baseWscalldispatchWithFail:(NSMutableDictionary *)params :(NSString *)fileNameURL
                          success:(WebMasterSuccessBlock)successBlock fail:(WebMasterFailureBlock)failBolck
{
    if ([self isconnectedToNetwork]) {
        NSString *url= [NSString stringWithFormat:@"%@%@",[[Singleton sharedSingleton] getBaseURL],fileNameURL];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
        {
             successBlock(responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            //        [self AjNotificationView:@"Server Error " :AJNotificationTypeRed];
            failBolck(error);
            //[StaticClass ShowAlert:@"Server Error "];
            //[StaticClass ShowAlert:error.description];
        }];
    }
}
-(void)BaseWsCall:(NSMutableDictionary *)params :(NSString *)fileNameURL
          success:(WebMasterSuccessBlock)successBlock {
    appDel=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    if ([self isconnectedToNetwork]) {
        NSString *url= [NSString stringWithFormat:@"%@%@",[[Singleton sharedSingleton] getBaseURL],fileNameURL];
       // [MBProgressHUD showHUDAddedTo:appDel.window animated:YES];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
       // manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/html"];
        [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
        {
       //     [MBProgressHUD hideHUDForView:appDel.window animated:YES];
            if ([[responseObject objectForKey:@"FLAG"] boolValue]) {
                successBlock(responseObject);
            }else{
          //     [StaticClass ShowAlert:[responseObject objectForKey:@"MESSAGE"]];;
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          //  [MBProgressHUD hideAllHUDsForView:appDel.window animated:YES];
          //  [StaticClass ShowAlert:@"Server Error "];
            //[StaticClass ShowAlert:error.description];
            //[self AjNotificationView:@"Server Error " :AJNotificationTypeRed];
            
        }];
    }
}
-(void)BaseWsCallWithFail:(NSMutableDictionary *)params :(NSString *)fileNameURL
                  success:(WebMasterSuccessBlock)successBlock  Failur :(WebMasterFailureBlock) FailerBloc{
    appDel=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    if ([self isconnectedToNetwork])
    {
        NSString *url= [NSString stringWithFormat:@"%@%@",[[Singleton sharedSingleton] getBaseURL],fileNameURL];
        //[MBProgressHUD showHUDAddedTo:appDel.window //animated:YES];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        // manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/html"];
        [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
        //     [MBProgressHUD hideAllHUDsForView:appDel.window animated:YES];
             successBlock(responseObject);
             
         } failure:^(AFHTTPRequestOperation *operation, NSError *error)
        {
//            [MBProgressHUD hideAllHUDsForView:appDel.window animated:YES];
//             [StaticClass ShowAlert:@"Server Error "];
             FailerBloc(error);
            //[StaticClass ShowAlert:error.description];
             //[self AjNotificationView:@"Server Error " :AJNotificationTypeRed];
            
         }];
    }
}
-(void)baseImageUplaod:(NSMutableDictionary *)params :(NSString *)fileNameURL :(UIImage *)image :(NSString *)tag :(NSString *)strImageID
                sucess:(WebMasterSuccessBlock)successBlock{
    
    NSString *url= [NSString stringWithFormat:@"%@%@",[[Singleton sharedSingleton] getBaseURL],fileNameURL];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:url]];
    NSString *myUniqueName = [NSString stringWithFormat:@"image%lu", (unsigned long)([[NSDate date] timeIntervalSince1970]*10.0)];
    NSString *fileName = [NSString stringWithFormat:@"%@.jpg",myUniqueName];
    NSData *imageData;
    if ([strImageID isEqualToString:@""])
    {
        UIImage *imgFix =[self scaleAndRotateImage:image];
        imageData = UIImageJPEGRepresentation(imgFix, 0.5);
    }
    
    NSLog(@"File name %@",fileName);
     manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];;
    AFHTTPRequestOperation *op = [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //do not put image inside parameters dictionary as I did, but append it!
        if ([strImageID isEqualToString:@""])
        {
           [formData appendPartWithFileData:imageData name:tag fileName:fileName mimeType:@"image/jpeg"];
        }
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@ ***** %@", operation.responseString, responseObject);
        successBlock(responseObject);
        //[StaticClass ShowSimpleBlackAlert:operation.responseString];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
         //[StaticClass ShowSimpleBlackAlert:operation.responseString];
    }];
    [op start];
}
-(void)baseMultipleImageUplaod:(NSMutableDictionary *)params :(NSString *)fileNameURL :(NSArray *)image :(NSArray *)tag
                        sucess:(WebMasterSuccessBlock)successBlock{
    
    if ([image count] == [tag count]) {
        NSString *url= [NSString stringWithFormat:@"%@%@",[[Singleton sharedSingleton] getBaseURL],fileNameURL];
        AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:url]];
        AFHTTPRequestOperation *op = [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            //do not put image inside parameters dictionary as I did, but append it!
            int i=0;
            for (UIImage *img in image) {
                NSData *imageData = UIImageJPEGRepresentation(img, 0.5);
                [formData appendPartWithFileData:imageData name:[tag objectAtIndex:i] fileName:@"photo.jpg"   mimeType:@"image/jpeg"];
                i++;
            }
        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
            successBlock(responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@",error);
        }];
        [op start];
    }
}

//-(void)CustomAlert:(NSString *)title message:(NSString *)message OkButtonTitle:(NSString *)OkButtonTitle CancelButtonTitle:(NSString *)CancelButtonTitle success:(SiAlertSuccessBlock)successBlock Failure:(SiAlertCancelBlock)failure{
//    
//    SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:title andMessage:message];
//    if (OkButtonTitle!=nil) {
//        [alertView addButtonWithTitle:NSLocalizedString(OkButtonTitle, nil)
//                                 type:SIAlertViewButtonTypeDefault
//                              handler:^(SIAlertView *alertView)
//         {
//             successBlock();
//         }];
//    }
//    if (CancelButtonTitle!=nil)
//    {
//        [alertView addButtonWithTitle:NSLocalizedString(CancelButtonTitle, nil)
//                                 type:SIAlertViewButtonTypeDefault
//                              handler:^(SIAlertView *alertView)
//         {
//             failure();
//         }];
//    }
//    [alertView show];
//    
//}

-(void)AjNotificationView :(NSString *)title :(int)AJNotificationType{
    //    UIView *view=[[[[UIApplication sharedApplication] keyWindow] subviews] lastObject];
    //  [AJNotificationView showNoticeInView:appDel.window type:AJNotificationType title:title linedBackground:AJLinedBackgroundTypeAnimated hideAfter:1.5 offset:0 delay:0 detailDisclosure:YES response:^{
    NSLog(@"Notification Call");
    //  }];
}

- (BOOL)isconnectedToNetwork {
    //    if([AFNetworkReachabilityManager sharedManager].reachable)
    //        [[AlertView sharedAlertView] showAlertWithOKButton:LocalizedString(@"keyInternetConnectionError", @"")];
    //
    //    return [AFNetworkReachabilityManager sharedManager].reachable;
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    if(networkStatus == NotReachable)
    {
        [self CustomAlert:@"Internet Error" message:@"Please connect to internet" OkButtonTitle:nil CancelButtonTitle:@"Ok" success:^{
            //[self isconnectedToNetwork];
        } Failure:^{
        }];
    }
    return !(networkStatus == NotReachable);
}
#pragma mark -Image Rotation
- (UIImage *)scaleAndRotateImage:(UIImage *) image {
    int kMaxResolution = 320;
    
    CGImageRef imgRef = image.CGImage;
    
    CGFloat width = CGImageGetWidth(imgRef);
    CGFloat height = CGImageGetHeight(imgRef);
    
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    CGRect bounds = CGRectMake(0, 0, width, height);
    if (width > kMaxResolution || height > kMaxResolution) {
        CGFloat ratio = width/height;
        if (ratio > 1) {
            bounds.size.width = kMaxResolution;
            bounds.size.height = bounds.size.width / ratio;
        }
        else {
            bounds.size.height = kMaxResolution;
            bounds.size.width = bounds.size.height * ratio;
        }
    }
    
    CGFloat scaleRatio = bounds.size.width / width;
    CGSize imageSize = CGSizeMake(CGImageGetWidth(imgRef), CGImageGetHeight(imgRef));
    CGFloat boundHeight;
    UIImageOrientation orient = image.imageOrientation;
    switch(orient) {
            
        case UIImageOrientationUp: //EXIF = 1
            transform = CGAffineTransformIdentity;
            break;
            
        case UIImageOrientationUpMirrored: //EXIF = 2
            transform = CGAffineTransformMakeTranslation(imageSize.width, 0.0);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            break;
            
        case UIImageOrientationDown: //EXIF = 3
            transform = CGAffineTransformMakeTranslation(imageSize.width, imageSize.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationDownMirrored: //EXIF = 4
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.height);
            transform = CGAffineTransformScale(transform, 1.0, -1.0);
            break;
            
        case UIImageOrientationLeftMirrored: //EXIF = 5
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(imageSize.height, imageSize.width);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationLeft: //EXIF = 6
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.width);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationRightMirrored: //EXIF = 7
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeScale(-1.0, 1.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
            
        case UIImageOrientationRight: //EXIF = 8
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(imageSize.height, 0.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
            
        default:
            [NSException raise:NSInternalInconsistencyException format:@"Invalid image orientation"];
            
    }
    
    UIGraphicsBeginImageContext(bounds.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (orient == UIImageOrientationRight || orient == UIImageOrientationLeft) {
        CGContextScaleCTM(context, -scaleRatio, scaleRatio);
        CGContextTranslateCTM(context, -height, 0);
    }
    else {
        CGContextScaleCTM(context, scaleRatio, -scaleRatio);
        CGContextTranslateCTM(context, 0, -height);
    }
    
    CGContextConcatCTM(context, transform);
    
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, width, height), imgRef);
    UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageCopy;
}
@end
