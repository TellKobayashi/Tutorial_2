# ２章
[参考
https://railstutorial.jp/chapters/toy_app?version=5.1#cha-a_toy_app]

# ここで学ぶこと
・RailsプログラミングとWebプログラミングの概要
・Railsアプリの構造
・RESTアーキテクチャ
とりあえず自動コーディングシステムを利用して、構造をざっくり理解する。

# アプリケーションの計画
まず計画の前にアプリケーションの骨組みであるRailsファイルを生成する
rails _バージョン_ new ファイル名

気づいたんだけど、railsでファイルを作成すると、git initしてなくても.gitが生成される

で、Gemfileを編集して環境を整える
そしたら
bundel install
して、うまくいかなかったら
bundle update
最後にGitの操作
git remote origin ‘SSHのコード’

git add .

git commit -m “新規作成しました。。。とか”

git push origin master
の順でGitHubに上げていく。
そこからdevelop,feature/numberと作っていく...

# データモデル（データベース）
Webアプリケーションを作成する際に最初に作成する、アプリの構造を表すもの
つまるところ、DB（データベース）のこと
例として
rails generate scaffold User name:string email:string

とすると、
現在のRailsファイル上に「db」フォルダが生成される。
その中には「users」と言うdbが生成されている。
この時、idは主キーとして勝手に作られる。

作成したdbを用いてアプリケーション開発を進めるためにはマイグレーションが必要となる。

# Railsにおけるマイグレーション
通常のDB操作では、SQL文をDBに対して直接実行する。
対してマイグレーションは、テーブルの新規作成、カラムの操作に対して、マイグレーションスクリプトというRubyで書かれたスクリプトファイル（命令文が書かれたファイル）を作成した後で実行する。

つまりは、SQL文ではなく、RubyでDBを操作すると言うこと。
そのためのコマンドが
rails db:migrate

このコマンドは、データベースを更新して、データモデルを作成するためのもの。

# Railsを用いたMVC
ブラウザからurl(リクエスト)をRailsサーバに送信。
リクエストは、configのルーターによって、コントローラー内のアクション（表示機能のこと）に割り当てられる。つまりコントローラー。
アクションが実行され、そこからモデルに問い合わせる。
モデルは問い合わせに従い、データベースから情報をとりだし、コントローラに返す。
コントローラは@???変数にDBの情報を保存し、ビューに渡す。
ビューが起動し、HTMLをレンダリング（生成）する。
コントローラは、ビューからHTMLを受け取りブラウザに返す

# MVCに関連するファイルの解説
configのroutes.rbの
resorces :~~
root ‘AAA#BBB’
は /~~にアクセスしたら,AAA_controllerファイルのBBBっていう関数を返すと言うこと。

DBと関係しているcontrollerでは
@aaa = Aaa.all
のような記述が見られる。
これは@aaaにAaaデータベースの情報全てを代入すると言うことになる。
簡単に出来過ぎ！となるが、Avtive Recordと言うライブラリのおかげでこれが可能になっているだけである。
ちなみに、@で始まる変数をインスタンス変数とよぶ。
コントローラー内で宣言したインスタンス変数はビューでも使用できる。
Springのように、戻り値に入れる必要はない。

# Micropostsについて
twitterのツイートみたいなやつ、

class Micropost < ApplicationRecord
  validates :content, length: { maximum: 140}
end

こんな書き方すれば文字制限をつけれるぜ！！！

しかも、Railsは異なるデータモデル同士の関連づけがめちゃくちゃ簡単！！！
上のvalidatesの上に
has_many :microposts
ってつけたら一人のユーザーに複数のマイクロポストを持たせることができる
つまりほんとにツイッターみたいな感じ

belongs_to :user
にしたら、マイクロポストの帰属先は１人のみになると言うこと


# コントローラとモデルの継承
Rubyではクラスの継承を「<」で示す

Class User < ApplicationRecord
みたいな感じで書くと、UserクラスはApplicationRecordクラスを継承する

ちなみに
〜〜::Baseって言うクラスが大元にはあって、これはモデルオブジェクトの操作、HTTPの操作など、多くの必須機能を持っている。

# REST API(RESTアーキテクチャ)
Webシステムを外部から利用するためのプログラムの呼び出し規約の一つ。
RESTと呼ばれる設計原則に従って策定されたもの。

RESTはある4つの言葉の頭文字
統一インターフェース
予め定義されたメソッドで通信を行うこと。
GET ,POST,PUTだったりのこと。

アドレス可能性
全ての情報は一意なURLを持っていて、情報をURIで表現できること。

接続性
やりとりされる情報にはハイパーリンク（主にURL）を含めることができると言うこと。
1つのリンクで別のリンクに接続することができると言うこと。つまりはハイパーリンクが互いに繋がっている。

ステオートレス性
前のやり取りの結果が今回の結果に影響せず、やり取りが１回ごとに完結すること

