CREATE TABLE `Airport` (
	`aiportID` 	NUMBER(4)		NOT NULL,
	`name`		VARCHAR(64)	NOT NULL,
	`city`		VARCHAR(32)	NOT NULL,
	`country`	VARCHAR(32)	NOT NULL,
	`IATA` 		VARCHAR(3)		NOT NULL,
	`latitude`	NUMBER(3,2)		NOT NULL,
	`longitude`	NUMBER(3,2)		NOT NULL,
	`altitude`	NUMBER(4)		NOT NULL,
	`DST`		VARCHAR(1)		NOT NULL,
	`timeZone`	VARCHAR(32)	NOT NULL,
	CONSTRAINT `Airport_PK` PRIMARY KEY(`airportID`, `IATA`)
	ON DELETE CASCADE
);

CREATE TABLE `Route` (
	`routeID`				NUMBER(4)	NOT NULL,
	`sourceAirport`			VARCHAR(3)	NOT NULL,
	`destinationAirport`	VARCHAR(3)	NOT NULL,
	`codeShare`				VARCHAR(1),
	`stops`					NUMBER(1),
	CONSTRAINT `Route_PK` PRIMARY KEY(`routeID`)
	FOREIGN KEY (`sourceAirport`) REFERENCES `Airport`(`IATA`),
	FOREIGN KEY (`destinationAirport`) REFERENCES `Airport`(`IATA`),
	ON DELETE CASCADE
);

CREATE TABLE `Fleet` (
	`fleetID`		NUMBER(4)		NOT NULL,
	`aircraft`		VARCHAR(32)	NOT NULL,
	`inService		NUMBER(2)		NOT NULL,
	`firstClass`	NUMBER(2)		NOT NULL,
	`businessClass`	NUMBER(2)		NOT NULL,
	`premiumClass`	NUMBER(2)		NOT NULL,
	`economyClass`	NUMBER(3)		NOT NULL,
	`total`			NUMBER(3)		NOT NULL,
	CONSTRAINT `Fleet_PK` PRIMARY KEY(`fleetID`),
	ON DELETE CASCADE
);

CREATE TABLE `Customer`
(
	`customer_id` 			NUMBER(4) 		NOT NULL,
	`title`					VARCHAR(16) 	NOT NULL,
	`first_name`			VARCHAR(32)	NOT NULL,
	`last_name`				VARCHAR(32)	NOT NULL,
	`gender`				VARCHAR(8)		NOT NULL,
	`DOB`					DATE			NOT NULL,
	`phone`					VARCHAR(16)	NOT NULL,
	`email`					VARCHAR(64)	NOT NULL,
	`street_address`		VARCHAR(64)	NOT NULL,
	`city`					VARCHAR(32)	NOT NULL,
	`country`				VARCHAR(32)	NOT NULL,
	`credit_card_type` 		VARCHAR(32)	NOT NULL,
	`credit_card_num`		VARCHAR(16)	NOT NULL,
	`frequent_flier_pts`	NUMBER(6)		NOT NULL,
	`passport_holder`		BOOLEAN			NOT NULL,
	`flight_status`			VARCHAR(8),
	`travel_agent`			VARCHAR(32),
	`username` 				VARCHAR(32)	NOT NULL,
	CONSTRAINT `Cust_PK` PRIMARY KEY(`customer_id`),
	FOREIGN KEY (`username`) REFERENCES `Login`(`username`),
	FOREIGN KEY (`travel_agent`) REFERENCES `AgentProfiles`(`name`),
	CONSTRAINT `usr` UNIQUE (`username`),
	ON DELETE CASCADE
);

CREATE TABLE `Login`
(
	`username`	VARCHAR(32)	NOT NULL,
	`password`	VARCHAR(32)	NOT NULL,
	`role`		VARCHAR(16)	NOT NULL,
	CONSTRAINT `Login_PK` PRIMARY KEY(`username`),
	ON DELETE CASCADE
);

CREATE TABLE `AgentProfiles`
(
	`agent_id`	NUMBER(3)		NOT NULL,
	`name`		VARCHAR(32)	NOT NULL,
	`phone`		VARCHAR(16)	NOT NULL,
	`email`		VARCHAR(64)	NOT NULL,
	CONSTRAINT `Agent_PK` PRIMARY KEY(`agent_id`),
	CONSTRAINT `unq_agent` UNIQUE (`name`, `phone`, `email`),
	ON DELETE CASCADE
);

CREATE TABLE `ServiceInventory`
(
	`service_id`	NUMBER(2)		NOT NULL,
	`item`			VARCHAR(32)	NOT NULL,
	`cost`			NUMBER(3)		NOT NULL,
	`avaliablity`	VARCHAR(32)	NOT NULL,
	CONSTRAINT `Service_PK` PRIMARY KEY(`service_id`),
	ON DELETE CASCADE
);