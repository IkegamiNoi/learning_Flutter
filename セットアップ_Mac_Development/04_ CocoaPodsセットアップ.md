アプリがネイティブ macOS コードを備えたFlutter プラグインに依存している場合は、CocoaPods をインストールします。Ruby を使用して構築された CocoaPods は、Flutter と macOS コードにわたるさまざまな依存関係のバンドルを処理します。

CocoaPods をインストールしてセットアップするには、次のコマンドを実行します。

## 必要に応じてHomebrewをインストールします。
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Pathを通す。
[]内は自分のPCに合わせる。[^1]
[^1]: アップルマークをクリックすると`PC User Nameをログアウト`となっている。
```
 (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/[PC User Name]/.zprofile
```
```
eval "$(/opt/homebrew/bin/brew shellenv)"
```

## Homebrewを使用してrubyをインストールします。
```
brew install ruby
```

## Homebrewを使用してcocoapodsをインストールします。
```
brew install cocoapods
```

Homebrew を使用すると、チップセットとインストール権限に関する潜在的な問題が軽減されます。

