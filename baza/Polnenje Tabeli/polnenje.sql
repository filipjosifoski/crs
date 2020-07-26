insert into public.club  values (1,'Filip Josifoski','Hwarang Fist','2006-01-04','filip@filip.com','12345','Macedonia','Ohrid','223-305');
insert into public.club  values (2,'Ace','Ace Telekom','2010-01-04','ace@filip.com','3214','Macedonia','Ohrid','223-306');

insert into public.type_of_sport  values (1,'Taekwondo');
insert into public.type_of_sport  values (2,'Kickbox');



insert into public.competitor  values (1,1,'Ado','Male','1998-02-19',1)
insert into public.competitor  values (2,1,'Dragan','Male','1998-01-01',1)

insert into public.competitor  values (3,2,'Zenska verzija Ace','Female','1994-07-06',1)
insert into public.competitor  values (4,1,'Stamena','Female','2007-02-02',1)


insert into public.category  values (1,1,'Male','Senior','63');
insert into public.category  values (2,1,'Male','Senior','87');
insert into public.category  values (3,1,'Female','Pioner','27');

insert into public.category  values (4,2,'Male','Senior','63');
insert into public.category  values (5,2,'Female','Cadet','45');



insert into public.competition  values (1,'Biljanini Izvori',1,'2020-07-30','2020-07-30','2020-07-25','2020-07-29',1)

insert into public.competition  values (2,'Struga vo nekoaj sala',2,'2020-07-30','2020-07-30','2020-07-25','2020-07-29',2)



insert into public.competition_competitors values (1,1,1)
insert into public.competition_competitors values (1,2,1)

insert into public.competition_competitors values (1,3,2)
insert into public.competition_competitors values (1,4,2)

select c.competitor_name,cat.*  from competitor as c
inner join competition_competitors  as cc on ( cc.competitor_id =c.competitor_id )
inner join category  as cat on (cc.category_id =cat.category_id )
where cat.category_weight = 63

