extends Node

var name_list = ['Noah','Liam','William','Mason','James','Benjamin','Jacob' ,'Michael'
 ,'Elijah' ,'Ethan' ,'Alexander' ,'Oliver' ,'Daniel' ,'Lucas' ,'Matthew' ,'Aiden' ,'Jackson'
 ,'Logan' ,'David' ,'Joseph' ,'Samuel' ,'Henry' ,'Owen' ,'Sebastian' ,'Gabriel' ,'Carter'
 ,'Jayden' ,'John' ,'Luke' ,'Anthony' ,'Isaac' ,'Dylan' ,'Wyatt' ,'Andrew' ,'Joshua'
 ,'Christopher' ,'Grayson' ,'Jack' ,'Julian' ,'Ryan' ,'Jaxon' ,'Levi' ,'Nathan' ,'Caleb'
 ,'Hunter' ,'Christian' ,'Isaiah' ,'Thomas','Aaron' ,'Lincoln' ,'Charles' ,'Eli' ,'Landon',
 'Connor' ,'Josiah' ,'Jonathan' ,'Cameron' ,'Jeremiah' ,'Mateo' ,'Adrian' ,'Hudson' ,'Robert' ,'Nicholas'
 ,'Brayden' ,'Nolan' ,'Easton' ,'Jordan' ,'Colton' ,'Evan' ,'Angel' ,'Asher' ,'Dominic' ,'Austin' ,'Leo'
 ,'Adam' ,'Jace' ,'Jose' ,'Ian' ,'Cooper' ,'Gavin' ,'Carson' ,'Jaxson' ,'Theodore' ,'Jason' ,'Ezra'
 ,'Chase' ,'Parker' ,'Xavier' ,'Kevin' ,'Zachary' ,'Tyler' ,'Ayden' ,'Elias' ,'Bryson' ,'Leonardo'
 ,'Greyson' ,'Sawyer' ,'Roman' ,'Brandon' ,'Bentley' ,'Kayden' ,'Ryder' ,'Nathaniel' ,'Vincent'
 ,'Miles' ,'Santiago' ,'Harrison' ,'Tristan' ,'Declan' ,'Cole' ,'Maxwell' ,'Luis' ,'Justin'
 ,'Everett' ,'Micah' ,'Axel' ,'Wesley' ,'Max' ,'Silas' ,'Weston' ,'Ezekiel' ,'Juan' ,'Damian'
 ,'Camden' ,'George' ,'Braxton' ,'Blake' ,'Jameson' ,'Diego' ,'Carlos' ,'Ivan' ,'Kingston' ,'Ashton'
,'Jesus' ,'Brody' ,'Emmett' ,'Abel' ,'Jayce' ,'Maverick' ,'Bennett' ,'Giovanni' ,'Eric' ,'Maddox' ,'Kaiden'
 ,'Kai' ,'Bryce' ,'Alex' ,'Calvin' ,'Ryker' ,'Jonah' ,'Luca' ,'King' ,'Timothy' ,'Alan' ,'Brantley' ,'Malachi'
 ,'Emmanuel' ,'Abraham' ,'Antonio' ,'Richard' ,'Jude' ,'Miguel' ,'Edward' ,'Victor' ,'Amir' ,'Joel' ,'Steven'
 ,'Matteo' ,'Hayden' ,'Patrick' ,'Grant' ,'Preston' ,'Tucker' ,'Jesse' ,'Finn' ,'Oscar' ,'Kaleb' ,'Gael' ,'Graham'
 ,'Elliot' ,'Alejandro' ,'Rowan' ,'Marcus' ,'Jeremy' ,'Zayden' ,'Karter' ,'Beau' ,'Bryan' ,'Maximus' ,'Aidan'
,'Avery' ,'Elliott' ,'August' ,'Nicolas' ,'Mark' ,'Colin' ,'Waylon' ,'Bradley' ,'Kyle' ,'Kaden']

func gen_name():
	var i = randi()%5
	var username = name_list[randi()%(len(name_list)-1)]
	for x in range(i):
		username += str(randi()%10)
	return username