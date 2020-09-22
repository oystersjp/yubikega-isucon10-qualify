use isuumo;

alter table chair add index (stock, price, id);
alter table chair add index (price);

alter table estate add index (rent, id);
alter table estate add index (door_width, door_height, popularity);
alter table estate add index (rent, popularity, id);
alter table estate add index (latitude);
alter table estate add index (longitude);
alter table estate add index (rent);
