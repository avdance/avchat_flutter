## 组织方式

Flutter现行的大约有两种集成的方式

- 源码集成
- 产物集成

经过权衡，这里采用了产物集成的方法来集成Flutter



## 项目结构

```
.
├── FlutterEngine
├── avchat_flutter_android
├── avchat_flutter_ios
└── library_flutter
```

#### library_flutter

纯Flutter的项目，Android项目中的`aar`以及IOS项目中的`pod库`都是这个模块的编译产物

Android： flutter build apk --debug

IOS:   flutter build ios  --debug

#### FlutterEngine

这是一个中间产物，主要负责把`avchat_flutter_ios`中产生的文件，制作成`pod库`

> 有待完善

#### avchat_flutter_android

Android原生项目

#### avchat_flutter_ios

IOS原生项目



## 开发规范

### 版本管理

`master`  不可推送，只可以`pr` 

`develop`  日常开发目录

`feature/xxx`   个人开发分支，功能完成后合并回`develop`并且删除



### 其他待补充



