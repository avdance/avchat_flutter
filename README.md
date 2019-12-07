## 组织方式

### 项目集成

Flutter现行的大约有两种集成的方式

- 源码集成
- 产物集成

~~经过权衡，这里采用了产物集成的方法来集成Flutter~~

更换为源码依赖.

### 开发环境

```shell
➜ flutter --version
Flutter 1.9.1+hotfix.6 • channel stable 
Tools • Dart 2.5.0
```

## 项目结构

```shell
.
├── android     //Android
├── ios         //IOS
├── assets      //Flutter 的资源文件
│   ├── fonts   //字体
│   └── images  //图片
├── lib         //Flutter主项目
│   ├── api     //接口地址
│   ├── event   //EvnetBus 
│   ├── main.dart   //入口
│   ├── model   //模型
│   ├── resources   //常量
│   ├── routers //Router
│   ├── utils   //工具类
│   ├── widgets  //控件
│   └── views   //页面文件
├── pubspec.lock
└── pubspec.yaml    //依赖文件
 

```


## 开发规范

### 版本管理

`master`  不可推送，只可以`pr` 

`develop`  日常开发目录

`feature/xxx`   个人开发分支，功能完成后合并回`develop`并且删除



### 其他待补充



