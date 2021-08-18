# Day2 安裝
### Install Flutter （macOS）
https://flutter.dev/docs/get-started/install/macos
### Get the Flutter SDK
1. 下載以下安裝包以獲取Flutter SDK的最新穩定版本:
[flutter_macos_1.22.5-stable.zip](https://storage.googleapis.com/flutter_infra/releases/stable/macos/flutter_macos_1.22.5-stable.zip)

2. 將文件打開到所需位置
```bash=
$ cd ~/development
$ unzip ~/Downloads/flutter_macos_1.22.5-stable.zip
```

3. 將Flutter工具添加到您的路徑：
```bash=
$ export PATH="$PATH:`pwd`/flutter/bin"
```

如果路徑加入後會消失的話可以參考一下步驟：
:::info
1. 開啟終端機後到達根目錄然後打開zshrc（如果因權限問題無法修改可輸入`sudo vim .zshrc`）

```bash=
$ cd ~
$ vim .zshrc
```
> 你也可以設定`bash`或其他的終端機。



2. 輸入 i 來新增路徑你的`Flutter(/bin:/Library/flutter/bin)`安裝路徑在`.bin:$PATH/`後面，例如：
```vim=
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH/bin:/Library/flutter/bin"
```
> 輸入完成後, 按下`esc`然後`:wq`儲存


3. 檢查是否成功設置
> 將設置的終端機關閉後重新開器一個新的終端機來檢查路徑是否設置成功。
```bash=
$ which flutter
```

:::

--- 
### 設置 VSCdoe
安裝VSCode的`Dart`套件包。
![](https://i.imgur.com/Ok6J2f9.jpg)
安裝VSCode的`Flutter`套件包。
![](https://i.imgur.com/QL4qXq8.jpg)

---
### 設置 XCode
1. 安裝Xcode的最新穩定版本（使用Web下載或Mac App Store）。
2. 通過從命令行運行以下命令，將Xcode命令行工具配置為使用新安裝的Xcode版本：
```bash=
$ sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
$ sudo xcodebuild -runFirstLaunch
```

3. 通過一次打開Xcode並`sudo xcodebuild -license`從命令行確認或運行來確保Xcode許可協議已簽署 。
:::info
使用Xcode，您將能夠在iOS設備或模擬器上運行Flutter應用。
:::

---
### 設置 模擬器
要準備在iOS模擬器上運行和測試您的Flutter應用，請執行以下步驟：

1. 在終端機中輸入以下命令
```bash=
$ open -a Simulator
```

2. 點擊模擬器右鍵，選擇Device->IOS->選擇一個模擬器安裝。（建議iPhone 5s以上）

3. 安裝完後就開著

---

### Create the app
首先創建一個新的專案，他會生成flutter所有需要的檔案。

```bash=
$ flutter create my_app_name
```

接著檢查設備確認與設備連線，通常他創建完後會直接幫你執行。
```bash=
$ flutter devices
```

:::info
1 connected device:

iphone X (mobile) • 3E841537-934D-4DBE-933A-3E1C9A5D727F • ios •
com.apple.CoreSimulator.SimRuntime.iOS-14-3 (simulator)
:::

執行APP如下面命令，，成功後的畫面如下:
```bash=
$ flutter run
```

![](https://i.imgur.com/vPUuq1N.jpg)


---
### Run flutter doctor
運行以下命令以查看是否需要安裝任何依賴項才能完成設置。
```bash=
$ flutter doctor
```
![](https://i.imgur.com/1rHwDHW.jpg)

---