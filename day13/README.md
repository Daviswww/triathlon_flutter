# Day13 Bloc

## 前言
Hi我是魚板伯爵，本次教學會用一個簡單的加一減一的範例來教大家這個套件，當你學會以後你的程式碼會變得非常乾淨堪稱藝術品等級，但是內容可能會有一點難希望大家可以看得懂。

## 安裝
Bloc 可以讓頁面與邏輯分離變得容易管理，你可以想像他是頁面與邏輯的橋樑，讓程式碼可以快速閱讀、易於測試和可重複使用，這就是為什麼我要介紹他的原因，以下是他的套件，如果你是用vscode的同學建議你可以安裝bloc，這個套件可以為你生成基本架構。
```yaml
dependencies:
  flutter:
    sdk: flutter
  bloc: ^7.0.0
  flutter_bloc: ^7.0.1
  equatable: ^2.0.3
```
![](https://i.imgur.com/gJVxbJL.png)

## Bloc 的流程

![](https://i.imgur.com/bNmf2xz.png)

為讓大家更容易理解，可以先把這個套件當成一台販賣機，你對販賣機投了10元(Event)，賣販機檢查你的金額(Bloc)，返回金額 10 元(State)，10元的飲料按鈕就會亮燈。

## 開始建立我們的 Bloc
如果有安裝vscode的bloc套件，只需要點擊右鍵就可以創建一個Bloc的基本架構，分別為Event、State和Bloc。
![](https://i.imgur.com/mrJcr2x.gif)

## 首先我們先從Model開始做起
我們的功能主要就只有兩個，第一個是加一，第二個是減一。先創建一個結構來定義我們的函式，我們可以在他上面寫一些說明文件，如果滑鼠移到上面則會說明這個API的用途。

```dart
abstract class CountRepositoryImp {
  /// Count model
  ///
  /// Increment one
  Future<int> add(int count);

  /// Count model
  ///
  /// Decrement one
  Future<int> dec(int count);
}

```
![](https://i.imgur.com/Fb8K560.png)


## 將我們的API給接上並實作內容
我們可以在一個Class後面加上implements剛剛創的API，接著對Class的按下快捷鍵(`command+.`、`control+.`、`command+ㄡ`、`control+ㄡ`)，就會跳出一個選項來生成我們的函式框架，然後就把我們的功能給實作出來。

![](https://i.imgur.com/sDaTg5u.gif)

```dart
class CountRepository implements CountRepositoryImp {
  @override
  Future<int> add(count) async {
    return ++count;
  }

  @override
  Future<int> dec(int count) async {
    return --count;
  }
}
```
## 使用者觸發事件 : Event
使用者處發的事件有兩個加一和減一，先在這兩個Event裡面宣告`count`，讓我們的數字作加減，當`count`傳進觸發的是加一事件，那他就必須把我的`count`加一後傳回來給我，toString則是可以讓我們看到事件觸發時傳進去的內容。

```dart
part of 'mybloc_bloc.dart';

abstract class MyblocEvent extends Equatable {
  const MyblocEvent();

  @override
  List<Object> get props => [];
}

class IncrementEvent extends MyblocEvent {
  final int count;

  const IncrementEvent(this.count);

  @override
  String toString() => 'IncrementEvent(count: $count)';
}

class DecrementEvent extends MyblocEvent {
  final int count;

  const DecrementEvent(this.count);

  @override
  String toString() => 'DecrementEvent(count: $count)';
}

```

## 回傳狀態：State
我的狀態分別切成MyblocInitial(初始)、Success(成功)和Failure(失敗)三個狀態，接著在Success裡宣告一個count來將處理完的count傳進來，然後對狀態名稱案下快捷鍵，選擇equatable就會生成`@override`的三段程式碼，不過我們有安裝equatable這個套件，因此我們可以把他縮短成一段讓我們程式碼更有效率，而這幾段程式碼則是幫我們檢查物件是不是相同，不是的話就可以幫我們做覆蓋的動作。

未使用：

```dart
class Success extends MyblocState {
  final int count;

  const Success(this.count);

  @override
  String toString() => 'Increment success(count: $count)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddSuccess && other.count == count;
  }

  @override
  int get hashCode => count.hashCode;
}

```

使用後：
```dart
class Success extends MyblocState {
  final int count;

  const Success(this.count);

  @override
  List<Object> get props => [count];
}
```

## 最重要的橋樑：Bloc 三部曲
Bloc中可以分成三個，第一個是初始化，第二個是判斷使用者事件，第三個是事件觸發後回傳的狀態，在這裡我們會用到`Stream`，`Stream`是用來接收一連串的事件，`Stream`會監聽目前狀態，若 Stream 有事件，則將告訴監聽器，而其他流程的寫法就以註解的方式來介紹。

```dart
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:day13/count_repository.dart';
import 'package:equatable/equatable.dart';

part 'mybloc_event.dart';
part 'mybloc_state.dart';

class MyblocBloc extends Bloc<MyblocEvent, MyblocState> {
  CountRepository _countRepository;

  // 初始化
  MyblocBloc({required CountRepository countRepository})
      : _countRepository = countRepository,
        super(MyblocInitial());

  // 觸發事件
  @override
  Stream<MyblocState> mapEventToState(
    MyblocEvent event,
  ) async* {
    // 當使用者處發加一的事件時
    if (event is IncrementEvent) {
      // 調用加一的狀態
      yield* _mapIncrementToState(event.count);
    }
    // 當使用者處發減一的事件時
    if (event is DecrementEvent) {
      // 調用減一的狀態
      yield* _mapDecrementToState(event.count);
    }
  }

  // 狀態
  Stream<MyblocState> _mapIncrementToState(int count) async* {
    // 成功加一的話回傳Success否則Failure
    try {
      final _count = await _countRepository.add(count);
      yield Success(_count);
    } catch (_) {
      yield Failure();
    }
  }

  // 狀態
  Stream<MyblocState> _mapDecrementToState(int count) async* {
    // 成功減一的話回傳Success否則Failure
    try {
      final _count = await _countRepository.dec(count);
      yield Success(_count);
    } catch (_) {
      yield Failure();
    }
  }
}
```

## 如何使用 Bloc
終於到了最後如何使用，原本想說拆成上下集，但是魚板國王不同意所以只好繼續說下去，不知道大家還有沒有跟上，就算沒跟上我還是要講下去，以下我會介紹Bloc的其中一種用法。

### BlocProvider
`BlocProvider`負責創建Bloc和一個元件，你將可以使用Bloc所有事件。

```dart
void main() {
  final countRepository = CountRepository();
  runApp(
    BlocProvider<MyblocBloc>(
      create: (context) => MyblocBloc(countRepository: countRepository),
      child: MyApp(),
    ),
  );
}
```

### BlocBuilder
`BlocBuilder`可以處理構建小部件以回應新狀態。
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocBuilder<MyblocBloc, MyblocState>(
        builder: (context, state) {
          log("$state");
          if (state is Success) {
            return MyHomePage(count: state.count);
          } else {
            // state is Failure
            return MyHomePage(count: 0);
          }
        },
      ),
    );
  }
}
```
## 使用事件
我們只需要在按鈕`onPressed`中寫下觸發的事件就可以了。

```dart
  TextButton(
    onPressed: () {
      BlocProvider.of<MyblocBloc>(context)
          .add(IncrementEvent(widget._count));
    },
    child: Text("Add"),
  ),
```
![](https://i.imgur.com/zBFmcBV.gif)

## Note:
Bloc還有其他的功能，MultiBlocProvider(創建多個Bloc)、BlocListener(聽取狀態但不能改變元件)、MultiBlocListener(聽取多個狀態但不能改變元件)等等...就讓大家自己摸索一下囉