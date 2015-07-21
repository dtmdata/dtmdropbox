--start of mediumcompany answers or our demo... cleanup first
delete from answer where answer_date > sysdate-180 and company_id in (3003, 3005);
delete from event where event_date > sysdate-45;

insert into answer values (answer_id_seq.nextval, 9035, 'Some major issues w/ team right now'                        , trunc(sysdate-1), 6029, 3005, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9035, 'Things are ok.'                        , trunc(sysdate-2), 6030, 3005, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4020, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9035, 'So so...'                        , trunc(sysdate-3), 6031, 3005, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4030, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9035, 'Things are much better than few weeks ago!'                        , trunc(sysdate-4), 6032, 3005, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4040, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9035, 'About the same as before'                        , trunc(sysdate-5), 6033, 3005, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4048, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9035, 'I think we are headed in the right direction!'                        , trunc(sysdate-6), 6034, 3005, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4049, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9035, 'Team dynamic right now is no good.'                        , trunc(sysdate-7), 6035, 3005, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4020, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9035, 'Not sure at all.  Too busy.'                        , trunc(sysdate-8), 6036, 3005, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4050, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9035, 'Workload is way too high'                        , trunc(sysdate-9), 6037, 3005, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4050, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9035, 'Things are going very well!'                        , trunc(sysdate-10), 6038, 3005, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);

insert into answer values (answer_id_seq.nextval, 9036, 'All is well!'                        , trunc(sysdate-11), 6039, 3005, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9036, 'Things are ok.'                        , trunc(sysdate-12), 6040, 3005, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9036, 'Yes, we need to meet at least twice per week!'                        , trunc(sysdate-13), 6041, 3005, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9036, 'No, things are ok'                        , trunc(sysdate-14), 6042, 3005, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9036, 'I don''t like our website!'                        , trunc(sysdate-15), 6043, 3005, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9036, 'No, I think we are headed in the right direction!'                        , trunc(sysdate-16), 6044, 3005, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9036, 'We all need to put more time into our favorite project.'                        , trunc(sysdate-17), 6045, 3005, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9036, 'Lunch meetings better than after hours....'                        , trunc(sysdate-18), 6046, 3005, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9036, 'Wish I could spend more time on our project.'                        , trunc(sysdate-19), 6047, 3005, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9036, 'Things are going GREAT!  No suggestions.'                        , trunc(sysdate-20), 6048, 3005, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);

insert into answer values (answer_id_seq.nextval, 9037, '9 out of 10 baby!'                        , trunc(sysdate-21), 6048, 3005, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2105, null, null, null);
insert into answer values (answer_id_seq.nextval, 9037, 'As good as possible!'                        , trunc(sysdate-22), 6050, 3005, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2105, null, null, null);
insert into answer values (answer_id_seq.nextval, 9037, '10!'                        , trunc(sysdate-23), 6025, 3005, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2105, null, null, null);
insert into answer values (answer_id_seq.nextval, 9037, 'Not so good right now'                        , trunc(sysdate-24), 6051, 3005, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2105, null, null, null);
insert into answer values (answer_id_seq.nextval, 9037, 'Amazing confidence that we will rock!'                        , trunc(sysdate-25), 6052, 3005, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2105, null, null, null);
insert into answer values (answer_id_seq.nextval, 9037, 'Awsome sky is our limit!'                        , trunc(sysdate-26), 6053, 3005, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2105, null, null, null);
insert into answer values (answer_id_seq.nextval, 9037, '8/10'                        , trunc(sysdate-27), 6016, 3005, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2105, null, null, null);
insert into answer values (answer_id_seq.nextval, 9037, 'Not good'                        , trunc(sysdate-28), 6054, 3005, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2105, null, null, null);
insert into answer values (answer_id_seq.nextval, 9037, 'Pretty good, but we have some issues'                        , trunc(sysdate-29), 6055, 3005, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2105, null, null, null);
insert into answer values (answer_id_seq.nextval, 9037, 'No complaints here my friend!  I''m thrilled to be part of this!'                        , trunc(sysdate-30), 6056, 3005, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2105, null, null, null);

