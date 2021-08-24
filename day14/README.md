# Day14 Http (上)：常用屬性
Hi我是魚板伯爵，http 套件可以讓你串接API，你可以利用他來做HTTP請求，是一個很ㄅㄧㄤˋ的工具。

## 安裝
```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.3
```
## IOS & Android 設定
你需要打開IOS和Android的設定檔，使他們同意使用網路。

### IOS檔案
路徑`/ios/Runner/Info.plist`。

```plist
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsLocalNetworking</key>
    <true/>
</dict>
```
![](https://i.imgur.com/3buuZ9L.png)

### Android檔案
路徑`/android/app/src/main/AndroidManifest.xml`。
```xml
android:usesCleartextTraffic="true"
```
![](https://i.imgur.com/inexWFm.png)


## 創建一個API
在這裡我使用[JSON Server](https://github.com/typicode/json-server)來當做測試的API，安裝完json-server後你可以修改`db.json`來制訂你的API格式。

```bash
$ json-server --watch db.json
```

```json
{
  "auth": [
    {
      "id": 1,
      "username": "json-server",
      "password": "asdasdlmasdmlasklmklmsad"
    }
  ]
}
```

## 建立資料模型
不管是傳送還是接收都希望資料的格式是固定的，若為不固定的資料格式可能會導致APP有錯誤。可以利用[Quicktype](https://quicktype.io/)來生成我們的API模型(推薦新手)，又或者使用使用快捷鍵(command+.)來生成，不過這個需要自己先定義好。

![](https://i.imgur.com/11FPxPz.png)

![](https://i.imgur.com/peH798I.png)

## API 接口管理

第一步我們一樣先創建一個API結構，要注意的是Android的模擬器接口是`http://10.0.2.2:3000`，IOS的接口是`localhost:3000`，而後面的port可以以自行修改，如果你的Local API Port是500就改500。

```dart
/// Android calls the http://10.0.2.2:3000/auth endpoint.
///
/// IOS calls the http://localhost:3000/auth endpoint.
abstract class ApiDataSource {
  /// Create new user.
  Future<String> createUser(User body);

  /// Get user info id, username, passowrd
  Future<String> getUser(int id);

  /// Update user data
  Future<String> updateUser(int id, User body);
}
```

## 實作API
先創建一個domain(使用的API)和client(http請求)，然後再對class名稱點擊快捷鍵，生成API框架。
```dart
class UserRepository implements ApiDataSource {
  final client = http.Client();
  final String domain = "http://localhost:3000";
}
```
![](https://i.imgur.com/zrQksFl.png)

## Http 常用三種請求
用這三個請求來實作創建使用者、取得使用者資料和更新使用者資料。
- POST：用於提交指定資源的實體，通常會改變伺服器的狀態。
- GET：用於請求只應用於取得資料。
- PUT：用於取代指定資料請求。



## 實作功能
我就以POST來做範例，首先使用`client.post`做POST請求，接著把使用者的資料模型轉成json的格式送出，請求成功後就可以得到response，你可以得到回應的資訊，完成後就可以用按鈕觸發了。

```dart
  @override
  Future<String> createUser(User body) {
    return _createUser(
      Uri.parse('$domain/auth'),
      body,
    );
  }

  Future<String> _createUser(
    Uri url,
    User body,
  ) async {
    try {
      final response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body.toJson(),
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      return e.toString();
    }
  }
```

```dart
TextButton(
  child: Text(
    "POST",
    style: TextStyle(fontSize: 30),
  ),
  onPressed: () {
    userRepository.createUser(
      User(
        username: "username",
        password: "password",
      ),
    );
  },
),
```