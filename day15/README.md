# Day15 Http(下)：Error Hhandle 
## 前言
在原本的try＆catch中我們可以截取大部分的錯誤，但是這僅能告訴我成功或失敗，這並不能滿足我對程式追求的完美，這就是我要介紹他的原因，但是我只會介紹基本的功能。

## 安裝
```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.3
  dartz: ^0.9.2
  equatable: ^2.0.3
```

## Folding Either
Either這個型態分成左右兩邊，左邊狀態是錯誤時回傳，右邊則是成功的時候回傳，像是這樣子Either<Failure, User>。

```dart
return createUser.post.fold(
  (failure) => log("$failure"),
  (post) => log("$post"),
);
```

## 修改程式碼
首先創建一些錯誤時回傳的類別，當遇到錯誤時就會丟出我們指定的訊息。
```dart
abstract class ServiceFailure extends Equatable {
  const ServiceFailure();

  @override
  List<Object> get props => [];
}

class PostFailure extends ServiceFailure {
  final code;
  final message;

  PostFailure(this.code, this.message);

  @override
  List<Object> get props => [code, message];
}

class ServerException extends ServiceFailure {
  final message;

  ServerException(this.message);

  @override
  List<Object> get props => [message];
}

```
可以看到下面回傳有left和right兩種，當我post出去結果沒有創建新的使用者時，就可以馬上知道哪個環節出了問題，這就是一個基本的偵錯方法。
```dart
  Future<Either<ServiceFailure, User>> _createUser(
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
      if (response.statusCode == 201) {
        log(
          "${response.body}",
          name: response.statusCode.toString(),
        );
        return right(User.fromJson(response.body));
      } else {
        return left(PostFailure(
          response.statusCode,
          response.body,
        ));
      }
    } catch (e) {
      return left(ServerException(e));
    }
  }
```

## Note:
雖然他的功能有很多，但是你想要追求更完美更細節的偵錯導致綁手綁腳，那可就不是件好事了。