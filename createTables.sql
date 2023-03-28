-- Tasarımını yaptığınız tabloları oluşturan sql ifadeleri buraya yazınız.
-- veri tiplerine, nullable olma durumuna, default değerine ve tablolar arası foreign key kullanımına dikkat.
create table users (
    user_id int auto_increment primary key,
    username varchar(28) not null unique,
    password varchar(16) not null,
    email varchar(255) not null unique,
    bio_text varchar(255),
    location varchar(128),
)

create table followers (
    follower_id int auto_increment primary key,
    user_id int not null,
    followername varchar(24),
    foreign key (user_id) references users(user_id)
)

create table tweets (
    tweet_id int auto_increment primary key,
    user_id int not null,
    content varchar(255) not null,
    created_at datetime not null default (CURRENT_DATE),
    updated_at datetime not null,
    retweet_count int not null default "0",
    foreign key (user_id) references users(user_id)
)

create table comments(
    comment_id int auto_increment primary key,
    tweet_id int not null,
    content varchar(255) not null,
    created_at datetime not null,
    updated_at datetime not null,
    foreign key (tweet_id) references tweets(tweet_id)
)

create table likes(
    like_id int auto_increment primary key,
    user_id int not null,
    tweet_id int not null,
    created_at datetime not null,
    foreign key (user_id) references users(user_id),
    foreign key (tweet_id) references tweets(tweet_id)
)

create table hashtags(
    hashtag_id int auto_increment primary key,
    hashtag_text varchar(255) not null,
    created_at datetime not null,
    updated_at datetime not null
)

create table tweet_hashtags(
    tweet_id int not null,
    hashtag_id int not null,
    created_at datetime not null,
    foreign key (hashtag_id) references hashtags(hashtag_id)
)