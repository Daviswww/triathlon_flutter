# Day3 Container
<style type="text/css">
    img {
        width: 250px;
        margin:auto;
        display:block;
    }
</style>
## 常用的屬性
- child：可以設定一個子元件
- color：背景顏色
- width: 寬
- height: 高

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
![](https://i.imgur.com/t3c9f8J.png)

## Alignment對齊方式
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
![](https://i.imgur.com/BhN4Wfg.png)
## Padding 內部間距
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
![](https://i.imgur.com/lW96VpA.png)
## Margin 外部間距
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
![](https://i.imgur.com/NoEAJwN.png)

## Constraints 最大與最小寬高設定
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
## Decoration
調整細節的屬性，例如`boxShadow`陰影、`border`編筐、`shape`形狀...，要注意的是如果在`Decoration`設置顏色的話，外部的`Container`就不能設置否則會有衝突，`Decoration`內的`borderRadius`與`shape`也會有衝突喔。


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
![](https://i.imgur.com/jB0Q94E.png)
