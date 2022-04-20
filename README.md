# README

## アプリケーション名

MYBRAND

## アプリケーション概要

商品開発を顧客と共に作る事ができるコミュニティ型のECサイト

## アプリケーション作成の背景

現在、アパレル関連の仕事に就きお客様との対応で
「○○な感じの服とかあったらいいのに、、、」
「ここのデザインが○○みたいだったらいいのに、、、」等のお声を聞きます。
自分のブランドを立ち上げたら顧客と一緒に開発していく服というコンテンツがあると顧客とブランドを結び付きを強める事ができるのではないかという思いから仮想のECサイトのアプリケーション開発を始めました。

## URL

https://mybrand-37155.herokuapp.com/

## テスト用アカウント

・ Basic認証パスワード： admin
・ Basic認証ID： 2222
・ メールアドレス： a@a
・ パスワード： aaa111

## 利用方法

#### 購入機能

 1.トップページ下部の商品一覧より商品画像を選択し商品詳細ページ
 2.商品詳細ページより購入ボタンより購入画面へ遷移
 3.購入ページより必要事項入力の上、購入可能

 [![Image from Gyazo](https://i.gyazo.com/dbfbb1ecb85c3b6d0cecb2c4ef9b0866.gif)](https://gyazo.com/dbfbb1ecb85c3b6d0cecb2c4ef9b0866)

#### 検索機能

 1.トップページのヘッダー部より商品検索もしくはキーワード検索より検索ページに遷移
 2.検索項目を選び検索ボタンより検索結果を表示またはキーワード検索からの場合は結果が表示

 [![Image from Gyazo](https://i.gyazo.com/5bdfc449d3cdea440a5a3c3b04dae189.gif)](https://gyazo.com/5bdfc449d3cdea440a5a3c3b04dae189)

#### コメント機能

 1.トップページの商品開発のバナーより開発商品一覧ページへ遷移
 2.画像を選択し詳細ページへ遷移
 3.詳細ページよりコメント可能

 [![Image from Gyazo](https://i.gyazo.com/9f0189fb723723873b8b0ab9c817b1e3.gif)](https://gyazo.com/9f0189fb723723873b8b0ab9c817b1e3)

#### お気に入り機能

 1.商品詳細ページのお気に入りボタンを押しお気に入り登録

 [![Image from Gyazo](https://i.gyazo.com/20e4597cbea6e672205f42215a036b3e.gif)](https://gyazo.com/20e4597cbea6e672205f42215a036b3e)

## 洗い出した要件

#### 要件定義シート

 https://docs.google.com/spreadsheets/d/14LHjkTBjbzzOn8tSeHeO5hMM_wUrvfd5cDGSDXLOIbU/edit#gid=982722306

## 実装予定の機能

・顧客のマイページ機能
・カート機能
・管理者と顧客での表示や機能の振り分け

## データベース設計

[![Image from Gyazo](https://i.gyazo.com/6489fe636170e14d504a319ecd85a043.png)](https://gyazo.com/6489fe636170e14d504a319ecd85a043)

## ページ遷移図

[![Image from Gyazo](https://i.gyazo.com/9e620bedf1cc82c2d7b59586e9f574b8.png)](https://gyazo.com/9e620bedf1cc82c2d7b59586e9f574b8)


## customers テーブル

| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

## association

- has_many :orders
- has_many :favorites
- has_many :comments


## items テーブル

| Column             | Type    | Option       |
| ------------------ | ------  | ------------ |
| name               | string  | null: false  |
| description        | text    | null: false  |
| category_id        | integer | null: false  |
| color_id           | integer | null: false  |
| size_id            | integer | null: false  |
| price              | integer | null: false  |

## association

- has_many :favorites
- has_one :orders


## orders テーブル

| Column             | Type       | Option                          | 
| ------------------ | ---------- | ------------------------------- |
| customer           | references | null: false, foreign_key: true  |
| item               | references | null: false, foreign_key: true  |

## association

- belongs_to :item
- belongs_to :customer
- has_one :destination


## destinations テーブル

| Column             | Type       | Option                          | 
| ------------------ | ---------- | ------------------------------- |
| postcode           | integer    | null: false                     |
| prefecture_id      | integer    | null: false                     |
| city               | string     | null: false                     |
| block              | string     | null: false                     |
| building           | string     |                                 |
| phone_number       | string     | null: false                     |
| order              | references | null: false, foreign_key: true  |

## association

- belongs_to :order


## favorites テーブル

| Column             | Type       | Option                          | 
| ------------------ | ---------- | ------------------------------- |
| item               | references | null: false, foreign_key: true  |
| customer           | references | null: false, foreign_key: true  |

## association

- belongs_to :item
- belongs_to :customer


## products テーブル

| Column             | Type       | Option                          | 
| ------------------ | ---------- | ------------------------------- |
| name               | string     | null: false                     |
| description        | text       | null: false                     |

## association

- has_many :comments


## comments テーブル

| Column             | Type       | Option                          | 
| ------------------ | ---------- | ------------------------------- |
| comment            | text       | null: false                     |
| product            | references | null: false, foreign_key: true  |
| customer           | references | null: false, foreign_key: true  |

## association

- belongs_to :product
- belongs_to :customer


## 開発環境

・フロントエンド
・バックエンド
・インフラ
・テスト
・テキストエディタ
・タスク管理

## ローカルでの動作方法

以下のコマンドを順に実行
 % git clone https://github.com/jtghjt/mybrand.git
 % cd mybrand
 % bundle install
 % yarn install
 
## 工夫したポイント

 開発の背景として挙げたブランドと顧客を繋げるという考えの元、開発商品ページは必ず作りあげたいと思いました。
 コメントに対するいいね機能などアレンジする分はまだまだありますが開発課程を見せていくページとしてECサイトの＋1のコンテンツとして実装ができました。


