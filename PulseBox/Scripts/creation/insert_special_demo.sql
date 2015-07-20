--start of mediumcompany answers or our demo... cleanup first
delete from answer where answer_date > sysdate-180 and company_id=3005;

insert into answer values (answer_id_seq.nextval, 9035, 'Some major issues w/ team right now'                        , sysdate-1, 6029, 3005, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9035, 'Things are ok.'                        , sysdate-2, 6030, 3005, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4020, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9035, 'So so...'                        , sysdate-3, 6031, 3005, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4030, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9035, 'Things are much better than few weeks ago!'                        , sysdate-4, 6032, 3005, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4040, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9035, 'About the same as before'                        , sysdate-5, 6033, 3005, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4048, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9035, 'I think we are headed in the right direction!'                        , sysdate-6, 6034, 3005, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4049, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9035, 'Team dynamic right now is no good.'                        , sysdate-7, 6035, 3005, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4020, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9035, 'Not sure at all.  Too busy.'                        , sysdate-8, 6036, 3005, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4050, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9035, 'Workload is way too high'                        , sysdate-9, 6037, 3005, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4050, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9035, 'Things are going very well!'                        , sysdate-10, 6038, 3005, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);

insert into answer values (answer_id_seq.nextval, 9036, 'All is well!'                        , sysdate-11, 6039, 3005, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9036, 'Things are ok.'                        , sysdate-12, 6040, 3005, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9036, 'Yes, we need to meet at least twice per week!'                        , sysdate-13, 6041, 3005, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9036, 'No, things are ok'                        , sysdate-14, 6042, 3005, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9036, 'I don''t like our website!'                        , sysdate-15, 6043, 3005, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9036, 'No, I think we are headed in the right direction!'                        , sysdate-16, 6044, 3005, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9036, 'We all need to put more time into our favorite project.'                        , sysdate-17, 6045, 3005, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9036, 'Lunch meetings better than after hours....'                        , sysdate-18, 6046, 3005, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9036, 'Wish I could spend more time on our project.'                        , sysdate-19, 6047, 3005, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9036, 'Things are going GREAT!  No suggestions.'                        , sysdate-20, 6048, 3005, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);

insert into answer values (answer_id_seq.nextval, 9037, '9 out of 10 baby!'                        , sysdate-21, 6048, 3005, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9037, 'As good as possible!'                        , sysdate-22, 6050, 3005, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9037, '10!'                        , sysdate-23, 6025, 3005, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9037, 'Not so good right now'                        , sysdate-24, 6051, 3005, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9037, 'Amazing confidence that we will rock!'                        , sysdate-25, 6052, 3005, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9037, 'Awsome sky is our limit!'                        , sysdate-26, 6053, 3005, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9037, '8/10'                        , sysdate-27, 6016, 3005, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9037, 'Not good'                        , sysdate-28, 6054, 3005, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9037, 'Pretty good, but we have some issues'                        , sysdate-29, 6055, 3005, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9037, 'No complaints here my friend!  I''m thrilled to be part of this!'                        , sysdate-30, 6056, 3005, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);

insert into answer values (answer_id_seq.nextval, 9038, 'hrs is good'                        , sysdate-1, 6057, 3005, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9038, 'so so'                        , sysdate-2, 6058, 3005, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9038, 'I can def put more hours!'                        , sysdate-3, 6059, 3005, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9038, 'Kinda busy these days, but fun!'                        , sysdate-4, 6029, 3005, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9038, 'Family time is keeping me from putting hours in right now so my bad'                        , sysdate-5, 6030, 3005, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9038, 'No complaints about hours here'                        , sysdate-6, 6031, 3005, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9038, 'Too busy'                        , sysdate-7, 6032, 3005, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9038, 'Not good'                        , sysdate-8, 6033, 3005, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9038, 'Hard to say.  I don''t know what others are putting in'                        , sysdate-9, 6034, 3005, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9038, 'No complaints here my friend... got plent more hours I can put in!'                        , sysdate-10, 6035, 3005, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);

