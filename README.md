# progate Ruby on Rails5

## command history

```sh
$ gem install rails -v 7.0.3

$ rails new tweet_app
$ cd tweet_app
$ rails server
http://localhost:3000/


$ rails generate controller home top
http://localhost:3000/home/top

$ rails generate controller posts index
http://localhost:3000/posts/index

$ rails g model post content:text
$ rails db:migrate


$ rails console
Loading development environment (Rails 5.0.3)
[1] pry(main)> post = Post.new(content: "aaa")
=> #<Post:0x00005617edf0c098 id: nil, content: "aaa", created_at: nil, updated_at: nil>
[2] pry(main)> post.save
   (0.1ms)  begin transaction
  SQL (0.3ms)  INSERT INTO "posts" ("content", "created_at", "updated_at") VALUES (?, ?, ?)  [["content", "aaa"], ["created_at", "2022-10-10 13:44:47.148716"], ["updated_at", "2022-10-10 13:44:47.148716"]]
   (6.8ms)  commit transaction
=> true
irb(main):003:0> post = Post.first
  Post Load (0.4ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT ?  [["LIMIT", 1]]
=> #<Post:0x00007f257219e030 id: 1, content: "aaa", created_at: Thu, 13 Oct 2022 13:25:28.574698000 UTC +00:00, updated_at: Thu, 13 Oct 2022 13:25:28.574698000 UTC +00:00>
irb(main):004:0> post.content
=> "aaa"

irb(main):010:0> posts = Post.all
  Post Load (0.1ms)  SELECT "posts".* FROM "posts"
=>
[#<Post:0x00007f2572a966d8 id: 1, content: "aaa", created_at: Thu, 13 Oct 2022 13:25:28.574698000 UTC +00:00, updated_at: Thu, 13 Oct 2022 13:25:28.574698000 UTC +00:00>,
...

irb(main):005:0> quit

```

## memo 
lesson4 の```show.html.rb```の以下の箇所
```ruby
  <%= link_to("削除", "/posts/#{@post.id}/destroy", {method: "post"}) %>
```
はrailsのバージョンが
```sh
$ rails -v
Rails 7.0.4
```
ではgetメソッドにされてしまった。以下の記事を参考にして

- [Rails 7: link_to method: :delete not working #44185](https://github.com/rails/rails/issues/44185)

以下のコマンドを実行

```sh
$  rails importmap:install
Add Importmap include tags in application layout
File unchanged! The supplied flag value not found!  app/views/layouts/application.html.erb
Create application.js module as entrypoint
    conflict  app/javascript/application.js
Overwrite /home/******/Study/progate-ruby-on-rails/tweet_app/app/javascript/application.js? (enter "h" for help) [Ynaqdhm] Y
       force  app/javascript/application.js
Use vendor/javascript for downloaded pins
       exist  vendor/javascript
   identical  vendor/javascript/.keep
Ensure JavaScript files are in the Sprocket manifest
File unchanged! The supplied flag value not found!  app/assets/config/manifest.js
Configure importmap paths in config/importmap.rb
    conflict  config/importmap.rb
Overwrite /home/*******/Study/progate-ruby-on-rails/tweet_app/config/importmap.rb? (enter "h" for help) [Ynaqdhm]
       force  config/importmap.rb
Copying binstub
   identical  bin/importmap
$  rails turbo:install stimulus:install
Import Turbo
      append  app/javascript/application.js
Pin Turbo
      append  config/importmap.rb
Run turbo:install:redis to switch on Redis and use it in development for turbo streams
Create controllers directory
       exist  app/javascript/controllers
   identical  app/javascript/controllers/index.js
   identical  app/javascript/controllers/application.js
   identical  app/javascript/controllers/hello_controller.js
Import Stimulus controllers
      append  app/javascript/application.js
Pin Stimulus
Appending: pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true"
      append  config/importmap.rb
Appending: pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
      append  config/importmap.rb
Pin all controllers
Appending: pin_all_from "app/javascript/controllers", under: "controllers"
      append  config/importmap.rb
```

さらにlink_toを以下に書き換えたら動いた。

```ruby
  <%= link_to("削除", "/posts/#{@post.id}/destroy", data: { turbo_method: :post }) %>
```
