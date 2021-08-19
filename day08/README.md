# Day8 Text
<style type="text/css">
    img {
        width: 250px;
        margin:auto;
        display:block;
    }
</style>
Text可用來顯示文字的元件。

## Text
Text文字顯示元件，可以把想要顯示在畫面上的文字打在裡面。
```dart
class DemoText extends StatelessWidget {
  const DemoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hello World"),
    );
  }
}
```
如果顯示的東西是一個變數的話，必須要用`$str`包起來才行。
```dart
class DemoTextValue extends StatelessWidget {
  const DemoTextValue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String str = "World";
    return Column(
      children: [
        Text("Hello $str"),
      ],
    );
  }
}
```

如果字串是Class包起來之類的話那就要用`${}`包起來否則無法顯示喔！

```dart
class DemoTextClassValue extends StatelessWidget {
  const DemoTextClassValue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final word = Word();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Hello ${word.str}"),
      ],
    );
  }
}

class Word {
  final String str = "World";
}

```
![](https://i.imgur.com/TPtwuyR.png)

## TextStyle
文字的風格、大小和顏色等等都可以在TextStyle中做調整。
```dart
class DemoTextStyle extends StatelessWidget {
  const DemoTextStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hello World",
          style: TextStyle(
            color: Colors.red,
            fontSize: 50,
          ),
        ),
      ],
    );
  }
}
```
![](https://i.imgur.com/Pf3SkLk.png)

你還可以將你的style打包起來重複使用。
```dart
class DemoTextStyle extends StatelessWidget {
  const DemoTextStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hello World",
          style: myStyle(),
        ),
        Text(
          "Hello World",
          style: myStyle(),
        ),
        Text(
          "Hello World",
          style: myStyle(),
        ),
      ],
    );
  }

  TextStyle myStyle() {
    return TextStyle(
      color: Colors.red,
      fontSize: 50,
    );
  }
}
```
![](https://i.imgur.com/1qZ07P2.png)

## 切割字串
有時候在顯示文檔的時候會想把重點變成不一樣的顏色，你可以考慮使用RichText把多個字串包在一起。
```dart
class DemoRichText extends StatelessWidget {
  const DemoRichText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'Hi, ',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'Hello',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            TextSpan(
              text: ' World',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
![](https://i.imgur.com/vuxuUpX.png)

## Text字體變更
如果想要使用外部字體的話，需要先到`pubspec.yaml`最下面的fonts設定字體包的路徑，然後重新`build app`就可以使用設定的字體了。

pubspec.yaml
```yaml
  fonts:
    - family: asd
      fonts:
        - asset: assets/asd/asd-Regular.ttf
        - asset: assets/asd/asd-Italic.ttf
```

Widget:
```dart
class DemoTextFamily extends StatelessWidget {
  const DemoTextFamily({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Hello World",
        style: TextStyle(fontFamily: 'asd'),
      ),
    );
  }
}
```