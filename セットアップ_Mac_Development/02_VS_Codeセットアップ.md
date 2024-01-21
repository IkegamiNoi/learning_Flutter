## Flutter および Dart プラグインをインストールする
VS Codeを起動する。
VS Codeの左のタブから`Extensions`[^1]
[^1]:■が4つ有って1つ切り離されているマークのもの
`Extensions`の検索欄に`flutter`と入力しリストから[Flutter]を選択して[インストール]をクリックする。これにより、必要な Dart プラグインもインストールされる。

## Flutter Doctor でセットアップを検証する。
VS Codeの`View` > `Command Palette…`を開く。
`doctor`と入力し、 `Flutter: Run Flutter Doctor`を選択する。[^2]
[^2]:`Flutter SDK`が見つからないと言われたら選択肢に「Locate」とあるものを選択し、ポップアップされたディレクトリウィンドウから「$HOME/.zshrc」に書き込んだPATHの場所まで移動する。`bin`ディレクトリを`Flutter SDK`ディレクトリとして選択することによって、`flutter doctor`が動作する。