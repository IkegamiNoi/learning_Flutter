# Riverpodの理解に必要な情報をまとめる
## state
変化する値。状態。
## provider
stateを守る壁。Consumer Widgetはrefによって壁の中をのぞける。
## notifire
provider に守られた stateに変更をかける。

## コードを記述していく順番
state > notifire > provide

## stateのパターン
1. 単純データ
int,  string 0 1 2  'Hello'
2. 複雑データ
list, class  [a, b, c, d]
3. Futer系
Future<string> Futere.delayed()
画面で待機中のローディングマークなど
4. Stream
Stream<string> StreamController().stream
外から飛んでくるデータ。メールなど

## riverpod2におけるnotifierとproviderについて
| state | notifier | provide |
| ----- | -------- | ------- |
| 単純データ | Notifier | NotifierProvider |
| 複雑データ |          |                  |
| Future系 | AsyncNotifire | AsyncNotifierProvider |
| Stream   |               |                       |

## riverpod_genaraterを使用すれば上記の関係も気にしなくてよい