insert into answer values (answer_id_seq.nextval, 9038, 'hrs is good'                        , trunc(sysdate-1), 6057, 3005, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9038, 'so so'                        , trunc(sysdate-2), 6058, 3005, 5, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9038, 'I can def put more hours!'                        , trunc(sysdate-3), 6059, 3005, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9038, 'Kinda busy these days, but fun!'                        , trunc(sysdate-4), 6029, 3005, 2, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9038, 'Family time is keeping me from putting hours in right now so my bad'                        , trunc(sysdate-5), 6030, 3005, 6, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9038, 'No complaints about hours here'                        , trunc(sysdate-6), 6031, 3005, 9, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9038, 'Too busy'                        , trunc(sysdate-7), 6032, 3005, 8, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9038, 'Not good'                        , trunc(sysdate-8), 6033, 3005, 6, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9038, 'Hard to say.  I don''t know what others are putting in'                        , trunc(sysdate-9), 6034, 3005, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9038, 'No complaints here my friend... got plent more hours I can put in!'                        , trunc(sysdate-10), 6035, 3005, 9, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);

insert into answer values (answer_id_seq.nextval, 9039, 'Definitely a positive thing!'                        , trunc(sysdate-11), 6036, 3005, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9039, 'That leader was bad for the team'                        , trunc(sysdate-12), 6037, 3005, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9039, 'So so...'                        , trunc(sysdate-13), 6038, 3005, 7, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9039, 'Things are much better than few weeks ago!'                        , trunc(sysdate-14), 6039, 3005, 4, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9039, 'Not sure yet'                        , trunc(sysdate-15), 6040, 3005, 3, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9039, 'I think we are headed in the right direction finally!'                        , trunc(sysdate-16), 6041, 3005, 6, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9039, 'Team dynamic right now is amazing!'                        , trunc(sysdate-18), 6042, 3005, 6, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9039, 'Not sure at all.  Too busy.'                        , trunc(sysdate-19), 6043, 3005, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9039, 'So far so good!'                        , trunc(sysdate-20), 6044, 3005, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9039, 'Things are going very well!'                        , trunc(sysdate-21), 6045, 3005, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2105, null, null, null);

insert into answer values (answer_id_seq.nextval, 9040, 'Next stop get demo up!'                        , trunc(sysdate-22), 6046, 3005, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2105, null, null, null);
insert into answer values (answer_id_seq.nextval, 9040, 'Make website solid'                        , trunc(sysdate-23), 6047, 3005, 6, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2105, null, null, null);
insert into answer values (answer_id_seq.nextval, 9040, 'Have regular team meetings'                        , trunc(sysdate-24), 6048, 3005, 6, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2105, null, null, null);
insert into answer values (answer_id_seq.nextval, 9040, 'Raise some money so we can do this full time!  Too much fun!'                        , trunc(sysdate-25), 6049, 3005, 5, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2105, null, null, null);
insert into answer values (answer_id_seq.nextval, 9040, 'Not sure'                        , trunc(sysdate-26), 6050, 3005, 4, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2105, null, null, null);
insert into answer values (answer_id_seq.nextval, 9040, 'Continue to press on!',                        trunc(sysdate-27), 6051, 3005, 7, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2105, null, null, null);
insert into answer values (answer_id_seq.nextval, 9040, 'Get customer #1!'                        , trunc(sysdate-28), 6052, 3005, 5, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2105, null, null, null);
insert into answer values (answer_id_seq.nextval, 9040, 'Continue to make solid progress'                        , trunc(sysdate-29), 6053, 3005, 9, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2105, null, null, null);
insert into answer values (answer_id_seq.nextval, 9040, 'Spend more time on demo - all of us'                        , trunc(sysdate-30), 6054, 3005, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2105, null, null, null);
insert into answer values (answer_id_seq.nextval, 9040, 'Next stop IPO!'                        , trunc(sysdate-1), 6055, 3005, 1, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2105, null, null, null);

