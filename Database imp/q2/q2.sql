USE `xenonimp2`;

/*Table structure for table `challenges` */

DROP TABLE IF EXISTS `challenges`;

create table `challenges` (
	`challenge_id` int (50),
	`college_id` int (50)
); 
insert into `challenges` (`challenge_id`, `college_id`) values('18765','11219');
insert into `challenges` (`challenge_id`, `college_id`) values('47127','11219');
insert into `challenges` (`challenge_id`, `college_id`) values('60292','32473');
insert into `challenges` (`challenge_id`, `college_id`) values('72974','56685');


/*Table structure for table `colleges` */

DROP TABLE IF EXISTS `colleges`;

create table `colleges` (
	`college_id` int (50),
	`contest_id` int (50)
); 
insert into `colleges` (`college_id`, `contest_id`) values('11219','66406');
insert into `colleges` (`college_id`, `contest_id`) values('32473','66556');
insert into `colleges` (`college_id`, `contest_id`) values('56685','94828');


/*Table structure for table `contests` */

DROP TABLE IF EXISTS `contests`;

create table `contests` (
	`contest_id` int (50),
	`interview_id` int (50),
	`name` varchar (150)
); 
insert into `contests` (`contest_id`, `interview_id`, `name`) values('1','17973','Nitin');
insert into `contests` (`contest_id`, `interview_id`, `name`) values('2','79153','Riya');
insert into `contests` (`contest_id`, `interview_id`, `name`) values('3','80275','Chandan');


/*Table structure for table `submission_stats` */

DROP TABLE IF EXISTS `submission_stats`;

create table `submission_stats` (
	`challenge_id` int (11),
	`total_submissions` int (50),
	`total_accepted_submissions` int (50)
); 
insert into `submission_stats` (`challenge_id`, `total_submissions`, `total_accepted_submissions`) values('75516','34','12');
insert into `submission_stats` (`challenge_id`, `total_submissions`, `total_accepted_submissions`) values('47127','27','10');
insert into `submission_stats` (`challenge_id`, `total_submissions`, `total_accepted_submissions`) values('47127','56','18');
insert into `submission_stats` (`challenge_id`, `total_submissions`, `total_accepted_submissions`) values('75516','74','12');
insert into `submission_stats` (`challenge_id`, `total_submissions`, `total_accepted_submissions`) values('75516','83','8');
insert into `submission_stats` (`challenge_id`, `total_submissions`, `total_accepted_submissions`) values('72974','68','24');
insert into `submission_stats` (`challenge_id`, `total_submissions`, `total_accepted_submissions`) values('72974','82','14');
insert into `submission_stats` (`challenge_id`, `total_submissions`, `total_accepted_submissions`) values('47127','28','11');

/*Table structure for table `view_stats` */

DROP TABLE IF EXISTS `view_stats`;

create table `view_stats` (
	`challenge_id` int (11),
	`total_views` int (50),
	`total_unique_views` int (50)
); 
insert into `view_stats` (`challenge_id`, `total_views`, `total_unique_views`) values('47127','26','19');
insert into `view_stats` (`challenge_id`, `total_views`, `total_unique_views`) values('47127','15','14');
insert into `view_stats` (`challenge_id`, `total_views`, `total_unique_views`) values('18765','43','10');
insert into `view_stats` (`challenge_id`, `total_views`, `total_unique_views`) values('18765','72','13');
insert into `view_stats` (`challenge_id`, `total_views`, `total_unique_views`) values('75516','35','17');
insert into `view_stats` (`challenge_id`, `total_views`, `total_unique_views`) values('60292','11','10');
insert into `view_stats` (`challenge_id`, `total_views`, `total_unique_views`) values('72974','41','15');
insert into `view_stats` (`challenge_id`, `total_views`, `total_unique_views`) values('75516','75','11');

/*result query` */


SELECT con.contest_id, con.interview_id, con.name,
SUM(sg.total_submissions), SUM(sg.total_accepted_submissions),
SUM(vg.total_views), SUM(vg.total_unique_views)
FROM Contests AS con
JOIN Colleges AS col ON con.contest_id = col.contest_id
JOIN Challenges AS cha ON cha.college_id = col.college_id
LEFT JOIN
(SELECT ss.challenge_id, SUM(ss.total_submissions) AS total_submissions, SUM(ss.total_accepted_submissions) AS total_accepted_submissions FROM Submission_Stats AS ss GROUP BY ss.challenge_id) AS sg
ON cha.challenge_id = sg.challenge_id
LEFT JOIN
(SELECT vs.challenge_id, SUM(vs.total_views) AS total_views, SUM(vs.total_unique_views) AS total_unique_views
FROM View_Stats AS vs GROUP BY vs.challenge_id) AS vg
ON cha.challenge_id = vg.challenge_id
GROUP BY con.contest_id, con.interview_id, con.name
HAVING SUM(sg.total_submissions) +
       SUM(sg.total_accepted_submissions) +
       SUM(vg.total_views) +
       SUM(vg.total_unique_views) > 0
ORDER BY con.contest_id;
.
