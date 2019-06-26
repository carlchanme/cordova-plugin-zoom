#import <UIKit/UIKit.h>
#import <Cordova/CDVPlugin.h>

@interface CDVZoom : CDVPlugin

- (void)initZoom:(CDVInvokedUrlCommand*)command;
- (void)joinMeeting:(CDVInvokedUrlCommand*)command;
- (void)startZAKMeeting:(CDVInvokedUrlCommand*)command;

@end
