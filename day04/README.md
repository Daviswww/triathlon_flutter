### 前言
今天要教大家 Column 這個容器，教學內容只會擷取片段程式碼，建議大家搭配完整程式碼來練習。

> [完整程式碼](https://github.com/Daviswww/triathlon_flutter/tree/master/day05)

### 常用屬性
Column裡面的容器會以水平方式排列，`mainAxisAlignment`控制縱向對齊，`crossAxisAlignment`則是以橫向對齊，下面範例是置中。

```dart
class DemoColumn extends StatelessWidget {
  const DemoColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.redAccent,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.blueAccent,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyanAccent,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.limeAccent,
        ),
      ],
    );
  }
}

```

![](https://raw.githubusercontent.com/Daviswww/triathlon_flutter/master/day05/image/peWco3y.png)
