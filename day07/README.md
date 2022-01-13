### 前言
今天要教大家 Stack(堆疊) 和 Positioned(位子)，Stack可以讓子部件堆疊，Positioned 則可以根據四個邊的距離來定位，這兩個常常組合再一起使用。教學內容只會擷取片段程式碼，建議大家搭配完整程式碼來練習。

> [完整程式碼](https://github.com/Daviswww/triathlon_flutter/tree/master/day07)

### Stack 
Stack可以將兩個以上的元件或容器堆疊在一起，以下是常用屬性。

- Alignment: 可以控制元件對齊的地方，像是`Alignment.bottomCenter`(下中)、`Alignment.topCenter`(上中)等...
- Fit:子部件根據Stack的大小縮放。`StackFit.loose`(子部件大小)、`StackFit.expand`(Stack大小)
- Overflow: 決定如何顯示超出Stack大小的部件。`Overflow.clip`(超出部分隱藏)、`Overflow.visible`(超出部分不會隱藏)

```dart
class DemoStack extends StatelessWidget {
  const DemoStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 100,
          height: 100,
          color: Colors.amber,
        ),
        Container(
          width: 75,
          height: 75,
          color: Colors.redAccent,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.blueAccent,
        ),
      ],
    );
  }
}
```
![](https://raw.githubusercontent.com/Daviswww/triathlon_flutter/master/day07/image/RlilScz.png)


### Positioned
`left`、`right` 、`top`、 `bottom`分別代表離Stack左、右、上、下四邊的距離。 `width`和`height`用於指定寬度和高度。

```dart
class DemoPositionedStack extends StatelessWidget {
  const DemoPositionedStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.amber,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
```


![](https://raw.githubusercontent.com/Daviswww/triathlon_flutter/master/day07/image/vghbjn.png)