insert into answer values (answer_id_seq.nextval, 9041, 'Once a week meeting is fine'                        , trunc(sysdate-2), 6056, 3005, 9, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9041, 'I guess...'                        , trunc(sysdate-3), 6057, 3005, 2, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9041, 'No, I think min 2X week meeting is needed'                        , trunc(sysdate-4), 6058, 3005, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9041, 'Just fine...'                        , trunc(sysdate-5), 6059, 3005, 9, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9041, 'I would rather meet on the weekends'                        , trunc(sysdate-6), 6029, 3005, 8, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9041, 'Sure'                        , trunc(sysdate-7), 6030, 3005, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9041, 'Most of the time'                        , trunc(sysdate-8), 6031, 3005, 1, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9041, 'I don''t think we need any meetings'                        , trunc(sysdate-9), 6032, 3005, 3, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9041, 'Yes, but people have to make sure they are on time!'                        , trunc(sysdate-10), 6033, 3005, 7, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9041, 'No complaints at all!  I''m thrilled to be part of this!'                        , trunc(sysdate-11), 6034, 3005, 6, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);

insert into answer values (answer_id_seq.nextval, 9042, 'Bootstrapping all the way!'                        , trunc(sysdate-12), 6035, 3005, 1, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9042, 'President knows best!'                        , trunc(sysdate-13), 6036, 3005, 2, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9042, 'Bootstrap'                        , trunc(sysdate-14), 6037, 3005, 7, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9042, 'Not sure'                        , trunc(sysdate-15), 6038, 3005, 7, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9042, 'Bootstrap'                        , trunc(sysdate-16), 6039, 3005, 3, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9042, 'Maybe VC but not sure'                        , trunc(sysdate-17), 6040, 3005, 2, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9042, 'VC!'                        , trunc(sysdate-18), 6041, 3005, 4, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9042, 'Whichever is best for us'                        , trunc(sysdate-19), 6042, 3005, 5, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9042, 'Boot...'                        , trunc(sysdate-20), 6043, 3005, 8, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9042, 'Don''t know about either much'                        , trunc(sysdate-21), 6044, 3005, 3, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);

insert into answer values (answer_id_seq.nextval, 9043, 'Very solid!'                        , trunc(sysdate-22), 6045, 3005, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9043, 'The best!'                        , trunc(sysdate-23), 6046, 3005, 2, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9043, 'No good... time to revisit decision!'                        , trunc(sysdate-24), 6047, 3005, 7, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9043, 'Bad'                        , trunc(sysdate-25), 6048, 3005, 5, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9043, 'OK'                        , trunc(sysdate-26), 6049, 3005, 3, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9043, 'Solid!'                        , trunc(sysdate-27), 6050, 3005, 4, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9043, 'Exactly what we need!'                        , trunc(sysdate-28), 6051, 3005, 3, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9043, 'Not doing a good job lately....'                        , trunc(sysdate-29), 6052, 3005, 5, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9043, 'Not sure...'                        , trunc(sysdate-30), 6053, 3005, 8, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);
insert into answer values (answer_id_seq.nextval, 9043, 'Good, I guess'                        , trunc(sysdate-1), 6054, 3005, 3, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), 4010, 2005, null, null, null);

update answer a set a.dept_id = 
(select b.dept_id from employee b where a.emp_id=b.emp_id)
where a.company_id=3005
and a.answer_date > sysdate-45;

