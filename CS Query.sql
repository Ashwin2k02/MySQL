create database VAG;
use VAG;

create table ArtWork (
ArtWorkID int Primary Key,
Title varchar(100),
Description text,
CreationDate date,
Medium varchar(100),
ImageURL varchar(250)
);



create table Artist (
ArtistID int primary key,
Name varchar(100),
Biography text,
BirthDate date,
Nationality varchar(50),
Website varchar(100),
ContactInformation varchar(15)
);


create table User (
UserID int primary key,
UserName varchar(50),
Password varchar(15),
Email varchar(30),
FirstName varchar(50),
LastName varchar(50),
DateOfBirth date,
ProfilePicture varchar(50)
);


create table Gallery(
GalleryID int primary key,
Name varchar(100),
Description Text,
Location varchar(50),
Curator int,
OpeningHours varchar(20),
foreign key (Curator) references Artist(ArtistID)
);


create table User_favorite_ArtWork (
UserID int,
ArtworkID int,
foreign key (UserID) references User (UserID),
foreign key (ArtWorkID) references ArtWork (ArtworkID)
);


create table ArtWork_Gallery (
ArtWorkID int,
GalleryID int,
foreign key(ArtWorkID) references ArtWork(ArtWorkID),
foreign key(GalleryID) references Gallery(GalleryID)
);

alter table User add FavouriteArtworks varchar(100);

alter table artwork add ArtistID int,
add constraint foreign key (ArtistID) references artist (artistid);

insert into Artwork (ArtworkID, Title, Description, CreationDate, Medium, ImageURL)
values
    (1, 'Starry Night', 'A famous painting by Vincent van Gogh depicting the night sky.', '1889-06-01', 'Oil on canvas', 'https://example.com/starry_night.jpg'),
    (2, 'Mona Lisa', 'A masterpiece by Leonardo da Vinci featuring a woman with an enigmatic smile.', '1503-01-01', 'Oil on poplar panel', 'https://example.com/mona_lisa.jpg'),
    (3, 'The Persistence of Memory', 'An iconic surrealist painting by Salvador Dalí featuring melting clocks.', '1931-01-01', 'Oil on canvas', 'https://example.com/persistence_of_memory.jpg'),
    (4, 'The Starry Night', 'A famous painting by Vincent van Gogh depicting the night sky.', '1889-06-01', 'Oil on canvas', 'https://example.com/starry_night.jpg'),
    (5, 'The Last Supper', 'A masterpiece by Leonardo da Vinci depicting the Last Supper of Jesus with his disciples.', '1495-01-01', 'Fresco', 'https://example.com/last_supper.jpg'),
    (6, 'The Persistence of Memory', 'An iconic surrealist painting by Salvador Dalí featuring melting clocks.', '1931-01-01', 'Oil on canvas', 'https://example.com/persistence_of_memory.jpg');

insert into Artist (ArtistID, Name, Biography, BirthDate, Nationality, Website, ContactInformation)
values
    (101, 'Vincent van Gogh', 'Vincent Willem van Gogh was a Dutch Post-Impressionist painter.', '1853-03-30', 'Dutch', 'https://vangogh.com', '9876543210'),
    (202, 'Leonardo da Vinci', 'Leonardo di ser Piero da Vinci was an Italian polymath.', '1452-04-15', 'Italian', 'https://leonardodavinci.com','9898989898'),
    (303, 'Salvador Dalí', 'Salvador Domingo Felipe Jacinto Dalí i Domènech was a Spanish surrealist artist.', '1904-05-11', 'Spanish', 'https://salvadordali.com', '9639639639'),
    (404, 'Pablo Picasso', 'Pablo Picasso was a Spanish painter, sculptor, printmaker, ceramicist, and stage designer.', '1881-10-25', 'Spanish', 'https://picasso.com', '9865327410'),
    (505, 'Michelangelo', 'Michelangelo di Lodovico Buonarroti Simoni was an Italian sculptor, painter, architect, and poet.', '1475-03-06', 'Italian', 'https://michelangelo.com', '9874563210'),
    (606, 'Claude Monet', 'Oscar-Claude Monet was a French painter.', '1840-11-14', 'French', 'https://monet.com', '9876987600');
    
insert into User (UserID, Username, Password, Email, FirstName, LastName, DateOfBirth, ProfilePicture, FavouriteArtworks)
values
    (123123, 'artlover123', 'password123', 'artlover@example.com', 'John', 'Doe', '1990-01-15', 'https://example.com/profile_picture.jpg', '1,2'),
    (246246, 'creative_soul', 'letmein', 'creative@example.com', 'Jane', 'Smith', '1985-07-20', 'https://example.com/creative.jpg', '3'),
    (369369, 'artfanatic', 'artpass', 'artfan@example.com', 'Emily', 'Johnson', '1988-09-05', 'https://example.com/emily.jpg', '4,5'),
    (484848, 'artcollector', 'collector123', 'collector@example.com', 'Michael', 'Brown', '1975-12-10', 'https://example.com/michael.jpg', '6');
    
insert into Gallery (GalleryID, Name, Description, Location, Curator, OpeningHours)
values
    (111, 'Metropolitan Museum of Art', 'The Met is one of the largest and most prestigious art museums in the world.', 'New York, USA', 101, 'Mon-Sun: 10am-5pm'),
    (222, 'Louvre Museum', 'The Louvre is the world''s largest art museum and a historic monument in Paris, France.', 'Paris, France', 202, 'Tue-Sun: 9am-6pm'),
    (333, 'Tate Modern', 'The Tate Modern is a modern art gallery located in London, England.', 'London, UK', 404, 'Mon-Sun: 10am-6pm'),
    (444, 'Rijksmuseum', 'The Rijksmuseum is a Dutch national museum dedicated to arts and history in Amsterdam.', 'Amsterdam, Netherlands', 505, 'Mon-Sun: 9am-5pm');
    
insert into User_Favorite_Artwork (UserID, ArtworkID)
values
    (123123, 1),
    (123123, 2),
    (246246, 3),
    (369369, 4),
    (369369, 5),
    (484848, 6);
    
insert into Artwork_Gallery (ArtworkID, GalleryID)
values
    (1, 111),
    (2, 222),
    (3, 111),
    (4, 333),
    (5, 333),
    (6, 444);
    
update artwork set artistid = 101 where artworkid = 1;
update artwork set artistid = 202 where artworkid = 2;
update artwork set artistid = 303 where artworkid = 3;
update artwork set artistid = 404 where artworkid = 4;
update artwork set artistid = 505 where artworkid = 5;
update artwork set artistid = 202 where artworkid = 2;
update artwork set artistid = 202 where artworkid = 2;


insert into User (UserID, Username, Password, Email, FirstName, LastName, DateOfBirth, ProfilePicture, FavouriteArtworks)
values
    (456456, 'artlover987', 'password123', 'artlover@example.com', 'Steve', 'Smith', '2000-01-15', 'https://example.com/prof_picture.jpg', '1,2,4'),
    (963963, 'creative_mind', 'lethimcook', 'creativemind@example.com', 'Steve', 'Rogers', '1999-07-20', 'https://example.co.in/creative.jpg', '3');


insert into User_Favorite_Artwork (UserID, ArtworkID)
values
    (456456, 1),
    (456456, 2),
    (456456, 4),
    (963963, 3);
