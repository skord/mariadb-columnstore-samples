create database if not exists climate;

use climate;

drop table if exists climate;

create table observations (
  id char(11),
  date date,
  element char(4),
  value int,
  mflag char(1),
  qflag char(1),
  sflag char(1),
  obstime char(4)

) engine=columnstore;


create table stations (
  id char(11),
  latitude float,
  longitude float,
  elevation float,
  state varchar(2),
  name varchar(30),
  gsn_flag varchar(3),
  hcn_crn_flag varchar(3),
  wmo_id varchar(4)
) engine=columnstore;

create table inventories (
  id char(11),
  latitude float,
  longitude float,
  element char(4),
  first_year char(4),
  last_year char(4)
) engine=columnstore;
