use isuumo;

alter table chair add column popularity_desc INTEGER AS (-popularity) STORED NOT NULL after popularity;
alter table chair add index (popularity_desc, id);
alter table chair add index (stock, price, id);
alter table chair add index (price);

alter table estate add column popularity_desc INTEGER AS (-popularity) STORED NOT NULL after popularity;
alter table estate add index (rent, id);
alter table estate add index (popularity_desc, id);
alter table estate add index (door_width, door_height, popularity);
alter table estate add index (latitude);
alter table estate add index (longitude);
alter table estate add index (door_width,rent);