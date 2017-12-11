# Seed and Growth

[![N|Solid](http://res.cloudinary.com/dmzlfjx06/image/upload/c_scale,w_582/v1512998167/IMG_7007_hoataj.png)

Heroku test site: https://sng-beta.herokuapp.com/  

**ログインにはFacebookアカウントが必要です**

## **スライドを使ってアイデアをピッチするサービス**
Google slides や YouTube によるiframeのリンクを貼ることで、 オンライン上で  
自分のサービスを発表することができます。  
それをサポーターの方々がみて、 コメントをしてアドバイスしたり、   
応援したり、 実際に協力することができます。 応援したときに支援者として名前が載ります。

# 開発環境
  - Ruby (ver: 2.4.2)
  - Rails (ver: 5.1.4)
  - Atom Editor
  - GitKraken
  - DBeaver
  - Ubuntu Gnome 16.04 LTS

# 使用している主なGem
  - omniauth
  - omniauth-facebook
  - devise
  - ckeditor
  - bootstrap-sass
  - carrierwave
  - mini-magick
  - pry-rails
  - slim-rails
  - fog
  - dotenv-rails
  - redcarpet
  - coderay

# Set up local
まずは git clone します。  
ローカル環境の任意のフォルダに以下のコマンドを打ちます。

```sh
$ git init
$ git clone https://github.com/ryosk7/seed_and_growth.git
```

いくつかの環境変数を格納する必要があります。  
**dotenv-rails gem** を利用することで、環境変数を入れることができます。

**.env** ファイルがない場合、 **/seed_and_growth** 直下に **.env** ファイルを作ってください。

```sh
$ touch .env
```
次にFacebook、 deviseの変数を入れます。  
config/initializers/devise.rbにある「config.secret_key」の部分のコメントアウトをはずして、  
fingerprintを.env ファイルに代入します。

Facebook の ID と SECRET_KEY は Facebook for Developers から取得してください。  
Facebook for Developers: https://developers.facebook.com/

```sh
# /seed_and_growth/.env

#Facebook Keys
APP_ID="**********"
APP_SECRET="***********************"

#Devise key
DEVISE_KEY="***********************"
```

次に Gemfile に入っている Gem をインストールします。  
**オプションコマンドの --without production を付けないとエラーが起こることがあります。**

```sh
$ bundle install --without production
$ rails db:migrate
$ git add -A
$ git commit -m "Hello, Seed and Growth!"
$ git push origin master
```
以上でローカル環境のセットアップは終了です。 :+1:  
ブラウザに表示させる時は、 ターミナルに別のタブを開いて、  

```sh
$ rails server
```
とコマンドしてください。（rails s)でも動きます。  

http://localhost:3000 で見ることができます。

Seed and Growth は jQuery を採用しています。  
もしエラーが出るようでしたら、 yarn でインストールしてください。

```sh
$ yarn add jquery
```

# Set up for Heroku

まず、 Herokuにこのアプリケーションを追加します。  
アカウントをお持ちでない方は、 まずアカウントを作りましょう。  
Heroku: https://www.heroku.com/

ターミナルで次のコマンドを打ち込んでください。

```sh
$ heroku version
```

このように返ってきたらherokuをターミナルでherokuを使う用意ができています。

```sh
heroku-cli/6.14.39-addc925 (linux-x64) node-v9.2.0
```

もし入っていないようでしたら、 こちらからインストールしてください。  
Heroku Tookbelt: https://devcenter.heroku.com/articles/heroku-cli

Heroku のコマンドライン インターフェイスがインストールされていることが確認できたら、  
以下のようなコマンドでログインして、 SSHキーの追加を行います。

```sh
$ heroku login
$ heroku keys:add
```

そして、 Herokuサーバー上にアプリケーションを追加します。

```sh
$ heroku create
```


さらにAWSのS3を利用している利用しているので、こちらも環境変数を追加します。  
AWS及びS3については、他の方の記事を参考にしてください。  
S3の環境変数は以下のコマンドのように、Herokuに直接代入してください。  

```sh
$ heroku config:set S3_ACCESS_KEY="****************"
$ heroku config:set S3_SECRET_KEY="****************"
$ heroku config:set S3_BUCKET="*****************"
$ heroku config:set S3_REGION="*****************"
```
これで準備が整いました。 :+1:  
それでは、HerokuにPushしていきましょう。

```sh
$ rails assets:precompile
$ git add -A
$ git commit -m "Set up for Heroku"
$ git push heroku master
$ heroku run rake db:migrate
```
done! :tada:  
これでHerokuにデプロイされています。 :clap:  
ターミナルにリンクが貼られているので、そこをクリックするか、  

```sh
$ heroku open
```

でリンクに 飛ぶことができます。  
もし、エラーが起こっているようでしたら、 **AWS**、 **Facebook**、 または **Devise** の環境変数をもう一度確認してください。

```sh
$ heroku logs
```

で確認する方法もあります。 参考にしてください。  
おつかれさまでした。 :wave:

# Developer
Ryosuke Uchida :grin:
