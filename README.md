# WifiAPI

これは、フリーwifiをの場所を
[*Ruby on Rails チュートリアル: 実例を使って Rails を学ぼう*](http://railstutorial.jp/)
[Michael Hartl](http://www.michaelhartl.com/) 著

## APIの使い方
このアプリケーションのAPIの利用の仕方は以下のURLを参考にしてください。
https://aqueous-earth-88993.herokuapp.com/

## 使い方

このアプリケーションをローカル環境で動かす場合は、まずはリポジトリを手元にクローンしてください。
次に、次のコマンドで必要になる Ruby Gems をインストールします。

```
$ bundle install --without production
```

その後、データベースへのマイグレーションを実行します。

```
$ rails db:migrate
```

最後に、テストを実行してうまく動いているかどうか確認してください。

```
$ rails test
```

テストが無事に通ったら、Railsサーバーを立ち上げる準備が整っているはずです。

```
$ rails server
```

## ライセンス等
このアプリケーションは以下のサイト、コンテンツを利用して作られています。
- 出典: 行者移動支援サービスに関するデータサイト(https://www.hokoukukan.go.jp/free_wifi.html)
- 「無料公衆無線ＬＡＮスポット」(https://www.hokoukukan.go.jp/free_wifi.html)のデータを加工して利用
