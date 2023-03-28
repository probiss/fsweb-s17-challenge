-- Tasarımını yaptığınız tabloları oluşturan sql ifadeleri buraya yazınız.
-- veri tiplerine, nullable olma durumuna, default değerine ve tablolar arası foreign key kullanımına dikkat.
create table users (
    user_id int auto_increment primary key,
    username varchar(28) not null,
    password varchar(16) not null,
    email varchar(255) not null,
    bio_text varchar(255),
    location varchar(128)
)