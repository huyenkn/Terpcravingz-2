

CREATE TABLE dbo.Customer(
   cusId CHAR(22) NOT NULL,
   cusName VARCHAR(40),
   CONSTRAINT pk_Customer_cusId PRIMARY KEY (cusId)
);

CREATE TABLE dbo.Category(
   categoryId CHAR(4) NOT NULL,
   categoryName VARCHAR(50),
   CONSTRAINT pk_Category_categoryId PRIMARY KEY (categoryId)
);

CREATE TABLE dbo.Stop(
    stopId CHAR(5) NOT NULL,
    stopName VARCHAR(100),
    stopLat  DECIMAL(16, 13),
    stopLong DECIMAL(16, 13),
    CONSTRAINT pk_Stop_stopId PRIMARY KEY (stopId)
    );

CREATE TABLE dbo.Shuttle(
    busId CHAR(6) NOT NULL,
    busNo CHAR(3),
    busName VARCHAR(50),
    busFinalDest VARCHAR(50),
    CONSTRAINT pk_Shuttle_busId PRIMARY KEY (busId)
);


CREATE TABLE dbo.Have(
   busId  CHAR(6)  NOT NULL,
   stopId CHAR(5)  NOT NULL,
   CONSTRAINT pk_Have_busId_stopId PRIMARY KEY(busId, stopId),
   CONSTRAINT fk_Have_busId FOREIGN KEY(busId)
        REFERENCES Shuttle(busId)
		    ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_Have_stopId FOREIGN KEY(stopId)
		REFERENCES dbo.Stop(stopId)
		    ON DELETE CASCADE 
            ON UPDATE CASCADE
            );


CREATE TABLE dbo.Restaurant(
    resId CHAR(22) NOT NULL,
    resName VARCHAR(70),
    resStreet VARCHAR(70),
    resCity VARCHAR(25),
    resState CHAR(2),
    resPostalCode CHAR(5),
    resPhoneNo VARCHAR(16),
    resLat DECIMAL(15, 13),
    resLong DECIMAL(15, 13),
    resStars NUMERIC(3, 1),
    resRevCNT INTEGER,
    resPrice INTEGER,
    resTransactionType VARCHAR(22),
    monStartTime TIME(0),
    monEndTime TIME(0),
    tuesStartTime TIME(0),
    tuesEndTime TIME(0),
    wedStartTime TIME(0),
    wedEndTime TIME(0),
    thuStartTime TIME(0),
    thuEndTime TIME(0),
    friStartTime TIME(0),
    friEndTime TIME(0),
    satStartTime TIME(0),
    satEndTime TIME(0),
    sunStartTime TIME(0),
    sunEndTime TIME(0),
    stopId CHAR(5),
    walktimeToRes DECIMAL(6,2),
    CONSTRAINT pk_Restaurant_resId PRIMARY KEY (resId),
    CONSTRAINT fk_Restaurant_stopId FOREIGN KEY (stopId)
		REFERENCES dbo.Stop(stopId)
		    ON DELETE NO ACTION 
            ON UPDATE NO ACTION
        );


CREATE TABLE dbo.Belong(
    resId CHAR(22) NOT NULL,
    categoryId CHAR(4) NOT NULL,
    CONSTRAINT pk_Belong_resId_categoryId PRIMARY KEY (resId, categoryId),
    CONSTRAINT fk_Belong_resId FOREIGN KEY(resId)
        REFERENCES Restaurant(resId)
		    ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_Belong_categoryId FOREIGN KEY(categoryId)
		REFERENCES Category(categoryId)
		    ON DELETE CASCADE
            ON UPDATE CASCADE      
);



CREATE TABLE dbo.Review(
   revId     CHAR(22) NOT NULL,
   revRating INTEGER,
   revDate DATETIME,
   revText   VARCHAR(170),
   cusId CHAR(22),
   resId CHAR(22),
   CONSTRAINT pk_Review_revId PRIMARY KEY (revId),
   CONSTRAINT fk_Review_cusId FOREIGN KEY(cusId)
        REFERENCES Customer(cusId)
		    ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_Review_resId FOREIGN KEY(resId)
		REFERENCES Restaurant(resId)
		    ON DELETE CASCADE 
            ON UPDATE NO ACTION
);