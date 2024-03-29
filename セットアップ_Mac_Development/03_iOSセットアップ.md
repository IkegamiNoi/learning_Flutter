iOS 用の Flutter アプリを開発するには、Xcode がインストールされた Mac が必要となる。
## このドキュメントは以下のページを参考にしている。
    https://docs.flutter.dev/get-started/install/macos

## Xcode をインストールする。
Mac App Storeから安定バージョンのXcodeをインストールする。※Webダウンロードでも良い。
以下をターミナルに流し、インストールしたXcodeを使えるようにする。[^1] [^2]
[^1]:最新の安定バージョンを使用している場合、以下のコマンドをターミナルで実行することによってXcodeを使用できるようになる。
[^2]:古いバージョンを使用する場合はそれを配置したディレクトリを指定する必要がある。 [^3]
[^3]:また、Flutterにて古いバージョンのXcodeを使用するのは非推奨。
```
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```
次にXcode ライセンス契約が署名されているか、Xcodeを開くか、
以下をターミナルに流して、確認する。
    sudo xcodebuild -license
色々とメッセージが表示されたら最後に以下のメッセージが表示される。
    By typing 'agree' you are agreeing to the terms of the software license agreements. Type 'print' to print them or anything else to cancel, [agree, print, cancel]
上記が表示されたら以下をターミナルに流す。
    agree
上記を流した後以下のメッセージが表示される。
※以下のメッセージが表示されない場合Xcodeのバージョンが古い可能性がある。
    Install Started
    1%.........20.........40.........60.........80......Install Succeeded
省略したメッセージは同一ディレクトリの以下のファイルに示す。
※最終行に規約の日付があるので確認すること。最新のバージョンと内容が異なる場合がある。
    iOS利用規約_En.txt
上記をGoogle翻訳で日本語訳したものを同一ディレクトリの以下のファイルに示す。
    iOS利用規約_Jp

iOS シミュレーターをセットアップする。
以下をターミナルに流すことによりシュミレーターを起動できる。
    open -a Simulator
シュミレーターの[ファイル] > [シミュレーターを開く]から別のデバイスを開くことができる。

シンプルな Flutter アプリを作成して実行する
以下をターミナルに流すことで、新しいFlutterアプリを作成できる。
    flutter create my_app
    cd my_app
    flutter run