insert into event values (event_id_seq.nextval, 'Sold' , 'Sold our company to company XYZ'             , 11008  , sysdate-0, 3005, 4048, 'private', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event values (event_id_seq.nextval, 'Layoff' , 'Company layoff - impacted 23'             , 11009  , sysdate-10, 3005, 4048, 'private', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event values (event_id_seq.nextval, 'Project 2020 Kickoff' , 'Start of our main company project!'             , 11010  , sysdate-20, 3005, 4048, 'private', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event values (event_id_seq.nextval, 'Corporate Realignment' , 'Realigned 8 executives under Jones'             , 11008  , sysdate-30, 3005, 4048, 'private', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
commit;

-- now will insert some data for another company/industry
-- simple .sql script to insert recent data.  all you do is change variable below to your liking then run this from sqlplus
-- A. Ebadi 4/2015
--
declare 

-- set these for emp, dept, company, question, location u want answer for
v_company_id number	 	:= 3003;
v_dept_id number 		:= 4028;
v_loc_id number 		:= 2003;
v_employee_id number 		:= 6011;
v_question_id number 		:= 9017;
v_answer_text varchar2(200)	:= 'What can I say?';
v_relative_date number		:= 4;

-- set this to total # rows you want inserted
v_rows_to_insert number 	:= 25;

-- don't touch these counters
v_counter number 		:= 0;
v_temp_counter number 		:= 1;

begin

while v_counter < v_rows_to_insert 
loop
  if v_temp_counter = 11 then
    v_temp_counter := 1;
  end if;

  if v_temp_counter = 1 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*1, v_employee_id, v_company_id, 7, 4, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 2 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*2, v_employee_id, v_company_id, 8, 2, 1, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 3 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*3, v_employee_id, v_company_id, 2, 2, 2, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 4 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*4, v_employee_id, v_company_id, 7, 4, 6, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 5 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*1, v_employee_id, v_company_id, 9, 2, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 6 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*2, v_employee_id, v_company_id, 1, 2, 3, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 7 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*3, v_employee_id, v_company_id, 5, 5, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 8 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*4, v_employee_id, v_company_id, 9, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 9 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*1, v_employee_id, v_company_id, 3, 3, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 10 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*2, v_employee_id, v_company_id, 2, 2, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  end if;
  v_temp_counter := v_temp_counter + 1;
  v_counter := v_counter + 1;	

end loop;

end;
/
commit;

declare 

-- set these for emp, dept, company, question, location u want answer for
v_company_id number	 	:= 3003;
v_dept_id number 		:= 4028;
v_loc_id number 		:= 2003;
v_employee_id number 		:= 6011;
v_question_id number 		:= 9017;
v_answer_text varchar2(200)	:= 'What can I say?';
v_relative_date number		:= 2;

-- set this to total # rows you want inserted
v_rows_to_insert number 	:= 35;

-- don't touch these counters
v_counter number 		:= 0;
v_temp_counter number 		:= 1;

begin

while v_counter < v_rows_to_insert 
loop
  if v_temp_counter = 11 then
    v_temp_counter := 1;
  end if;

  if v_temp_counter = 1 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*1, v_employee_id, v_company_id, 3, 4, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 2 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*2, v_employee_id, v_company_id, 2, 2, 1, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 3 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*3, v_employee_id, v_company_id, 8, 2, 2, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 4 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*4, v_employee_id, v_company_id, 4, 4, 6, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 5 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*1, v_employee_id, v_company_id, 7, 2, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 6 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*2, v_employee_id, v_company_id, 4, 2, 3, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 7 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*3, v_employee_id, v_company_id, 7, 5, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 8 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*4, v_employee_id, v_company_id, 5, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 9 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*1, v_employee_id, v_company_id, 8, 3, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 10 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*2, v_employee_id, v_company_id, 4, 2, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  end if;
  v_temp_counter := v_temp_counter + 1;
  v_counter := v_counter + 1;	

end loop;

end;
/
commit;

declare 

-- set these for emp, dept, company, question, location u want answer for
v_company_id number	 	:= 3003;
v_dept_id number 		:= 4028;
v_loc_id number 		:= 2003;
v_employee_id number 		:= 6011;
v_question_id number 		:= 9017;
v_answer_text varchar2(200)	:= 'What can I say?';
v_relative_date number		:= 3;

-- set this to total # rows you want inserted
v_rows_to_insert number 	:= 15;

-- don't touch these counters
v_counter number 		:= 0;
v_temp_counter number 		:= 1;

begin

while v_counter < v_rows_to_insert 
loop
  if v_temp_counter = 11 then
    v_temp_counter := 1;
  end if;

  if v_temp_counter = 1 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*1, v_employee_id, v_company_id, 6, 4, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 2 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*2, v_employee_id, v_company_id, 9, 2, 1, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 3 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*3, v_employee_id, v_company_id, 4, 2, 2, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 4 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*4, v_employee_id, v_company_id, 6, 4, 6, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 5 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*1, v_employee_id, v_company_id, 7, 2, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 6 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*2, v_employee_id, v_company_id, 3, 2, 3, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 7 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*3, v_employee_id, v_company_id, 5, 5, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 8 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*4, v_employee_id, v_company_id, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 9 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*1, v_employee_id, v_company_id, 4, 3, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  elsif v_temp_counter = 10 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*2, v_employee_id, v_company_id, 4, 2, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N', null, null);
  end if;
  v_temp_counter := v_temp_counter + 1;
  v_counter := v_counter + 1;	

end loop;

end;
/
commit;