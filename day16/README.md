# Day16 Flutter Firebase Google Sign In (ios & android )


## 創建一個 Firebase 專案
取個專案名字下一步到底就可以了，若沒有`google analytics`就點開選單建造一個，然後一樣下一步到底。
![](https://i.imgur.com/Q5cC1Vi.png)

## 開啟 Google 登入
完成專案創就後點擊左邊Authentication，然後把google的登入給啟用。
![](https://i.imgur.com/myrDyyX.png)

儲存後你可以看到google的狀態變成已啟用(綠燈)
![](https://i.imgur.com/l89sA0T.png)


## 創建APP

回到專案總管這邊以下會介紹IOS和Andriod的創建方式。
![](https://i.imgur.com/RMfZ78n.png)


## Android 設定
### 第一步
![](https://i.imgur.com/VFM9v3l.png)

### 第二步
下載`google-services.json`放入`android/app`。
![](https://i.imgur.com/AUA7ont.png)

### 第三步
在`android/day16_android.iml`的`dependencies`層中加入`classpath 'com.google.gms:google-services:4.3.10'`
```json
dependencies {
    classpath 'com.android.tools.build:gradle:4.1.0'
    classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
    classpath 'com.google.gms:google-services:4.3.10'
}
```

在`android/app/build.gradle`加入`apply plugin: 'com.google.gms.google-services'`隨便加在最外層就可以了。

```gradle
apply plugin: 'com.android.application'
apply plugin: 'kotlin-android'
apply from: "$flutterRoot/packages/flutter_tools/gradle/flutter.gradle"
apply plugin: 'com.google.gms.google-services'
```
修改applicationId
![](https://i.imgur.com/6P2PXBr.png)

### 第五部
打開終端機輸入`keytool -list -v -alias androiddebugkey -keystore ~/.android/debug.keystore`，密碼就打個android然後你會得到SHA1和SHA256。
![](https://i.imgur.com/pwM2XQv.png)

回到firebase點開控制台溜到最下新增指紋，兩個都給他新增上去。
![](https://i.imgur.com/IWpcLA4.png)
![](https://i.imgur.com/3xlFDEz.png)
![](https://i.imgur.com/yfPvMm7.png)



## IOS 設定
### 第一步
才可
![](https://i.imgur.com/ESN5tgl.png)

### 第二步
開啟專案把`GoogleService-Info.plist`放入`ios/Runner`，然後345步驟都不重要下一步到底。
![](https://i.imgur.com/ZA13p6o.png)

### 第三步
打開`ios/Runner/Info.plist`把`GoogleService-Info.plist`裡面的`REVERSED_CLIENT_ID`複製到`<string>REVERSED_CLIENT_ID</string>`裡面。
```plist
<!-- Google Sign-In section -->
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <!-- TODO Replace this value: -->
            <!-- Copied from GoogleService-Info.plist key REVERSED_CLIENT_ID -->
            <string>REVERSED_CLIENT_ID</string>
        </array>
    </dict>
</array>
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsLocalNetworking</key>
    <true/>
</dict>
<!-- End of the Google Sign-In section -->
```

## Flutter 套件
安裝下載，如果ios有遇到pod的問題請到`ios/Podfile`把請版本打開，並更新一下`pod repo update`。
![](https://i.imgur.com/7odXW9M.png)

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_sign_in: ^5.0.5
  firebase_auth: ^3.0.1
  firebase_core: ^1.4.0
```

## App
在main裡面做初始化。
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
```

寫一個簡單的登入和登出的Class，來測試有沒有設定成功。

```dart
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepositoryImpl {
  Future<bool> signInWithGoogle();
  Future<void> signOut();
}

class AuthRepository implements AuthRepositoryImpl {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthRepository()
      : _firebaseAuth = FirebaseAuth.instance,
        _googleSignIn = GoogleSignIn();

  @override
  Future<bool> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      return false;
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _firebaseAuth.signInWithCredential(credential);

    return true;
  }

  @override
  Future<void> signOut() async {
    Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }
}

```
然後在頁面上的按鈕使用登入的函式
```dart
class LoginPage extends StatelessWidget {
  final AuthRepository _authRepository = AuthRepository();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
      ),
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: () async {
              final ok = await _authRepository.signInWithGoogle();
              if (ok) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              }
            },
            child: Text("SIGN IN"),
          ),
        ),
      ),
    );
  }
}
```
![](https://i.imgur.com/5j0iC5W.gif)

