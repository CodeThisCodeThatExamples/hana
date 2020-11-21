DO BEGIN
--standart IF ELSE EXAMPLE

--input parameter
DECLARE youtube_subscription NVARCHAR(50) = 'subscribed';

--output parameter
DECLARE reaction NVARCHAR(50);


IF youtube_subscription = 'subscribed' THEN
	reaction = 'happy!';
ELSEIF youtube_subscription = 'not subscribed' THEN
	reaction = 'sad';
ELSE
	reaction = NULL;

END IF;

-- SAP HANA SQL SCRIPT MAP FUNCTION

reaction = MAP(youtube_subscription,
				      'subscribed','happy!',
				      'not subscribed' ,'sad',
				      NULL);

SELECT reaction FROM DUMMY;

END; 

CREATE SCHEMA DEV;


CREATE COLUMN TABLE DEV.SHOP(
	id INTEGER,
	name VARCHAR(20),
	category_id INTEGER
);

INSERT INTO DEV.SHOP VALUES ( 1, 'food_shop', 10 );
INSERT INTO DEV.SHOP VALUES ( 2, 'anter', 11 );
INSERT INTO DEV.SHOP VALUES ( 3, 'futron', 12 );
INSERT INTO DEV.SHOP VALUES ( 4, 'zymeal', 13 );
INSERT INTO DEV.SHOP VALUES ( 5, 'medine', 14 );

SELECT * FROM DEV."SHOP";



SELECT
id, name,

MAP(category_id,
	10, 'grocery store',
	11, 'restaurant',
	12, 'restaurant',
	13, 'restaurant',
	14, 'pharmacy',
	NULL)


FROM DEV."SHOP";