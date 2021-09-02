### 前言
Hi, 我是魚板伯爵今天要教大家 Container 這個元件，教學內容只會擷取片段程式碼，建議大家搭配完整程式碼來練習。

> [完整程式碼](https://github.com/Daviswww/triathlon_flutter/tree/master/day03)

### Container 常用的屬性
- child：可以設定一個子元件
- color：背景顏色
- width：寬
- height：高

```dart
class DemoBaseContainer extends StatelessWidget {
  const DemoBaseContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.amber,
      child: Text("Hello"),
    );
  }
}
```

![](https://raw.githubusercontent.com/Daviswww/triathlon_flutter/master/day03/image/t3c9f8J.png)



### Alignment對齊方式
裡面有各種對齊方式，像是`Alignment.center`(置中), `Alignment.topCenter`(上中),` Alignment.bottomLeft`(下左)...
```dart
class DemoBaseContainer extends StatelessWidget {
  const DemoBaseContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      alignment: Alignment.center,
      color: Colors.amber,
      child: Text("Hello"),
    );
  }
}

```
              

![](https://raw.githubusercontent.com/Daviswww/triathlon_flutter/master/day03/image/BhN4Wfg.png)

### Padding 內部間距
`EdgeInsets.all()`是四個的邊內部距離，如果只要單邊的話可以使用`EdgeInsets.only(left: 10, right: 10)`。
```dart
class DemoPaddingContainer extends StatelessWidget {
  const DemoPaddingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.amber,
      padding: EdgeInsets.all(30),
      child: Container(
        color: Colors.black,
      ),
    );
  }
}
```
![](https://raw.githubusercontent.com/Daviswww/triathlon_flutter/master/day03/image/lW96VpA.png)

### Margin 外部間距
`EdgeInsets.all()`是四個的邊內部距離，如果只要單邊的話可以使用`EdgeInsets.only(left: 10, right: 10)`，跟`Padding`設置一樣。
```dart
class DemoMarginContainer extends StatelessWidget {
  const DemoMarginContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.amber,
      child: Container(
        margin: EdgeInsets.all(30),
        color: Colors.black,
      ),
    );
  }
}
```
![](https://raw.githubusercontent.com/Daviswww/triathlon_flutter/master/day03/image/NoEAJwN.png)

### Constraints 最大與最小寬高設定
```dart
class DemoBaseContainer extends StatelessWidget {
  const DemoBaseContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 100,
        maxHeight: 100,
        minWidth: 50,
        minHeight: 50,
      ),
      alignment: Alignment.center,
      color: Colors.amber,
      child: Text("Hello"),
    );
  }
}
```

### Decoration
調整細節的屬性，例如`boxShadow`陰影、`border`邊筐、`shape`形狀...，要注意的是如果在`Decoration`設置顏色的話，`Container`就不能設置否則會有衝突，`Decoration`內的`borderRadius`與`shape`也會有衝突喔。


```dart
class DemoDecorationContainer extends StatelessWidget {
  const DemoDecorationContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.red,
            blurRadius: 4,
            offset: Offset(4, 8),
          ),
        ],
        color: Colors.amber,
        border: Border.all(
          color: Colors.black,
          width: 8,
        ),
        borderRadius: BorderRadius.circular(12),
        // shape: BoxShape.circle,
      ),
    );
  }
}
```
![](https://raw.githubusercontent.com/Daviswww/triathlon_flutter/master/day03/image/jB0Q94E.png)

### Note
不能用html不知道該怎麼調整圖片