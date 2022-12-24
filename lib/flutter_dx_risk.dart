
import 'dart:io';

import 'package:flutter/services.dart';



class FlutterDxRisk {

  // 方法通道
  static const methodChannel = const MethodChannel('flutter_dx_risk');

  /// 获取顶象设备指纹Token
  Future<String?> getToken({
    required String appID,
    Map params = const {},
  }) async {
    Map<String, dynamic>? result = await methodChannel.invokeMapMethod('getToken', {
      "appID": appID,
      "params": params,
    });

    if(result != null && result['status'] == 1){
      return result['token'];
    }
  }

  /// 请求可选权限，Android可调用
  Future<bool> requestPermissions() async{
    if(Platform.isAndroid){
      return await methodChannel.invokeMethod("requestPermissions");
    }
    return true;
  }



}
