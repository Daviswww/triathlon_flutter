# Day6 Center
<style type="text/css">
    img {
        width: 250px;
        margin:auto;
        display:block;
    }
</style>
若想讓元件置中，可以使用Center。

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
![](https://i.imgur.com/DrT35ku.png)