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
[3] pry(main)>
```