### 前言
Hi, 我是魚板伯爵今天要教大家 Auto Router 這個套件，教學內容只會擷取片段程式碼，建議大家搭配完整程式碼來練習。

> [完整程式碼](https://github.com/Daviswww/triathlon_flutter/tree/master/day03)

有時候App需要切換很多個頁面，或者太多頁面的路徑常常很難找出錯誤，我們可以使用Autorouter來幫助我們簡化程式碼，如果有哪個路徑不對，只需要檢查我們設定的參數是否有錯誤就可以了。

## 安裝套件
auto_route為我們這次主要的套件，而auto_route_generator與build_runner是為了可以生成我們路由的套件。
pubspec.yaml
```yaml
dependencies:
  flutter:
    sdk: flutter
  auto_route: ^2.3.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner:
  auto_route_generator: ^2.1.0
```

## AutoRouter 常用屬性
完成以下的的路由設定後，在終端機(Terminal)上執行`flutter pub run build_runner watch --delete-conflicting-outputs`指令就會生成出`router.gr.dart`的檔案。

- initial：預設路徑
- page：頁面
- path：自訂路徑
- children：子路徑

router.dart
```dart
import 'package:auto_route/auto_route.dart';
import 'package:day12/demo.dart';
import 'package:day12/transitions.dart';

// flutter pub run build_runner watch --delete-conflicting-outputs

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: LoginScreen, initial: true),
    AutoRoute(path: '/home-screen', page: HomeScreen),
  ],
)
class $AppRouter {}

```
## 主界面初始化路由
main.dart
```dart
import 'package:day12/demo.dart';
import 'package:day12/router.gr.dart';
import 'package:flutter/material.dart';

void main() {
  final AppRouter appRouter = AppRouter();
  runApp(
    MyApp(
      appRouter: appRouter,
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter;

  MyApp({
    Key? key,
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      builder: (context, router) => router!,
    );
  }
}
```
## 如何轉場
首先所有的場景都會在Stack裡，利用`replace`、`navigate`、`push`和`pop`，來控制所有頁面的進出。若後面有加上Named的元件則代表使用自己所定義的path來控制路由。
- replace：覆蓋原本的頁面
- navigate：如果沒在stack就加入
- push：加入一個新的介面在stack
- pop：退出stack


```dart
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginScreen"),
      ),
      backgroundColor: Colors.indigo[50],
      body: Center(
        child: TextButton(
          child: Text("Sign in"),
          onPressed: () {
            // 轉場
            AutoRouter.of(context).replaceNamed("/home-screen");
          },
        ),
      ),
    );
  }
}
```
![](https://i.imgur.com/vxfvUyN.gif)

## CustomRoute 使用其他的轉場動畫
- transitionsBuilder：轉場動畫設定
- durationInMilliseconds：轉場動畫時間

```dart
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: LoginScreen, initial: true),
    AutoRoute(path: '/home-screen', page: HomeScreen),
    CustomRoute(
      path: '/menu-screen',
      page: MenuScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 1000,
    ),
  ],
)
class $AppRouter {}
```
![](https://i.imgur.com/VUEcNnv.gif)

## 使用自己的轉場動畫
我們可以用`transitionsBuilder`來寫自己的轉場動畫，至於如何控制就交給大家自己摸索了，以下就寫一個簡單的範例給大家參考。
```dart
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: LoginScreen, initial: true),
    AutoRoute(path: '/home-screen', page: HomeScreen),
    CustomRoute(
      path: '/menu-screen',
      page: MenuScreen,
      transitionsBuilder: MyTransitions.slideBottomToTop,
      durationInMilliseconds: 1000,
    ),
  ],
)
class $AppRouter {}
```

```dart
class MyTransitions extends TransitionsBuilders {
  static const RouteTransitionsBuilder slideBottomToTop = _slideBottomToTop;

  static Widget _slideBottomToTop(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}

```

![](https://i.imgur.com/Rz1I1US.gif)

## Note:
由於是Gif的緣故可能有點卡頓的感覺。