# FreeWiFiAPI

これは、フリーwifiをの場所を特定するためのAPIを提供するアプリケーションです。

## APIの使い方
このアプリケーションのAPIの利用の仕方は以下のURLを参考にしてください。  
https://limitless-stream-27227.herokuapp.com

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

次に、データを整えるためのdb:seedを実行します。

```
$ rails db:seed
```

最後に、テストを実行してうまく動いているかどうか確認してください。

```
$ rspec
```

テストが無事に通ったら、Railsサーバーを立ち上げる準備が整っているはずです。

```
$ rails server
```

## apidocsの生成について
まず、以下のコマンドでapidocsを生成します。

 ```
 rake swagger:docs
 ```

 その後、以下のコマンドでapidocs以下のファイルの修正をします。

 ```
 rails runner Tasks::Batch.fixapi
 ```

## herokuについて
herokuではdbに10000行を超えないように一部のデータのみ利用しています。  
そこで、`rails db:seed`の代わりに以下のコマンドを利用します。
```
 rails runner Tasks::Batch.makespotsHeroku
```

## ライセンス等
このアプリケーションは以下のサイト、コンテンツを利用して作られています。
- 出典: 行者移動支援サービスに関するデータサイト(https://www.hokoukukan.go.jp/free_wifi.html)
- 「無料公衆無線ＬＡＮスポット」(https://www.hokoukukan.go.jp/free_wifi.html)のデータを加工して利用
