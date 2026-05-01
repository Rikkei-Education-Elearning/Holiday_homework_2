CREATE DATABASE Cinema;

USE Cinema;

CREATE TABLE IF NOT EXISTS movies (
    id int primary key auto increment,
    title varchar(30),
    duration_minute int,
    age_restriction enum (0,13,16,18) default 0
);

CREATE TABLE IF NOT EXISTS rooms (
    id int primary key auto increment,
    name varchar(30),
    max_seat int,
    status enum ('avtive','maintenance') default 'active'
);

CREATE TABLE IF NOT EXISTS showtimes (
    id int primary key auto increment,
    movie_id int,
    room_id int,
    show_time datetime,
    ticket_price decimal(15,0) check (price > 0),
    foreign key (movie_id) references movies(id),
    foreign key (room_id) references rooms(id)
);

CREATE TABLE IF NOT EXISTS bookings (
    id int primary key auto increment,
    showtime_id int,
    customer_name varchar(30),
    phone int,
    booking_date datetime,
    foreign key (showtime_id) references showtimes(id)
);