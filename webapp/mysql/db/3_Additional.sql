use isuumo;

alter table chair add index (stock, price, id);
alter table estate add index (rent, id);
alter table estate add index (door_width, door_height, popularity);
alter table estate add index (rent, popularity, id);