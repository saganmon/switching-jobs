![switching-jobs](https://user-images.githubusercontent.com/59816193/76177565-fdbc1680-61f7-11ea-853f-b04f6943c2f9.png)

<h2 align="center">転職サプリ</h2>

## 概要
転職活動を支援するアプリケーションです。
<ul>
  <li>「企業を探す」
    <ul>
      <li>管理者：CSVフォーマットでの企業の一括取り込み</li>
      <li>一般ユーザー：企業の閲覧、検索</li>
    </ul>
  </li>
  <li>「活動を見る」
    <ul>
      <li>管理者：活動の登録、全ユーザーの活動の閲覧/検索</li>
      <li>一般ユーザー：活動の登録/閲覧/検索</li>
    </ul>
  </li>
</ul>

## 制作背景
<p>転職をされる方が、何度も同じ企業のホームページを訪問する手間や、活動状況が分からなくなったりする不便を解消するために作成しました</p>

## 開発環境
<ul>
  <li>開発言語: Ruby, Haml, SCSS</li>
  <li>フレームワーク: Ruby on Rails</li>
  <li>OS：Mac</li>
  <li>DB：MySQL</li>
  <li>デプロイ先: heroku</li>
</ul>

## 🌐 App URL

### **https://job-switch.herokuapp.com/**  
　
## 💬 Usage

`$ git clone https://github.com/saganmon/switching-jobs.git`
<br>
`$ cd switching-jobs`
<br>
`$ bundle install`
<br>
`$ rails db:create`
<br>
`$ rails db:migrate`
<br>
`$ rails s`
<br>
👉 http://localhost:3000

## デモアカウント
<ul>
  <li>管理者　　　　ID/Pass： adminusr@fukuoka-demo.jp / adminusr</li>
  <li>一般ユーザー　 ID/Pass： testuser1@fukuoka-demo.jp / testuser1</li>
</ul>

## 📦 Features
<h3 align="center">- メニュー -</h3>
<p align="center">
  <img src="https://user-images.githubusercontent.com/59816193/76178879-4249b100-61fc-11ea-9ca5-f1d4433a97db.png" width=80%>
</p>
<h3 align="center">- 企業閲覧, 登録(管理者のみ) -</h3>
<ul>
  <li>ポイント
    <ul>
      <li>管理者のみ企業のCSVアップロードが可能です</li>
      <li>検索窓からレコードの絞り込みが可能です(jQueryで実装)</li>
    </ul>
  </li>
</ul>
<p align="center">
  <img src="https://user-images.githubusercontent.com/59816193/76178368-79b75e00-61fa-11ea-9b73-4eff9355664d.png" width=80%>
</p>

<h3 align="center">- 活動閲覧 -</h3>
<ul>
  <li>ポイント
    <ul>
      <li>検索窓からレコードの絞り込みが可能です(jQueryで実装)</li>
    </ul>
  </li>
</ul>
<p align="center">
  <img src="https://user-images.githubusercontent.com/59816193/76178940-7ae98a80-61fc-11ea-8839-fe10bd0b3075.png" width=80%>
</p>

<h3 align="center">- 活動登録 -</h3>
<ul>
  <li>ポイント
    <ul>
      <li>活動登録のボタンをクリックするとモーダルウィンドウが表示され、活動を入力することができます</li>
      <li>ユーザーの入力の手間を省けるよう、セレクトボックスを多用しています</li>
      <li>登録した内容は、Ajaxで追加されます</li>
    </ul>
  </li>
</ul>
<p align="center">
  <img src="https://user-images.githubusercontent.com/59816193/76179059-d87dd700-61fc-11ea-94ef-c97219d981ee.png" width=80%>
</p>

## 課題と今後の実装
<ul>
  <li>課題
    <ul>
      <li>管理者ページが未実装</li>
      <li>管理者によるCSV取り込みにおいて、企業を追加する際の動作が不安定（idが連番になっていないとエラーが発生する場合がある）</li>
      <li>活動入力において、日付を入れる際に手間がかかる</li>
      <li>名寄せを実装していないため、今度集計機能を実装する際に正確な集計ができない恐れがある</li>      
    </ul>
  </li>
  <li>今後の実装
    <ul>
      <li>管理者ページの実装</li>
      <li>上記課題の解決</li>
    </ul>
  </li>
</ul>

## DB設計
<p align="center">
  <img src="https://user-images.githubusercontent.com/59816193/76184694-2d771880-6210-11ea-9870-9a374c791650.png" width=80%>
</p>
