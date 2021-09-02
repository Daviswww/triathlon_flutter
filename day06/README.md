### 前言
Hi, 我是魚板伯爵今天要教大家 Center 這個元件，教學內容只會擷取片段程式碼，建議大家搭配完整程式碼來練習。

> [完整程式碼](https://github.com/Daviswww/triathlon_flutter/tree/master/day06)

### Center 容器
想讓元件置中的話，可以使用 Center。

```dart
class DemoCenter extends StatelessWidget {
  const DemoCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.amber,
      ),
    );
  }
}
```
![](https://raw.githubusercontent.com/Daviswww/triathlon_flutter/master/day06/image/DrT35ku.png)