use isuumo;

alter table chair add index (stock, price, id);
alter table estate add index (rent, id);