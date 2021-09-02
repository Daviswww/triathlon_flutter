Hi, 我是魚板伯爵今天要教大家 Stack 這個容器，教學內容只會擷取片段程式碼，建議大家搭配完整程式碼來練習。

> [完整程式碼](https://github.com/Daviswww/triathlon_flutter/tree/master/day07)

### Stack 容器
Stack可以將兩個以上的元件或容器堆疊在一起，而`alignment`可以控制元件對齊的地方，像是`Alignment.bottomCenter`(下中)、`Alignment.topCenter`(上中)等...


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