insert into answer values (answer_id_seq.nextval, 9039, 'Definitely a positive thing!'                        , sysdate-11, 6036, 3005, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9039, 'That leader was bad for the team'                        , sysdate-12, 6037, 3005, 6, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9039, 'So so...'                        , sysdate-13, 6038, 3005, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9039, 'Things are much better than few weeks ago!'                        , sysdate-14, 6039, 3005, 6, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9039, 'Not sure yet'                        , sysdate-15, 6040, 3005, 5, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9039, 'I think we are headed in the right direction finally!'                        , sysdate-16, 6041, 3005, 5, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9039, 'Team dynamic right now is amazing!'                        , sysdate-18, 6042, 3005, 8, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9039, 'Not sure at all.  Too busy.'                        , sysdate-19, 6043, 3005, 5, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9039, 'So far so good!'                        , sysdate-20, 6044, 3005, 7, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9039, 'Things are going very well!'                        , sysdate-21, 6045, 3005, 9, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);

insert into answer values (answer_id_seq.nextval, 9040, 'Next stop get demo up!'                        , sysdate-22, 6046, 3005, 6, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9040, 'Make website solid'                        , sysdate-23, 6047, 3005, 5, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9040, 'Have regular team meetings'                        , sysdate-24, 6048, 3005, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9040, 'Raise some money so we can do this full time!  Too much fun!'                        , sysdate-25, 6049, 3005, 3, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9040, 'Not sure'                        , sysdate-26, 6050, 3005, 5, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9040, 'Continue to press on!'                        , sysdate-27, 6051, 3005, 6, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9040, 'Get customer #1!'                        , sysdate-28, 6052, 3005, 4, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9040, 'Continue to make solid progress'                        , sysdate-29, 6053, 3005, 8, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9040, 'Spend more time on demo - all of us'                        , sysdate-30, 6054, 3005, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9040, 'Next stop IPO!'                        , sysdate-1, 6055, 3005, 9, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);

insert into answer values (answer_id_seq.nextval, 9041, 'Once a week meeting is fine'                        , sysdate-2, 6056, 3005, 6, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9041, 'I guess...'                        , sysdate-3, 6057, 3005, 5, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9041, 'No, I think min 2X week meeting is needed'                        , sysdate-4, 6058, 3005, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9041, 'Just fine...'                        , sysdate-5, 6059, 3005, 4, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9041, 'I would rather meet on the weekends'                        , sysdate-6, 6029, 3005, 4, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9041, 'Sure'                        , sysdate-7, 6030, 3005, 5, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9041, 'Most of the time'                        , sysdate-8, 6031, 3005, 5, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9041, 'I don''t think we need any meetings'                        , sysdate-9, 6032, 3005, 8, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9041, 'Yes, but people have to make sure they are on time!'                        , sysdate-10, 6033, 3005, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9041, 'No complaints at all!  I''m thrilled to be part of this!'                        , sysdate-11, 6034, 3005, 9, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);

insert into answer values (answer_id_seq.nextval, 9042, 'Bootstrapping all the way!'                        , sysdate-12, 6035, 3005, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9042, 'President knows best!'                        , sysdate-13, 6036, 3005, 8, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9042, 'Bootstrap'                        , sysdate-14, 6037, 3005, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9042, 'Not sure'                        , sysdate-15, 6038, 3005, 2, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9042, 'Bootstrap'                        , sysdate-16, 6039, 3005, 6, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9042, 'Maybe VC but not sure'                        , sysdate-17, 6040, 3005, 7, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9042, 'VC!'                        , sysdate-18, 6041, 3005, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9042, 'Whichever is best for us'                        , sysdate-19, 6042, 3005, 8, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9042, 'Boot...'                        , sysdate-20, 6043, 3005, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9042, 'Don''t know about either much'                        , sysdate-21, 6044, 3005, 6, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);

insert into answer values (answer_id_seq.nextval, 9043, 'Very solid!'                        , sysdate-22, 6045, 3005, 8, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9043, 'The best!'                        , sysdate-23, 6046, 3005, 8, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9043, 'No good... time to revisit decision!'                        , sysdate-24, 6047, 3005, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9043, 'Bad'                        , sysdate-25, 6048, 3005, 2, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9043, 'OK'                        , sysdate-26, 6049, 3005, 6, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9043, 'Solid!'                        , sysdate-27, 6050, 3005, 7, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9043, 'Exactly what we need!'                        , sysdate-28, 6051, 3005, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9043, 'Not doing a good job lately....'                        , sysdate-29, 6052, 3005, 8, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9043, 'Not sure...'                        , sysdate-30, 6053, 3005, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9043, 'Good, I guess'                        , sysdate-1, 6054, 3005, 6, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);

update answer a set a.dept_id = 
(select b.dept_id from employee b where a.emp_id=b.emp_id)
where a.company_id=3005
and a.answer_date > sysdate-31;
commit;
