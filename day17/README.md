# Day17 Flutter 專案架構 (Domain Driven Design)
## 前言
身為一個軟體工程師，我們最常見的問題就是變動的需求。而程式碼變更，就會有機會出現不可預期 Bug，有時候已經不是小拇指和食指動一動就可以解決的問題，因此設計模式可以降低程式的債務。

## Domain Driven Design
這個架構在於每一層都有獨立的事情，我們可以使他們的工作分割得更乾淨，這將帶給程式乾淨、易於測試和閱讀，有的人認為小型團隊使用這種架構只會拖累開發速度，雖然我並不反對，但是壯大後會下定決心更改架構的很少，因為要改成新架構時要投入的時間可能會是好幾倍，有時候幾乎是打掉重練。
![](https://i.imgur.com/NUHhgax.png)

## 資料夾結構
這是我的簡單創建的資料夾結構，裡面最主要包含了上面所講的application(infrastructure與presentation的橋樑)、presentation(所有場景)、infrastructure(功能)和domain(訊息)清楚的分類著，乾淨的資料夾可以讓你更好找到你需要的檔案，往後的教學都會遵循這個規則創建任何檔案。
```
├── lib
│   ├── application
│   │   ├── auth
│   │   │   ├── auth_bloc.dart
│   │   │   ├── auth_event.dart
│   │   │   └── auth_state.dart
│   │   └── sign_in
│   │       ├── sign_in_bloc.dart
│   │       ├── sign_in_event.dart
│   │       └── sign_in_state.dart
│   ├── config
│   │   └── environment.dart
│   ├── domain
│   │   └── failure.dart
│   ├── infrastructure
│   │   └── auth
│   │       └── auth_repository.dart
│   ├── main.dart
│   └── presentation
│       ├── router
│       │   └── router.dart
│       └── screens
│           ├── home
│           ├── login
│           └── splash
```
## Note:
本次專案會平凡的使用bloc套件請大家熟悉，不熟的請到day13，如果還是不懂可以留言或是Google應該滿多人教的。

程式碼就跟泥巴球只會越滾越大，乾淨的程式可以降低維護成本。