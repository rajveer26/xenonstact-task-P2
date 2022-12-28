/*Table structure for table `report` */

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Runs` int DEFAULT NULL,
  `Expertise` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

USE `xenonimp`;

/*Table structure for table `expertise` */


DROP TABLE IF EXISTS `expertise`;

CREATE TABLE `expertise` (
  `Expertise` int NOT NULL,
  `Min_Runs` int DEFAULT NULL,
  `Max_Runs` int DEFAULT NULL,
  KEY `Expertise` (`Expertise`)
); 
insert into `expertise` (`Expertise`, `Min_Runs`, `Max_Runs`) values('1','0','9');
insert into `expertise` (`Expertise`, `Min_Runs`, `Max_Runs`) values('2','10','19');
insert into `expertise` (`Expertise`, `Min_Runs`, `Max_Runs`) values('3','20','29');
insert into `expertise` (`Expertise`, `Min_Runs`, `Max_Runs`) values('4','30','39');
insert into `expertise` (`Expertise`, `Min_Runs`, `Max_Runs`) values('5','40','49');
insert into `expertise` (`Expertise`, `Min_Runs`, `Max_Runs`) values('6','50','59');
insert into `expertise` (`Expertise`, `Min_Runs`, `Max_Runs`) values('7','60','69');
insert into `expertise` (`Expertise`, `Min_Runs`, `Max_Runs`) values('8','70','79');
insert into `expertise` (`Expertise`, `Min_Runs`, `Max_Runs`) values('9','80','89');
insert into `expertise` (`Expertise`, `Min_Runs`, `Max_Runs`) values('10','90','100');


/*Table structure for table `interns` */

DROP TABLE IF EXISTS `interns`;

CREATE TABLE `interns` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Runs` int DEFAULT NULL,
  KEY `ID` (`ID`)
); 

insert into `interns` (`ID`, `Name`, `Runs`) values('1','Rahul','88');
insert into `interns` (`ID`, `Name`, `Runs`) values('2','Nitin','99');
insert into `interns` (`ID`, `Name`, `Runs`) values('3','Ashish','78');
insert into `interns` (`ID`, `Name`, `Runs`) values('4','Pradeep','63');
insert into `interns` (`ID`, `Name`, `Runs`) values('5','Veeru','81');
insert into `interns` (`ID`, `Name`, `Runs`) values('6','Saloni','68');



/* query */to get the desired output as asked in the question*/

SELECT interns.name,runs,expertise.Expertise
FROM interns
INNER JOIN expertise
ON interns.runs BETWEEN Min_Runs AND Max_Runs 
AND expertise.Expertise > 0
ORDER BY Expertise.expertise DESC

.
