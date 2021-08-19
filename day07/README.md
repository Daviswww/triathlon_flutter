
# Day7 Stack
<style type="text/css">
    img {
        width: 250px;
        margin:auto;
        display:block;
    }
</style>
Stack可以將兩個以上的元件堆疊在一起，而alignment可以控制元件對齊的地方，像是Alignment.bottomCenter(下中)、Alignment.topCenter(上中)等...


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
![](https://i.imgur.com/RlilScz.png)