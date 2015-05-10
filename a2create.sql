CREATE TABLE Airport (
	aiportID 	NUMBER(4)		NOT NULL,
	name		VARCHAR2(64)	NOT NULL,
	city		VARCHAR2(32)	NOT NULL,
	country		VARCHAR2(32)	NOT NULL,
	IATA 		VARCHAR2(3)		NOT NULL,
	latitude	NUMBER(3,2)		NOT NULL,
	longitude	NUMBER(3,2)		NOT NULL,
	altitude	NUMBER(4)		NOT NULL,
	DST			VARCHAR2(1)		NOT NULL,
	timeZone	VARCHAR2(32)	NOT NULL,
	CONSTRAINT Airport_PK PRIMARY KEY(id, IATA)
	ON DELETE CASCADE
);

CREATE TABLE Route (
	routeID				NUMBER(4)	NOT NULL,
	sourceAirport		VARCHAR2(3)	NOT NULL,
	destinationAirport	VARCHAR2(3)	NOT NULL,
	codeShare			VARCHAR2(1),
	stops				NUMBER(1),
	CONSTRAINT Route_PK PRIMARY KEY(routeID)
	FOREIGN KEY (sourceAirport) REFERENCES Airport(IATA),
	FOREIGN KEY (destinationAirport) REFERENCES Airport(IATA),
	ON DELETE CASCADE
);

CREATE TABLE Fleet (
	fleetID			NUMBER(4)		NOT NULL,
	aircraft		VARCHAR2(32)	NOT NULL,
	inService		NUMBER(2)		NOT NULL,
	firstClass		NUMBER(2)		NOT NULL,
	businessClass	NUMBER(2)		NOT NULL,
	premiumClass	NUMBER(2)		NOT NULL,
	economyClass	NUMBER(3)		NOT NULL,
	total			NUMBER(3)		NOT NULL,
	CONSTRAINT Fleet_PK PRIMARY KEY(fleetID)
	ON DELETE CASCADE
);

CREATE TABLE Customer
(
	customer_id 		NUMBER(4) 		NOT NULL,
	title				VARCHAR2(16) 	NOT NULL,
	first_name			VARCHAR2(32)	NOT NULL,
	last_name			VARCHAR2(32)	NOT NULL,
	gender				VARCHAR2(8)		NOT NULL,
	DOB					DATE			NOT NULL,
	phone				VARCHAR2(16)	NOT NULL,
	email				VARCHAR2(64)	NOT NULL,
	street_address		VARCHAR2(64)	NOT NULL,
	city				VARCHAR2(32)	NOT NULL,
	country				VARCHAR2(32)	NOT NULL,
	credit_card_type 	VARCHAR2(32)	NOT NULL,
	credit_card_num		VARCHAR2(16)	NOT NULL,
	frequent_flier_pts	NUMBER(6)		NOT NULL,
	passport_holder		BOOLEAN			NOT NULL,
	flight_status		VARCHAR2(8),
	travel_agent		VARCHAR2(32),
	username 			VARCHAR2(32)	NOT NULL,
	CONSTRAINT Cust_PK PRIMARY KEY(customer_id),
	FOREIGN KEY (username) REFERENCES Login(username),
	FOREIGN KEY (travel_agent) REFERENCES AgentProfiles(name),
	CONSTRAINT usr UNIQUE (username),
	ON DELETE CASCADE
);

CREATE TABLE Login
(
	username	VARCHAR2(32)	NOT NULL,
	password	VARCHAR2(32)	NOT NULL,
	role		VARCHAR2(16)	NOT NULL,
	CONSTRAINT Login_PK PRIMARY KEY(username),
	ON DELETE CASCADE
);

CREATE TABLE AgentProfiles
(
	agent_id	NUMBER(3)		NOT NULL,
	name		VARCHAR2(32)	NOT NULL,
	phone		VARCHAR2(16)	NOT NULL,
	email		VARCHAR2(64)	NOT NULL,
	CONSTRAINT Agent_PK PRIMARY KEY(agent_id),
	CONSTRAINT unq_agent UNIQUE (name, phone, email),
	ON DELETE CASCADE
);

CREATE TABLE ServiceInventory
(
	service_id	NUMBER(2)		NOT NULL,
	item		VARCHAR2(32)	NOT NULL,
	cost		NUMBER(3)		NOT NULL,
	avaliablity	VARCHAR2(32)	NOT NULL,
	CONSTRAINT Service_PK PRIMARY KEY(service_id),
	ON DELETE CASCADE
);