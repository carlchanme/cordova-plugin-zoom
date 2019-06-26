#import <Cordova/CDV.h>
#import <MobileRTC/MobileRTC.h>
#import "CDVZoom.h"
#import "MainViewController.h"

@interface CDVZoom ()<MobileRTCMeetingServiceDelegate, MobileRTCAuthDelegate> {
    
    UINavigationController *_navController;
    UIViewController *_vc;
    
}
@end

@implementation CDVZoom

- (void)initZoom:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    
    NSString* appKey = [command.arguments objectAtIndex:0];
    NSString* appSecret = [command.arguments objectAtIndex:1];
    NSString* zoomSDKDomain = [command.arguments objectAtIndex:2];
    
    _vc = [UIViewController new];
    _navController = [[UINavigationController alloc] initWithRootViewController:_vc];
    [_navController setNavigationBarHidden:YES];
    
    //1. Set MobileRTC Domain
    [[MobileRTC sharedSDK] initializeWithDomain:zoomSDKDomain enableLog:false];
    //2. Set MobileRTC Root Navigation Controller
    [[MobileRTC sharedSDK] setMobileRTCRootController:_navController];
    //3. MobileRTC Authorize
    MobileRTCAuthService *authService = [[MobileRTC sharedSDK] getAuthService];
    if (authService)
    {
        authService.delegate = self;
        
        authService.clientKey = appKey;
        authService.clientSecret = appSecret;
        
        [authService sdkAuth];
    }
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


- (void)joinMeeting:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    
    NSString* userName = [command.arguments objectAtIndex:0];
    NSString* meetingNumber = [command.arguments objectAtIndex:1];
    
    MobileRTCMeetingService *ms = [[MobileRTC sharedSDK] getMeetingService];
    if (ms)
    {
        ms.delegate = self;
        
        MobileRTCMeetError ret = [ms joinMeeting:meetingNumber displayName:userName];
        
        NSLog(@"onJoinaMeeting ret:%d", ret);
        
        [self.viewController presentViewController:_navController animated:YES completion:nil];
        
    }
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)startZAKMeeting:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    
    NSString* userID = [command.arguments objectAtIndex:0];
    NSString* userName = [command.arguments objectAtIndex:1];
    NSString* userToken = [command.arguments objectAtIndex:2];
    
    MobileRTCMeetingService *ms = [[MobileRTC sharedSDK] getMeetingService];
    if (ms)
    {
        ms.delegate = self;
        
        //for scheduled meeting
        //        MobileRTCMeetError ret = [ms startMeeting:kSDKUserID userToken:kSDKUserToken userType:ZoomSDKUserType_ZoomUser displayName:kSDKUserName meetingNumber:kSDKMeetNumber];
        
        //for instant meeting
        MobileRTCMeetError ret = [ms startInstantMeeting:userID userToken:userToken userType:ZoomSDKUserType_ZoomUser displayName:userName];
        
        NSLog(@"onMeetNow ret:%d", ret);
    }
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
