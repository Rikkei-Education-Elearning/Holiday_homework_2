CREATE DATABASE Cinema;

USE Cinema;

CREATE TABLE IF NOT EXISTS movies (
    id int primary key auto_increment,
    title varchar(30),
    duration_minute int,
    age_restriction enum ('0','13','16','18') default '0'
);

CREATE TABLE IF NOT EXISTS rooms (
    id int primary key auto_increment,
    name varchar(30),
    max_seat int,
    status enum ('active','maintenance') default 'active'
);

CREATE TABLE IF NOT EXISTS showtimes (
    id int primary key auto_increment,
    movie_id int,
    room_id int,
    show_time datetime,
    ticket_price decimal(15,0) check (ticket_price > 0),
    foreign key (movie_id) references movies(id),
    foreign key (room_id) references rooms(id)
);

CREATE TABLE IF NOT EXISTS bookings (
    id int primary key auto_increment,
    showtime_id int,
    customer_name varchar(30),
    phone int,
    booking_date datetime,
    foreign key (showtime_id) references showtimes(id)
);

INSERT INTO movies (title, duration_minute, age_restriction) VALUES
('The Super Mario Galaxy Movie', 98, '0'),
('Project Hail Mary', 156, '13'),
('Michael', 127, '13'),
('Scream 7', 114, '18');

INSERT INTO rooms (name, max_seat, status) VALUES
('Phong Chieu 1', 120, 'active'),
('Phong Chieu 2', 90, 'active'),
('Phong Chieu 3', 70, 'maintenance');

INSERT INTO showtimes (movie_id, room_id, show_time, ticket_price) VALUES
(1, 1, '2026-05-02 09:00:00', 90000),
(2, 2, '2026-05-02 13:30:00', 120000),
(3, 1, '2026-05-02 18:00:00', 110000),
(4, 2, '2026-05-02 21:00:00', 130000),
(2, 1, '2026-05-03 15:00:00', 120000);

INSERT INTO bookings (showtime_id, customer_name, phone, booking_date) VALUES
(1, 'Nguyen Minh Anh', 912345678, '2026-05-01 08:15:00'),
(1, 'Tran Quoc Bao', 913456789, '2026-05-01 08:45:00'),
(2, 'Le Thu Ha', 914567890, '2026-05-01 09:10:00'),
(2, 'Pham Gia Huy', 915678901, '2026-05-01 09:40:00'),
(3, 'Vo Khanh Linh', 916789012, '2026-05-01 10:05:00'),
(3, 'Do Tuan Kiet', 917890123, '2026-05-01 10:20:00'),
(4, 'Bui Ngoc Mai', 918901234, '2026-05-01 10:50:00'),
(4, 'Hoang Duc Manh', 919012345, '2026-05-01 11:15:00'),
(5, 'Dang Bao Chau', 920123456, '2026-05-01 11:40:00'),
(5, 'Phan Thanh Nam', 921234567, '2026-05-01 12:05:00');
