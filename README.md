# flutterapp

## 1:flutter 三方库地址:https://pub.dev/

## 2:Flutter新建项目时遇到Pub get failed (server unavailable)问题的解决方案 (添加环境变量)  其他拉包慢还有get package fialed
  setx PUB_HOSTED_URL "https://pub.flutter-io.cn"
  setx FLUTTER_STORAGE_BASE_URL "https://storage.flutter-io.cn"
  flutter doctor(记得配置flutter环境变量)


## 3:Waiting for another flutter command to release the startup lock

   删除flutter SDK 下的/bin/cache/lockfile文件
   重启Android Studio

## 4.dio请求回来的数据不是Json字符串而是json对象
    设置:responseType: ResponseType.plain


