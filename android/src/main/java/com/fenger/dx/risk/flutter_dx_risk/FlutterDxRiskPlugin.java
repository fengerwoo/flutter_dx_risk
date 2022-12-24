package com.fenger.dx.risk.flutter_dx_risk;

import android.app.Activity;
import android.os.Build;

import androidx.annotation.NonNull;

import com.dx.mobile.risk.DXRisk;

import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** FlutterDxRiskPlugin */
public class FlutterDxRiskPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Activity activity;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_dx_risk");
    channel.setMethodCallHandler(this);
  }



  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getToken")) {
      this.getToken(call, result);
    }else if(call.method.equals("requestPermissions")){
      this.requestPermissions(call, result);
    }else {
      result.notImplemented();
    }
  }

  private void getToken(@NonNull MethodCall call, @NonNull Result result){
    new Thread(new Runnable() {
      @Override
      public void run() {

        String appID = call.argument("appID");
        HashMap<String, String> params = call.argument("params");

        boolean isInit = DXRisk.setup(activity);
        if(!isInit){
          result.success(new HashMap(){{
            put("status", 0);
            put("message", "顶象SDK初始化失败");
            put("token", "");
          }});
          return;
        }

        String token = DXRisk.getToken(appID, params);
        result.success(new HashMap(){{
          put("status", 1);
          put("message", "获取到token");
          put("token", token);
        }});

      }
    }).start();
  }

  // 请求权限
  private void requestPermissions(@NonNull MethodCall call, @NonNull Result result){
    // API 23或以上的动态申请权限
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
      String[] permissionArray = {
              "android.permission.ACCESS_COARSE_LOCATION",
              "android.permission.ACCESS_FINE_LOCATION",
              "android.permission.ACCESS_BACKGROUND_LOCATION",
              "android.permission.WRITE_EXTERNAL_STORAGE",
              "android.permission.READ_EXTERNAL_STORAGE",
              "android.permission.READ_PHONE_STATE",
      };
      activity.requestPermissions(permissionArray, 1);
    }
    result.success(true);
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    activity = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {

  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
    onAttachedToActivity(binding);
  }

  @Override
  public void onDetachedFromActivity() {

  }

}
