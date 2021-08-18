
# Day4 Row
<style type="text/css">
    img {
        width: 250px;
        margin:auto;
        display:block;
    }
</style>

Row裡面的元件會以水平方式排列，`mainAxisAlignment`控制橫向對齊，`crossAxisAlignment`則是以縱向對齊，下面範例是置中。
![](https://i.imgur.com/Syvuzs2.png)


```dart
class DemoRow extends StatelessWidget {
  const DemoRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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

![](https://i.imgur.com/83caJhD.png)
