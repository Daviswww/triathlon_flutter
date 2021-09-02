### 前言
Hi, 我是魚板伯爵今天要教大家 StatelessWidget & StatfulWidget，讓大家可以對這兩種部件有一點概念。

> [完整程式碼](https://github.com/Daviswww/triathlon_flutter/tree/master/day11)

### StatelessWidget
StatelessWidget 的意思是沒有狀態的 widget，也就是說不能改變內容。

```
class DemoStateless extends StatelessWidget {
  const DemoStateless({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

```

### StatfulWidget
StatefulWidget的createState將可變的狀態存放在裡面，以app點擊畫面當作範例，可以搭配setState來標記要更新的UI，當下次build的時候就會重新刷新。

```

class DemoStatful extends StatefulWidget {
  const DemoStatful({Key? key}) : super(key: key);

  @override
  _DemoStatfulState createState() => _DemoStatfulState();
}

class _DemoStatfulState extends State<DemoStatful> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

創建一個專案時的範例就使用StatfulWidget來更新數字的。

![](https://raw.githubusercontent.com/Daviswww/triathlon_flutter/master/day11/image/Hksssbd.png)