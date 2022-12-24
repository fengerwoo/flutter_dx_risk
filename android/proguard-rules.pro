-dontskipnonpubliclibraryclassmembers
-keepattributes *Annotation*,EnclosingMethod

-dontwarn com.dx.mobile.**
-dontwarn *.com.dx.mobile.**
-dontwarn *.com.mobile.strenc.**
-keep class com.dx.mobile.risk.**{*;}
-keep class com.security.inner.**{*;}
-keep class *.com.dx.mobile.**{*;}
-keep class *.com.mobile.strenc.**{*;}