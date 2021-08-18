
# Day5 Column
<style type="text/css">
    img {
        width: 250px;
        margin:auto;
        display:block;
    }
</style>

Column裡面的元件會以水平方式排列，`mainAxisAlignment`控制縱向對齊，`crossAxisAlignment`則是以橫向對齊，下面範例是置中。

![](https://i.imgur.com/QD0i3bt.png)

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
![](https://i.imgur.com/peWco3y.png)
