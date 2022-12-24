# flutter\_dx_risk

🛡 顶象 Device fingerprint (UNIFYID®), Flutter version SDK, support Android, iOS

>  The unique identification of the device is generated through the hardware, network, environment and other characteristic information of the user's Internet access device, which can effectively identify risks such as emulator, flashing, Root, jailbreak, hijacking and injection.

> At present, the black gray industry and the wool party have professional equipment ranches, and use terminal equipment to commit crimes in batches and repeatedly by using simulators, flashing machines and changing machines. Malicious crawling, false registration, account theft, fleece extraction, promotional cheating and other malicious behaviors in finance, e-commerce and other industries under the Internet scene

Dingxiang device fingerprint generates a unique device identification that is resistant to cracking by hackers through the hardware, network, environment and other device characteristic information of the user's Internet access device. As an important tool under the defense-in-depth risk control system, it can realize risk environment identification, risk detection and behavioral risk analysis on terminal equipment


SDK official website address:
[https://www.dingxiang-inc.com/business/fingerprint](https://www.dingxiang-inc.com/business/fingerprint)



## quick start

### add dependencies
``` yaml
dependencies:
  flutter_dx_risk: ^1.0.6
```


### A minimal usage example

``` dart
import 'package:flutter_dx_risk/flutter_dx_risk.dart';

// Pass in the AppID created by the DingXiang background, call to get the device fingerprint Token, 
// you need to send the token to the server, and the server will get the device fingerprint, device risk and other information
String? token = await FlutterDxRisk().getToken(appID: '');

```

### Notes on Android access

API 6.0 or above dynamic permission application

``` dart
// Before obtaining the Token, call the dynamic request permission, and the obtained risk information will be more accurate
await FlutterDxRisk().requestPermissions();

```

Error: [Manifest merger failed : Attribute application@label](https://blog.csdn.net/weixin_44720673/article/details/120200655)

1. Open the AndroidManifest.xml file of the Android project

2. In the following example, import tools in the manifest, name the tools, and add a label to the application to replace the conflict

``` xml
<manifest 
    xmlns:tools="http://schemas.android.com/tools"> <!-- Import tools name in manifest -->
   <application
        tools:replace="android:label"> <!--  application add label conflict replace -->
    </application>
</manifest>    

```


### Native SDK version
Android：v6.1.6r.8f480124

iOS：v6.1.4r.578bf7d1


### demo experience
Demo APK Download：[app-release.apk](https://github.com/fengerwoo/flutter_dx_risk/raw/main/example/app-release.apk)


### join the group chat
Scan the code and add me on WeChat to join the WeChat exchange group (please note: Flutter library flutter\_dx_risk)

<img src="https://github.com/fengerwoo/easy_anim/raw/main/doc/assets/wechat_qr.jpg" width="200" >

#### 🤗 🤗 🤗 Please star if it helps you