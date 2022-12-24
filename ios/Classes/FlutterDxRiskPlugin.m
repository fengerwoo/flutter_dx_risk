#import "FlutterDxRiskPlugin.h"
#import <DXRiskStatic/DXRiskManager.h>

@implementation FlutterDxRiskPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_dx_risk"
            binaryMessenger:[registrar messenger]];
  FlutterDxRiskPlugin* instance = [[FlutterDxRiskPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if([@"getToken" isEqualToString:call.method]){
    [self getToken:call result:result];
  }else {
    result(FlutterMethodNotImplemented);
  }
}

// 获取Token
-(void) getToken:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSString *appID = call.arguments[@"appID"];
    NSDictionary *params = call.arguments[@"params"];
    
    // 初始化顶象指纹SDK
    BOOL isSuccess = [DXRiskManager setup];
    if(!isSuccess){
        // 初始化失败 直接报错返回
        result(@{@"status": @false, @"message": @"顶象SDK初始化失败", @"token":@""});
        return;
    }
    
    // 获取顶象指纹token
    NSString *constID = [DXRiskManager getToken:appID extendsParams:params];
    result(@{@"status": @true, @"message": @"获取到token", @"token":constID});
}



@end
