# Day9 Button
<style type="text/css">
    img {
        width: 250px;
        margin:auto;
        display:block;
    }
</style>

- IconButton：圖示按鈕
- TextButton：文字按鈕
- OutlineButton：邊框按鈕
- ElevatedButton：漂浮按鈕

## IconButton 元件，常用屬性
可以加入小圖標的按鈕
- color：Icon的顏色
- highlightColor：當按鈕按下時的顏色
- splashColor：當按鈕按下時的水波顏色
- icon：按鈕Icon
- onPressed：按鈕按下時所調用的邏輯，若為`null`則不使用
- iconSize: Icon大小，預設為24


```dart
class DemoIconButton extends StatelessWidget {
  const DemoIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        iconSize: 50,
        color: Colors.amber,
        // 水波和觸發顏色為透明
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        icon: Icon(Icons.ac_unit),
        onPressed: () {
          log("click", name: "INFO");
        },
      ),
    );
  }
}
```
![](https://i.imgur.com/ScCusKo.png)

## TextButton 元件，常用屬性
文字按鈕
- style：利用`TextButton.styleFrom`變更按鈕顏色、風格
- child：子元件
- onPressed：點擊按鈕時觸發的邏輯
- onLongPress：長壓按鈕時觸發的邏輯

```dart
class DemoTextButton extends StatelessWidget {
  const DemoTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text(
          "Hello",
          style: TextStyle(color: Colors.white),
        ),
        style: TextButton.styleFrom(
          backgroundColor: Colors.green,
        ),
        onPressed: () {
          log("click", name: "INFO");
        },
        onLongPress: () {
          log("long click", name: "INFO");
        },
      ),
    );
  }
}
```
![](https://i.imgur.com/BMNn9z0.png)

## OutlinedButton 元件，常用屬性
會有編框的按鈕
- style：利用`OutlinedButton.styleFrom`變更按鈕顏色、風格
- child：子元件
- onPressed：點擊按鈕時觸發的邏輯
- onLongPress：長壓按鈕時觸發的邏輯

```dart
class DemoOutlinedButton extends StatelessWidget {
  const DemoOutlinedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlinedButton(
        child: Text("Hello"),
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.blueGrey,
        ),
        onPressed: () {
          log("click", name: "INFO");
        },
        onLongPress: () {
          log("long click", name: "INFO");
        },
      ),
    );
  }
}
```


## ElevatedButton 元件，常用屬性
這個按鈕會有漂浮的感覺。
- style：利用`ElevatedButton.styleFrom`變更按鈕顏色、風格
- child：子元件
- onPressed：點擊按鈕時觸發的邏輯
- onLongPress：長壓按鈕時觸發的邏輯

```dart
class DemoElevatedButton extends StatelessWidget {
  const DemoElevatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text("Hello"),
        style: ElevatedButton.styleFrom(
          elevation: 20,
        ),
        onPressed: () {
          log("click", name: "INFO");
        },
      ),
    );
  }
}
```
![](https://i.imgur.com/SNi5llt.png)

## 鎖住按鈕
若將onPressed後面帶null的話，按鈕就會變成灰色不能按。

```dart
class DemoNullButton extends StatelessWidget {
  const DemoNullButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlinedButton(
        child: Text("Hello"),
        onPressed: null,
      ),
    );
  }
}

```

![](https://i.imgur.com/MtvxwA1.png)