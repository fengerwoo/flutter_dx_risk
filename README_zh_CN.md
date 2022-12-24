# flutter\_dx_risk

🛡 顶象 设备指纹（UNIFYID®），Flutter版本SDK，支持Android、iOS

通过用户上网设备的硬件、网络、环境等特征信息生成设备的唯一标识，可有效识别模拟器、刷机改机、Root、越狱、劫持注入等风险。

> 黑灰产、羊毛党拥有专业的设备牧场，通过使用模拟器、刷机改机等手段，批量、反复地利用终端设备作案。对互联网场景下的金融、电商等行业，进行恶意爬取、虚假注册、账号盗用、薅羊毛、推广作弊等其他恶意行为

> 顶象设备指纹通过用户上网设备的硬件、网络、环境等设备特征信息， 生成可抗黑产破解的设备唯一标识。作为纵深防御风控体系下的重要工具，可实现对终端设备上的风险环境识别、风险检测及行为风险分析


SDK官网地址：
[https://www.dingxiang-inc.com/business/fingerprint](https://www.dingxiang-inc.com/business/fingerprint)



## 快速开始

### 添加依赖
``` yaml
dependencies:
  flutter_dx_risk: ^1.0.6
```


### 一个极简使用示例

``` dart
import 'package:flutter_dx_risk/flutter_dx_risk.dart';

// 传入DingXiang 后台创建的AppID，调用获取设备指纹Token
// 您需要将token发送到服务端，服务端去获取设备指纹、设备风险等信息
String? token = await FlutterDxRisk().getToken(appID: '');

```

#### Android 接入注意点

API 6.0或以上动态权限申请

``` dart
// 在获取Token前，调用动态请求权限，获取的风险信息会更准确
await FlutterDxRisk().requestPermissions();

```

报错：[Manifest merger failed : Attribute application@label](https://blog.csdn.net/weixin_44720673/article/details/120200655)

1，打开Android工程的 AndroidManifest.xml文件

2，如下示例，manifest 里导入tools命名、 application 添加label冲突替换

``` xml
<manifest 
    xmlns:tools="http://schemas.android.com/tools"> <!-- manifest 里导入tools命名  --> 
   <application
        tools:replace="android:label"> <!--  application 添加label冲突替换 --> 
    </application>
</manifest>    

```


### 原生SDK版本
Android：v6.1.6r.8f480124 <br/>
iOS：v6.1.4r.578bf7d1
<br/> <br/>


### Demo 体验
Demo APK下载：[app-release.apk](https://github.com/fengerwoo/flutter_dx_risk/raw/main/example/app-release.apk)


### 加入群聊
扫码加我微信加入微信交流群（请备注：Flutter库flutter\_dx_risk）

<img src="https://github.com/fengerwoo/easy_anim/raw/main/doc/assets/wechat_qr.jpg" width="200" >

#### 🤗 🤗 🤗 如果对您有帮助，请star