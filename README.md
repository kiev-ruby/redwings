# redwings
team management service

проект представляет собой приложение для организации эффективного взаимодействия между ментором и учениками.

если вам сообщили, что вы добавлены на проект, убедитесь, что у вас есть доступ на доску RedWings в трелло, и что вы состоите в команде RedWings в гит-оганизации kiev-ruby.

вся необходимая информация о проекте на данный момент находится в этом ридми и на доске RedWings

если возникли вопросы, обращайтесь к ментору в slack


в трелло пользуйтесь лейблами, когда переводите в ready, добавляйте меня в мемберы таска.
выполненные задания заливаем в соответстующей ветке, делаем пул-реквест, ассайним на меня

WORKING WITH THE GIT-FLOW APPROACH http://danielkummer.github.io/git-flow-cheatsheet/

relation model
https://drive.google.com/file/d/0B4NAAlVHXYk5a3FWTG1XWXp3U28/view?usp=sharing (open via draw.io)



# Setup guide:


#### 1. Install Ruby 2.2.2

* terminal: rvm install 2.2.2  


#### 2. Install PostqreSQL version 9.4 [more](http://www.postgresql.org/download/linux/ubuntu/)

Install Postgres 9.4:

* terminal: sudo apt-get install postgresql-9.4

Install pgAdmin III:

* terminal: sudo apt-get install pgadmin3


#### 3. Bundler install [more](http://bundler.io)

* terminal: gem install bundler 

#### 4. Configuration

* terminal: git clone https://github.com/kiev-ruby/redwings.git 

* terminal: bundle install

#### 5. Setup your databases from the command line [more](https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres)

* terminal: rake db:create

#### 6. Run

* terminal: rails s 

#### 7. Work with git flow [more](http://danielkummer.github.io/git-flow-cheatsheet/)

* git init flow

