# The named parameter 'child' is required, but there's no orresponding argument. Try adding the required argument.

## 以下のコードの最初の`ElevatedButton`でエラーが出る。
``` Dart
children: [
                // ↓ And this.
                ElevatedButton(
                  onPressed: () {
                    appState.toggleFavorite();
                  },
                ),
                SizedBox(width: 10),
                
                ElevatedButton(
                  onPressed: () {
                    appState.getNext();  // ← This instead of print().
                  },
                  child: Text('Next'),
                ),
              ],
```
### 原因
2つ目のElevatedButtonのように`child: Text('Next'),`の部分がないため。
`child`が必須。