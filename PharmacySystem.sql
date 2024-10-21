--DROPPING TABLES ALONG WITH THIER CONSTRAINTS 
DROP TABLE SUPPLIER CASCADE CONSTRAINTS PURGE;
DROP TABLE ITEMS CASCADE CONSTRAINTS PURGE;
DROP TABLE DEVICES CASCADE CONSTRAINTS PURGE;
DROP TABLE MEDICINE CASCADE CONSTRAINTS PURGE;
DROP TABLE PRESCRIPTION CASCADE CONSTRAINTS PURGE;
DROP TABLE PRESCRIBEDMEDICINE CASCADE CONSTRAINTS PURGE;
DROP TABLE PATIENT CASCADE CONSTRAINTS PURGE;
DROP TABLE INSURANCE CASCADE CONSTRAINTS PURGE;
DROP TABLE INVOICE CASCADE CONSTRAINTS PURGE;
DROP TABLE PHARMACIST CASCADE CONSTRAINTS PURGE;
DROP TABLE BRANCH CASCADE CONSTRAINTS PURGE;
DROP TABLE BRANCH_PHARM CASCADE CONSTRAINTS PURGE;

--DROPPING SEQUENCES 
DROP SEQUENCE INVOICE_SEQ;
DROP SEQUENCE PHARMACIST_SEQ;
DROP SEQUENCE ITEMS_SEQ;
DROP SEQUENCE BRANCH_SEQ;
DROP SEQUENCE PRESCRIPTION_SEQ;
DROP SEQUENCE PATIENT_SEQ;   
DROP SEQUENCE INSURANCE_SEQ;
DROP SEQUENCE SUPPLIER_SEQ;

--DROPPING VIEWS 
Drop view discountDetails;
Drop view orderDetails;
Drop view TotalTax;

--DROPPING INDEXES
Drop Index items_type_indx;
Drop index ITEMS_SUP_INDX;
Drop index ITEMS_OTC_INDX;

--CREATING SUPPLIER TABLE
CREATE TABLE SUPPLIER(
SUPPLIER# VARCHAR2(20) NOT NULL,
FNAME VARCHAR2 (20) NOT NULL ,
LNAME VARCHAR2 (20) NOT NULL ,
PHONE# VARCHAR2(10) NOT NULL,
EMAIL VARCHAR2 (25),
ADDRESS VARCHAR2 (25) DEFAULT 'DUB',
COMPANYNAME VARCHAR2(30)
);

--CREATING ITEMS TABLE
CREATE TABLE ITEMS (
ITEM# VARCHAR2(20) NOT NULL,
ITEMNAME VARCHAR2(40) NOT NULL,
ITEMPRICE NUMBER(7,2) NOT NULL, 
ITEMTYPE  VARCHAR2(10) NOT NULL,
DESCRIPTION VARCHAR2(400) NOT NULL,
QTYINSTOCK  NUMBER(6) NOT NULL,
 OTC VARCHAR2(5) NOT NULL,
SUPPLIER# VARCHAR2(20));

--CREATING MEDICINE TABLE
CREATE TABLE MEDICINE(
ITEM# VARCHAR2(20) NOT NULL,
UNITSIZE VARCHAR2(15) NOT NULL,
FORMATS VARCHAR2(35) NOT NULL,
DOSAGE NUMBER(7,3) NOT NULL
 );

--CREATING DEVICES TABLE
CREATE TABLE DEVICES(
ITEM# VARCHAR2(20) NOT NULL,
 DEVICETYPE VARCHAR2(45) NOT NULL,
 MODEL VARCHAR2(55) NOT NULL
);

--CREATE TABLE PRESCRIPTION 
CREATE TABLE PRESCRIPTION (
  PRESCRIPTION# VARCHAR2(20) NOT NULL,
  ISSUEDATE DATE DEFAULT SYSDATE ,
  DOCTORNAME VARCHAR2(30) NOT NULL,
  PATIENT# VARCHAR2(20) NOT NULL
);

--CREATING PRESCRIBEDMEDICINE TABLE

create table prescribedMedicine (
item# varchar2(20) NOT NULL, 
prescription# varchar2(20) NOT NULL,
QTY number(3) not null,
startDate date DEFAULT SYSDATE,
endDate date
);

--CREATE TABLE PATIENTS 
CREATE TABLE PATIENT(
PATIENT#	VARCHAR2(20)		NOT NULL,
FNAME		VARCHAR2(30)	NOT NULL,
LNAME 		VARCHAR2(30)	NOT NULL,
GENDER	 CHAR(1) 		NOT NULL,
DOB		DATE			NOT NULL,
PHONE#	VARCHAR2(10)	NOT NULL,
CITY		VARCHAR2(10)	NOT NULL,
EMAIL VARCHAR2(35)
);

--CREATE TABLE INSURANCE 
CREATE TABLE INSURANCE (
  INSURANCE# VARCHAR2(20) NOT NULL,
  COMPANYNAME VARCHAR2(30) NOT NULL,
  ENDDATE DATE NOT NULL,
  PATIENT# VARCHAR2(20)
);



--CREATING INVOICE TABLE
CREATE TABLE INVOICE (
	INVOICE# 	        VARCHAR2(10)		NOT NULL, 
	ISSUEDDATE 		    DATE               	DEFAULT SYSDATE,
	TOTAL               NUMBER(7,3)	    	NOT NULL,
	TOTALITEMS	        NUMBER(4)	       	NOT NULL,
    PRESCRIPTION#       VARCHAR2(20),
    PHARMACIST#         VARCHAR2(20)
);
--CREATING PHARMACIST TABLE
CREATE TABLE PHARMACIST (
	PHARMACIST# 		  VARCHAR2(20)		NOT NULL, 
	FNAME 			  VARCHAR2(20)		NOT NULL, 
	LNAME		             VARCHAR2(20)		NOT NULL,
	GENDER		                CHAR(1)	         	              NOT NULL,
	DOB			                DATE               		NOT NULL ,
	LICENSE#	    		   VARCHAR2(10)	         	 NOT NULL,
	HIREDATE 	       		   DATE               		 DEFAULT SYSDATE,
	SALARY		 	   NUMBER(7,3)		 NOT NULL,	
	WORKINGTIME                     VARCHAR2(25)          		 NOT NULL,
EMAIL             	              	  VARCHAR2(35),
PHARMACIST#_FK 		  VARCHAR2(20));



--CREATING BRANCH TABLE
CREATE TABLE BRANCH (
	BRANCH# 	    		VARCHAR2(10)		NOT NULL, 
	LOCATIONS 			VARCHAR2(15)		NOT NULL, 
	OPENINGTIME	  	VARCHAR2 (35)         		NOT NULL,
             AREA                                          VARCHAR(30)		NOT NULL,
	STREET#			VARCHAR2(20)		NOT NULL
);
--CREATING THE JUNCTION TABLE BETWEEN PHARMACIST AND BRANCH
CREATE TABLE BRANCH_PHARM(
BRANCH# 	    	VARCHAR2(10)	NOT NULL, 
PHARMACIST# 	VARCHAR2(20)	NOT NULL
);








--SEQUENCES 
--ADDING SEQUENCE TO THE SUPPLIER TABLE FOR THE PK
CREATE SEQUENCE SUPPLIER_SEQ START WITH 1 INCREMENT BY 1;

--ADDING SEQUENCE TO THE ITEMS TABLE FOR THE PK
CREATE SEQUENCE ITEMS_SEQ START WITH 1 INCREMENT BY 1;

--CREATING SEQUENCES FOR PRESCRIPTION# FOR THE PK
CREATE SEQUENCE PRESCRIPTION_SEQ  START WITH 1  INCREMENT BY 1; 

--ADDING SEQUENCE TO THE PATIENT TABLE FOR THE PK
CREATE SEQUENCE PATIENT_SEQ START WITH 1000  INCREMENT BY 1;

--ADDING SEQUENCE TO THE INSURANCE TABLE FOR THE PK
 CREATE SEQUENCE INSURANCE_SEQ  START WITH 1  INCREMENT BY 1;

--ADDING SEQUENCE TO THE PHARMACIST TABLE FOR THE PK
CREATE SEQUENCE PHARMACIST_SEQ START WITH 1 INCREMENT BY 1;

--ADDING SEQUENCE TO THE INVOICE TABLE FOR THE PK
CREATE SEQUENCE INVOICE_SEQ START WITH 1 INCREMENT BY 1;

--CREATING SEQUENCE TO THE BRANCH TABLE FOR THE PK
CREATE SEQUENCE BRANCH_SEQ START WITH 1 INCREMENT BY 1 ;


--FK AND PK CONSTRAINTS

--PK CONSTRAINTS 
--ADDING SUPPLIER# AS A PK TO SUPPLIER TABLE.
ALTER TABLE SUPPLIER
ADD CONSTRAINT SUPPLIER_PK PRIMARY KEY (supplier#);
-- ADDING ITEMS# AS A PK TO ITEMS TABLE
ALTER TABLE ITEMS ADD CONSTRAINT PK_ITEM PRIMARY KEY (ITEM#);

-- ADDING ITEMS# AS A PK TO MEDICINE TABLE
ALTER TABLE MEDICINE ADD CONSTRAINT PK_MEDICINE PRIMARY KEY (ITEM#);

-- ADDING ITEMS# AS A PK TO DEVICES DEVICES
ALTER TABLE DEVICES ADD CONSTRAINT PK_DEVICES PRIMARY KEY (ITEM#);

--ADDING PRESCRIPTION# AS A PK TO PRESCRIPTION TABLE
ALTER TABLE PRESCRIPTION
ADD CONSTRAINT PK_PRESCRIPTION PRIMARY KEY (PRESCRIPTION#);

--ADDING PK TO THE PRESCRIBEDMEDICINE 
ALTER TABLE PRESCRIBEDMEDICINE
ADD CONSTRAINT PRESCRIPTIONMEDICINE_PK PRIMARY KEY (PRESCRIPTION#, ITEM#);

--ADDING PATIENT# AS A PK TO PATIENTS TABLE
ALTER TABLE PATIENT
ADD CONSTRAINT PK_PATIENT PRIMARY KEY (PATIENT#);

--ADDING INSURANCE# TO THE INSURANCE   AS PK
ALTER TABLE INSURANCE
ADD CONSTRAINT PK_INSURANCE PRIMARY KEY (INSURANCE#);


---- ADDING INVOICE# AS A PK IN THE INVOICE TABLE
ALTER TABLE INVOICE
ADD CONSTRAINT INVOICE_PK PRIMARY KEY ( INVOICE# );

--- ADDING PHARMACIST# AS A PK TO PHARMACIST TABLE
ALTER TABLE PHARMACIST
ADD CONSTRAINT PHARMACIST_PK PRIMARY KEY (PHARMACIST#);

---ADDING  BRANCH# AS A  PK IN BRANCH TABLE.
ALTER TABLE BRANCH
ADD CONSTRAINT BRANCH_PK PRIMARY KEY ( BRANCH# );

--ADDING BRANCH# AND PHARMACIST# TO THE BRANCH_PHARM AS PK
ALTER TABLE BRANCH_PHARM
ADD CONSTRAINT BRANCH_PHARM_A_PK PRIMARY KEY ( BRANCH#, PHARMACIST#);



--FK CONSTRAINTS 

-- ADDING ITEMS AS AN FK TO MEDICINE TABLE
ALTER TABLE MEDICINE ADD CONSTRAINT FK_MEDICINE FOREIGN KEY (ITEM#) 
 REFERENCES ITEMS(ITEM#);


-- ADDING ITEMS# AS AN FK TO DEVICES TABLE
ALTER TABLE DEVICES ADD CONSTRAINT FK_DEVICES FOREIGN KEY (ITEM#) 
 REFERENCES ITEMS(ITEM#);

-- ADDING SUPPLIER# AS AN FK TO ITEMS TABLE
ALTER TABLE ITEMS ADD CONSTRAINT FK_ITEM FOREIGN KEY (SUPPLIER#) 
REFERENCES SUPPLIER(SUPPLIER#);
--ADDING  THE MEDICINE “ITEM#” AS AN FK  TO PRESCRIBEDMEDICINE	
ALTER TABLE PRESCRIBEDMEDICINE
ADD CONSTRAINT MEDICINE_FK FOREIGN KEY (ITEM#)
REFERENCES MEDICINE(ITEM#);

--ADDING  THE PRESCRIPTION AS A FK  TO PRESCRIBEDMEDICINE
ALTER TABLE PRESCRIBEDMEDICINE
ADD CONSTRAINT FK_PRESCRIPTION3
FOREIGN KEY (PRESCRIPTION#)
REFERENCES PRESCRIPTION (PRESCRIPTION#);


--ADDING THE PATIENT# AS AN FK T O THE PRESCRIPTION TABLE
ALTER TABLE PRESCRIPTION
ADD CONSTRAINT PRESCRIPTION_PATIENT_FK FOREIGN KEY (PATIENT#)
REFERENCES PATIENT(PATIENT#);

--ADDING PATIENT# AS AN FK TO THE INSURANCE TABLE
ALTER TABLE INSURANCE
ADD CONSTRAINT INSURANCE_PATIENT_FK FOREIGN KEY (PATIENT#) 
REFERENCES PATIENT(PATIENT#);


--- ADDING PHARMACIST# AS AN FK TO INVOICE TABLE.
ALTER TABLE INVOICE
 ADD CONSTRAINT PH#_INV_FK FOREIGN KEY (PHARMACIST#)
REFERENCES PHARMACIST (PHARMACIST#);

--ADDING PRESCRIPTION# AS AN FK TO THE INVOICE TABLE
ALTER TABLE INVOICE
 ADD CONSTRAINT PRESC_INV_FK FOREIGN KEY (PRESCRIPTION#)
REFERENCES PRESCRIPTION (PRESCRIPTION#);

--ADDING PHARMACIST# TO THE BRANCH_PHARM AS FK
ALTER TABLE BRANCH_PHARM
ADD CONSTRAINT BRANCH_PHARM_P_FK FOREIGN KEY (PHARMACIST#) REFERENCES PHARMACIST(PHARMACIST#);

--ADDING BRANCH# TO THE BRANCH_PHARM AS FK
ALTER TABLE BRANCH_PHARM
ADD CONSTRAINT BRANCH_PHARM_B_FK FOREIGN KEY (BRANCH#) REFERENCES BRANCH(BRANCH#);


--- ADDING PHARMACIST# AS AN FK TO PHARMACIST TABLE
ALTER TABLE PHARMACIST
ADD CONSTRAINT P#_PHRM_FK FOREIGN KEY (PHARMACIST#_FK )
REFERENCES PHARMACIST (PHARMACIST#);



--CHECK CONSTRAINTS 
--PATIENT CHECK AND UNIQUE 
--ADD CHECK CONSTRAINTS TO THE PATIENTS FOR THE COLUMN GENDER;
ALTER TABLE PATIENT
ADD CONSTRAINT CHK_GENDER CHECK (GENDER IN ('M', 'F'));
--ADDING UNIQUE CONSTRAINT TO THE EMAIL COLUMN IN PATIENTS;
ALTER TABLE PATIENT
ADD CONSTRAINT UNIQ_EMAIL UNIQUE (EMAIL);
--ADDING CHECK TO THE ADDRESS OF THE PATIENT
ALTER TABLE PATIENT
ADD CONSTRAINT ADDRESS_CK CHECK (CITY IN ('DUB', 'SHJ', 'AD', 'UAQ', 'FUJ', 'AJM', 'KHF', 'ALAIN', 'RAK' ));

--SUPPLIER
--ADDING UNIQUE CONSTRAINT TO THE EMAIL COLUMN
ALTER TABLE SUPPLIER
ADD CONSTRAINT EMAIL_UN_sup UNIQUE (EMAIL);
--ADDING UNIQUE CONSTRAINT TO THE PHONE# COLUMN IN SUPPLIER TABLE
ALTER TABLE SUPPLIER
ADD CONSTRAINT PHONE_UN_sup UNIQUE (PHONE#);
--ADDING CHECK TO THE ADDRESS OF THE SUPPLIER
ALTER TABLE SUPPLIER
ADD CONSTRAINT ADDRESS_CK_sup CHECK (ADDRESS IN ('DUB', 'SHJ', 'AD', 'UAQ', 'FUJ', 'AJM', 'KHF', 'ALAIN', 'RAK' ));
--PHARMACIST
--ADDING CHECK CONSTRAINTS TO THE GENDER
ALTER TABLE PHARMACIST
ADD CONSTRAINT GENDER_CK CHECK (GENDER IN ('F', 'M'));

--- ADDING CHECK CONSTRAINTS TO THE PHARMACIST SALARY 
ALTER TABLE PHARMACIST
ADD CONSTRAINT SALARY_CK CHECK (SALARY > 0);
--ITEM
--ADDING CHECK CONSTRAINT TO THE ITEM’S PRICE:
ALTER TABLE ITEMS ADD CONSTRAINT CHK_ITEMS_PRICE CHECK 
(ITEMPRICE>=0);

--ADDING CHECK CONSTRAINT TO THE ITEM TYPE
ALTER TABLE ITEMS ADD CONSTRAINT CHK_ITEMS_TYPE CHECK 
(ITEMTYPE IN ('D','M'));

--ADDING CHECK CONSTRAINT TO THE QUANTITY IN STOCK;
ALTER TABLE ITEMS ADD CONSTRAINT CHK_ITEMS_QTY CHECK 
(QTYINSTOCK>=0);

--ADDING CHECK CONSTRAINT TO THE OVER THE COUNTER;
ALTER TABLE ITEMS ADD CONSTRAINT CHK_ITEMS_OTC CHECK 
(OTC IN('Y','N'));

--BRANCH 
--ADDING CHECK CONSTRAINTS TO THE LOCATIONS COLUMN 
ALTER TABLE BRANCH ADD CONSTRAINT 
CHK_LOCATIONS CHECK (LOCATIONS IN('DUB', 'SHJ', 'AD', 'UAQ', 'FUJ', 'AJM', 'KHF', 'ALAIN', 'RAK' ));

-- PRESCRIBED_MEDICNE TABLE CHECK AND UNIQUE.
--ADDING CHECK TO QTY 
ALTER TABLE PRESCRIBEDMEDICINE
ADD CONSTRAINT QTY_CK CHECK (QTY > 0) ;
--INVOICE 
--ADDING CONSTRAINTS TO THE TOTAL 
ALTER TABLE INVOICE
	
ADD CONSTRAINT TOTAL_INV_CHK CHECK (TOTAL >0 );
Alter table INVOICE
ADD CONSTRAINT TOTALITEM_INV_CHK CHECK (TOTAlitems>0);

--- ADDING UNIQUE  CONSTRAINTS TO THE PHARMACIST LICENSES IN PHARMACIST TABLE.
ALTER TABLE PHARMACIST
ADD CONSTRAINT PHR_UNQ UNIQUE (LICENSE#); 


--INSERTING RECORDS INTO SUPPLIER
INSERT INTO SUPPLIER
VALUES (SUPPLIER_SEQ.NEXTVAL, 'AHMED', 'ALALI', '0501222221', 'AHMED@HOTMAIL.COM', 'DUB', 'PHARMALOGIX');
INSERT INTO SUPPLIER
VALUES (SUPPLIER_SEQ.NEXTVAL, 'MOHAMMED', 'ALI', '0501323229', 'MOHALI@HOTMAIL.COM', 'DUB', 'MEDIPRO SOLUTION');
INSERT INTO SUPPLIER
VALUES (SUPPLIER_SEQ.NEXTVAL, 'RANYA', 'ALHOSANI', '0503948982', 'RANYA@HOTMAIL.COM', 'SHJ', 'HEALTHTECH SUPPLIES');
INSERT INTO SUPPLIER
VALUES (SUPPLIER_SEQ.NEXTVAL, 'MUNA', 'ALBLOOSHI', '0503989876', 'MUNA@HOTMAIL.COM', 'UAQ', 'RXNET SOLUTIONS');
INSERT INTO SUPPLIER
VALUES (SUPPLIER_SEQ.NEXTVAL, 'AHMED', 'ABDULLA', '0509000900', 'AHABDULLA@HOTMAIL.COM', 'DUB', 'PHARMACONNECT');
INSERT INTO SUPPLIER
VALUES (SUPPLIER_SEQ.NEXTVAL, 'AMNA', 'ALHAMADI', '0507777888', 'AMNA@GMAIL.COM', 'SHJ', 'CAREWISE');
INSERT INTO SUPPLIER
VALUES (SUPPLIER_SEQ.NEXTVAL, 'HAMAD', 'MOHAMMED', '0524444898', 'HAMAD@HOTMAIL.COM', 'DUB', 'MEDSUPPLY DEPOT');
INSERT INTO SUPPLIER
VALUES (SUPPLIER_SEQ.NEXTVAL, 'MARIAM', 'JASSIM', '0501112221', 'MARIAM@HOTMAIL.COM', 'UAQ', 'DOC PRO');
INSERT INTO SUPPLIER
VALUES (SUPPLIER_SEQ.NEXTVAL, 'ABDULLA', 'ALKETBI', '0501100831', 'ABDULLA@HOTMAIL.COM', 'AD', 'HEALTHLINK DISTRIBUTORS');

--INSERTING RECORDS INTO ITEMS 

--INSERTING VALUES INTO ITEMS TABLE
INSERT INTO ITEMS
VALUES (ITEMS_SEQ.NEXTVAL, 'INHALER', 150.95 , 'D', 'THE VENTOLIN INHALER
IS USED TO TREAT ASTHMA AND HELPS PEOPLE BREATHE EASIER BY EXPANDING AND IT IS USED FOR QUICK RELIEF OF SYMPTOMS .', '23', 'N', '1');

INSERT INTO ITEMS
VALUES (ITEMS_SEQ.NEXTVAL, 'THERMOMETER', 99 , 'D', 'INFRARED EAR THERMOSCAN IS USED FOR SCREENING FOR FEVERS IN NEWBORNS AND CHILDREN.   WITH A TEMPERATURE GUIDING SYSTEM THAT ADJUSTS THE LIGHTING FROM GREEN TO YELLOW TO RED BASED ON THE TEMPERATURE READING.', '240', 'Y', '2');
INSERT INTO ITEMS
VALUES (ITEMS_SEQ.NEXTVAL, 'PARACETAMOL', 34 , 'M', ' IT IS FREQUENTLY USED TO TREAT FEVERS BROUGHT ON BY ILLNESSES LIKE THE FLU AND THE COMMON COLD AS WELL AS MILD TO MODERATE PAIN, SUCH AS HEADACHES, TOOTHACHES, AND SPRAINS.', '700', 'Y', '5');
INSERT INTO ITEMS
VALUES (ITEMS_SEQ.NEXTVAL, 'BLOOD PRESSURE CHECKER', 250 , 'D', 'USED FOR QUICK AND PRECISE BLOOD PRESSURE READINGS FROM THE UPPER ARM. THE OSCILLOMETRIC BLOOD PRESSURE MONITOR HAS AN LCD DISPLAY, A POWER BUTTON, A HOSE PORT, A BATTERY COMPARTMENT, A CONNECTOR, AN ARM CUFF, AND AN AIR HOSE.', '20', 'Y', '6');
INSERT INTO ITEMS
VALUES (ITEMS_SEQ.NEXTVAL, 'DOXYCYCLINE ANTIBIOTIC', 250 , 'M', 'DOXYCYCLINE  CAPSULES ARE USED TO TREAT BACTERIAL INFECTIONS. IT PREVENTS BACTERIA FROM PRODUCING PROTEINS, WHICH LIMITS THEIR ABILITY TO GROW.', '70', 'N', '8' );
INSERT INTO ITEMS	
VALUES (ITEMS_SEQ.NEXTVAL, 'MULTIVITAMINS ', 70 , 'M', 'CONTAINS 16 MULTIVITAMINS AND MINERALS NEEDED TO MEET DAILY VITAMIN NEEDS FOR IMMUNITY AND STRENGTH. FREE OF GLUTEN AND GELATIN, AND WITHOUT OTHER PRESERVATIVES. CONTAINS TAPIOCA AND SUGAR CANE.', '260', 'N', '3');
INSERT INTO ITEMS
VALUES (ITEMS_SEQ.NEXTVAL, 'CEFALEXIN ANTIBIOTIC', 430 , 'M', ' CEFALEXIN IS PRESCRIBED TO PATIENTS TO TREAT BACTERIAL INFECTIONS IN VARIOUS BODY AREAS. THIS INCLUDES INFECTIONS OF THE SKIN, SOFT TISSUE, KIDNEYS, BLADDER, SINUSES, EARS, AND AIRWAYS (CHEST AND LUNGS).', 10, 'N', '7');
INSERT INTO ITEMS
VALUES (ITEMS_SEQ.NEXTVAL, 'INSULIN PUMP', 730 , 'D', 'USED TO CONTINUOUSLY PUMP INSULIN INTO THE BODY, DAY, AND NIGHT, USING A TINY PLASTIC TUBE. IT BENEFITS DIABETICS BY GIVING PATIENTS MORE CONTROL OVER HOW THEY CONTROL THEIR BLOOD SUGAR LEVELS.', 190, 'N', '4');
INSERT INTO ITEMS
VALUES (ITEMS_SEQ.NEXTVAL, 'ISOTRETINOIN', 730 , 'M', 'ISOTRETINOIN IS A TYPE OF RETINOID MEDICINE. IT IS AN ORAL PRESCRIPTION DRUG USED TO TREAT SEVERE ACNE THAT AFFECTS THE SEBACEOUS GLANDS.', 21, 'N', '9');
INSERT INTO ITEMS
VALUES (ITEMS_SEQ.NEXTVAL, 'NEBULIZER', 105 , 'D', 'COMPRESSOR NEBULIZER FOR THE TREATMENT OF RESPIRATORY ALLERGIES IN ADULTS AND CHILDREN. ITS PERFECT FOR DAILY USAGE BECAUSE THE ATTACHMENTS ARE SIMPLE TO WASH AND DISINFECT, AND THE MEDICATION IS DELIVERED QUICKLY AND EFFECTIVELY.', 23, 'Y', '6');
INSERT INTO ITEMS
VALUES (ITEMS_SEQ.NEXTVAL, 'PULSE OXIMETERS', 95 , 'D', ' BLOOD OXYGEN SATURATION LEVELS AND PULSE RATE CAN BE PRECISELY MEASURED USING A MULTIFUNCTIONAL DIGITAL PULSE OXIMETER. AS WELL AS SUPPORTING SPO2 AND PULSE, IT IS EASY TO READ AND INCLUDES AN LED DISPLAY THAT MAKES IT SIMPLER TO SEE THE FINDINGS.', 12, 'Y', '4');
INSERT INTO ITEMS
VALUES (ITEMS_SEQ.NEXTVAL, 'WEIGHT SCALE', 65 , 'D', 'MADE FROM ABS MATERIAL WITH A MODERN DESIGN, THIS SCALE HAS A DIGITAL LCD DISPLAY. FURTHER, THIS SCALE IS A SMART SOLUTION TO KEEP YOUR WEIGHT IN CHECK.', 14, 'Y', '2');
INSERT INTO ITEMS
VALUES (ITEMS_SEQ.NEXTVAL, 'IBUPROFEN', 32 , 'M', 'IBUPROFEN IS A NON-STEROIDAL ANTI-INFLAMMATORY DRUG (NSAID). IT IS A SAFE AND EFFICIENT PAINKILLER AND FEVER REDUCER. IT HELPS WITH HEADACHE, BACKACHE, MUSCULAR, MINOR ARTHRITIC, AND COLD-RELATED ACHES AND PAINS.', 30, 'Y', '1');

INSERT INTO ITEMS
VALUES (ITEMS_SEQ.NEXTVAL, 'VITIFECT SYRUP', 35 , 'M', 'VITIFECT SYRUP PROVIDES THE DAILY REQUIRED DOSE OF VITAMINS AND CALCIUM NECESSARY TO SUPPORT HEALTHY GROWTH ESPECIALLY DURING THE GROWTH PHASE IN CHILDREN, HELPS TO PROMOTE APPETITE, INSURE HEALTHY BONES AND TEETH, BOOSTS IMMUNEITY.', 30, 'Y', '4');
INSERT INTO ITEMS
VALUES (ITEMS_SEQ.NEXTVAL, 'EPIDUO', 105 , 'M', 'EPIDUO IS A GEL-BASED, FIXED-DOSE COMBINATION DRUG USED TO TREAT SEVERE ACNE. IT COMBINES ACTIVE SUBSTANCES  ADAPALENE AND BENZOYL PEROXIDE.', 50, 'N', '8');
INSERT INTO ITEMS
VALUES (ITEMS_SEQ.NEXTVAL, 'PARACETAMOL', 15 , 'M', 'USED TO TREAT MILD TO MODERATE PAIN IN CHILDREN, SUCH AS NEW TEETHING PAIN, COLD, FLU, SORE THROAT, AND COUGH.', 90, 'N', '7');
INSERT INTO ITEMS
VALUES (ITEMS_SEQ.NEXTVAL, 'VITAMIN D', 55 , 'M', 'IMPROVES BONE HEALTH AND MUSCLE STRENGTH AND IT HELPS DIABETICS NERVOUS SYSTEM'', ', 6, 'N', '3');

INSERT INTO ITEMS
VALUES (ITEMS_SEQ.NEXTVAL, 'CLARINASE TABLET', 2 , 'M', 'CONSISTS OF TWO MEDICATIONS: AN ANTIHISTAMINE AND A DECONGESTANT. HELPS REDUCE ALLERGIC OR COLD SIDE EFFECTS AND HELPS CLEAR NASAL CONGESTION.', 3, 'N', '3');

INSERT INTO ITEMS
VALUES (ITEMS_SEQ.NEXTVAL, 'CLOBETASOL ', 150 , 'M', ' A STEROID MEDICATION USED TO TREAT SWELLING, ITCHING, AND IRRITATION OF THE SKIN. IT IS EFFECTIVE IN REDUCING THE SWELLING AND PAIN CAUSED BY AN ALLERGIC REACTION.', 3, 'N', '5');

--INSERTING RECORDS INTO MEDICINES

INSERT INTO MEDICINE VALUES('3', 'MG', 'TABLETS ', '500'  );
INSERT INTO MEDICINE VALUES('5', 'MG', 'CAPSULE ', '100'  );
INSERT INTO MEDICINE VALUES('6', ' MG ', 'CAPSULE ', '100');
INSERT INTO MEDICINE VALUES('7', ' MG ', 'CAPSULE ', '500');
INSERT INTO MEDICINE VALUES('9', ' MG ', 'CAPSULE ', '30');
INSERT INTO MEDICINE VALUES ('10', ' MG ', 'CAPSULE ', '0.025');
INSERT INTO MEDICINE VALUES('14', ' MG ', 'TOPICAL GEL ', '200');
INSERT INTO MEDICINE VALUES('15', ' ML ', 'LIQUID ', '120');
INSERT INTO MEDICINE VALUES('16', ' ML ', 'SYRUP', '200');
INSERT INTO MEDICINE VALUES('17', ' MG ', 'CAPSULE', '1000');
INSERT INTO MEDICINE VALUES('18', ' MG', 'TABLETS', '10');
INSERT INTO MEDICINE VALUES('19', ' MG', 'OINTMENT', '0.05');


--INSERTING RECORDS INTO DEVICES 
              INSERT INTO DEVICES VALUES('1', 'AM2013', 'PRESSURIZED METERED DOSE INHALER (PMDI)');
	INSERT INTO DEVICES VALUES('2', '6K2023', 'DIGITAL INFRARED THERMOMETERS');
	INSERT INTO DEVICES VALUES('4', 'CGM234', 'DIGITAL READER ');
              INSERT INTO DEVICES VALUES('8', '32JL', 'DIGITAL READER');
	INSERT INTO DEVICES VALUES('11', '1975MH', 'NOZZLE (COMPRESSOR)');
	INSERT INTO DEVICES VALUES('12', 'CHT50', 'DIGITAL READER');
	INSERT INTO DEVICES VALUES('13', 'SH5', 'DIGITAL READER');


--INSERTING RECORDS INTO PATIENT 
INSERT INTO PATIENT
VALUES (PATIENT_SEQ.NEXTVAL, 'FATIMA', 'ALALI', 'F', '01-JAN-1990', '0501234567', 'DUB', 'FATIMAALALI@GMAIL.COM');

INSERT INTO PATIENT (PATIENT#, FNAME, LNAME, GENDER, DOB, PHONE#, CITY, EMAIL)
VALUES (PATIENT_SEQ.NEXTVAL, 'AHMED', 'ALHAMMADI', 'M', '02-FEB-1985', '0522345678', 'AD', 'AHMEDALHAMMADI@YAHOO.COM');

INSERT INTO PATIENT (PATIENT#, FNAME, LNAME, GENDER, DOB, PHONE#, CITY, EMAIL)
VALUES (PATIENT_SEQ.NEXTVAL, 'SARA', 'ALKETBI', 'F', '03-MAR-1992', '0543456789', 'SHJ', 'SARAALKETBI@HOTMAIL.COM');

INSERT INTO PATIENT (PATIENT#, FNAME, LNAME, GENDER, DOB, PHONE#, CITY, EMAIL)
VALUES (PATIENT_SEQ.NEXTVAL, 'ALI', 'ALMAZMI', 'M', '04-APR-1983', '0564567890', 'DUB', 'ALIALMAZMI@GMAIL.COM');

INSERT INTO PATIENT (PATIENT#, FNAME, LNAME, GENDER, DOB, PHONE#, CITY, EMAIL)
VALUES (PATIENT_SEQ.NEXTVAL, 'AISHA', 'ALMANSOURI', 'F', '05-MAY-1980', '0525678901', 'AJM', 'AISHAALMANSOURI@YAHOO.COM');

INSERT INTO PATIENT (PATIENT#, FNAME, LNAME, GENDER, DOB, PHONE#, CITY, EMAIL)
VALUES (PATIENT_SEQ.NEXTVAL, 'HASSAN', 'ALHMOUDI', 'M', '06-JUN-1995', '0506789012', 'FUJ', 'HASSANALHMOUDI@HOTMAIL.COM');

INSERT INTO PATIENT (PATIENT#, FNAME, LNAME, GENDER, DOB, PHONE#, CITY, EMAIL)
VALUES (PATIENT_SEQ.NEXTVAL, 'ZAINAB', 'ALHOSANI', 'F', '07-JUL-1999', '0567890123', 'DUB', 'ZAINABALHOSANI@GMAIL.COM');

INSERT INTO PATIENT (PATIENT#, FNAME, LNAME, GENDER, DOB, PHONE#, CITY, EMAIL)
VALUES (PATIENT_SEQ.NEXTVAL, 'KHALIFA', 'ALAMIRI', 'M', '08-AUG-1989', '0548901234', 'AD', 'KHALIFAALAMIRI@YAHOO.COM');

INSERT INTO PATIENT (PATIENT#, FNAME, LNAME, GENDER, DOB, PHONE#, CITY, EMAIL)
VALUES (PATIENT_SEQ.NEXTVAL, 'NADA', 'ALALI', 'F', '09-SEP-1997', '0529012345', 'SHJ', 'NADAALALI@HOTMAIL.COM');

INSERT INTO PATIENT (PATIENT#, FNAME, LNAME, GENDER, DOB, PHONE#, CITY, EMAIL)
VALUES (PATIENT_SEQ.NEXTVAL, 'MOHAMMED', 'ALSHEHI', 'M', '10-OCT-1988', '0500123456', 'DUB', 'MOHAMMEDALSHEHI@GMAIL.COM');

INSERT INTO PATIENT (PATIENT#, FNAME, LNAME, GENDER, DOB, PHONE#, CITY, EMAIL)
VALUES (PATIENT_SEQ.NEXTVAL, 'JASSIM', 'OBAID', 'M', '21-OCT-2003', '0500123456', 'UAQ', 'JASSIMOBAID@OUTLOOK.COM');


--INSERTING RECORDS INTO PRESCRIPTION 
INSERT INTO PRESCRIPTION 
VALUES (PRESCRIPTION_SEQ.NEXTVAL, '03-APR-2023', 'DR. AHMED MOHAMMED', '1000');

INSERT INTO PRESCRIPTION 
VALUES (PRESCRIPTION_SEQ.NEXTVAL, '02-APR-2023' , 'DR. EMILY HASSAN', '1001');

INSERT INTO PRESCRIPTION 
VALUES (PRESCRIPTION_SEQ.NEXTVAL, '01-APR-2023', 'DR. ALI KHALIL', '1002');

INSERT INTO PRESCRIPTION
VALUES (PRESCRIPTION_SEQ.NEXTVAL, '30-MAR-2023', 'DR. AISHA SALEH', '1003');

INSERT INTO PRESCRIPTION
VALUES (PRESCRIPTION_SEQ.NEXTVAL, '29-MAR-2023', 'DR. OMAR AL-MASRI', '1004');

INSERT INTO PRESCRIPTION 
VALUES (PRESCRIPTION_SEQ.NEXTVAL, '28-MAR-2023',  'DR. FATIMA ABDALLAH', '1005');

INSERT INTO PRESCRIPTION 
VALUES (PRESCRIPTION_SEQ.NEXTVAL, '26-MAR-2023',  'DR. HALA MAHMOUD', '1007');

INSERT INTO PRESCRIPTION 
VALUES (PRESCRIPTION_SEQ.NEXTVAL, '25-MAR-2023',  'DR. YOUSSEF HAMZA', '1008');

INSERT INTO PRESCRIPTION
VALUES (PRESCRIPTION_SEQ.NEXTVAL, '24-MAR-2023',  'DR. LAILA AHMED', '1009');

INSERT INTO PRESCRIPTION 
VALUES (PRESCRIPTION_SEQ.NEXTVAL, '15-AUG-2022', 'DR. FATIMA HASSAN', '1003');

INSERT INTO PRESCRIPTION 
VALUES (PRESCRIPTION_SEQ.NEXTVAL, '22-SEP-2022',  'DR. KHALID MOHAMED', '1004');




--INSERTING RECORDS INTO PRESCRIBED MEDICINE 
INSERT INTO PRESCRIBEDMEDICINE
VALUES ('6', '3' , 2, TO_DATE('01-04-23','DD/MM/YY' ), TO_DATE('03-05-23','DD/MM/YY' ));

INSERT INTO PRESCRIBEDMEDICINE
VALUES ('7', '4' , 3, TO_DATE('30-03-23','DD/MM/YY' ), TO_DATE('30-06-23','DD/MM/YY' ));

INSERT INTO PRESCRIBEDMEDICINE
VALUES ('10', '4' , 3, TO_DATE('30-03-23','DD/MM/YY' ), TO_DATE('25-05-23','DD/MM/YY' ));

INSERT INTO PRESCRIBEDMEDICINE
VALUES ('6', '5' , 1, TO_DATE('29-03-23','DD/MM/YY' ), TO_DATE('29-04-23','DD/MM/YY' ));

INSERT INTO PRESCRIBEDMEDICINE
VALUES ('17', '6' , 4, TO_DATE('28-03-23','DD/MM/YY' ), TO_DATE('29-07-23','DD/MM/YY' ));

INSERT INTO PRESCRIBEDMEDICINE
VALUES ('5', '7' , 3, TO_DATE('27-03-23','DD/MM/YY' ), TO_DATE('03-05-23','DD/MM/YY' ));

INSERT INTO PRESCRIBEDMEDICINE
VALUES ('17', '8' , 3, TO_DATE('26-03-23','DD/MM/YY' ), TO_DATE('26-06-23','DD/MM/YY' ));

INSERT INTO PRESCRIBEDMEDICINE
VALUES ('19', '8' , 2, TO_DATE('26-03-23','DD/MM/YY' ), TO_DATE('26-05-23','DD/MM/YY' ));

INSERT INTO PRESCRIBEDMEDICINE
VALUES ('6', '9' , 3, TO_DATE('25-03-23','DD/MM/YY' ), TO_DATE('01-08-23','DD/MM/YY' ));

INSERT INTO PRESCRIBEDMEDICINE
VALUES ('10', '9' , 3, TO_DATE('25-03-23','DD/MM/YY' ), TO_DATE('02-05-23','DD/MM/YY' ));

INSERT INTO PRESCRIBEDMEDICINE
VALUES ('18', '10' , 5, TO_DATE('24-03-23','DD/MM/YY' ), TO_DATE('20-04-23','DD/MM/YY' ));

INSERT INTO PRESCRIBEDMEDICINE
VALUES ('19', '11' , 1, TO_DATE('23-03-23','DD/MM/YY' ), TO_DATE('17-04-23','DD/MM/YY' ));
--INSERTING RECORDS INTO INSURANCE 
INSERT INTO INSURANCE 
VALUES (INSURANCE_SEQ.NEXTVAL, 'ORIENT INSURANCE', '30-APR-2024', '1000');

INSERT INTO INSURANCE 
VALUES (INSURANCE_SEQ.NEXTVAL, 'BUPA INSURANCE', '31-MAY-2024', '1001');

INSERT INTO INSURANCE 
VALUES (INSURANCE_SEQ.NEXTVAL, 'DAMAN INSURANCE', '26-JUN-2025', '1002');

INSERT INTO INSURANCE 
VALUES (INSURANCE_SEQ.NEXTVAL, 'EMIRATES INSURANCE', '30-JAN-2026', '1003');

INSERT INTO INSURANCE 
VALUES (INSURANCE_SEQ.NEXTVAL, 'NOOR TAKAFUL INSURANCE', '01-AUG-2030', '1004');

INSERT INTO INSURANCE 
VALUES (INSURANCE_SEQ.NEXTVAL, 'THEQA INSURANCE', '01-NOV-2027', '1005');

INSERT INTO INSURANCE 
VALUES (INSURANCE_SEQ.NEXTVAL, 'RAS AL-KHAIMAH INSURANCE', '31-OCT-2023', '1006');

--INSERTING RECORDS INTO PHARMACIST 
INSERT INTO PHARMACIST (Pharmacist#, Fname, Lname, Gender, Dob, License#, Hiredate, Salary, Workingtime, Email, Pharmacist#_FK )
VALUES (Pharmacist_Seq.Nextval, 'Fatma', 'Ramadan', 'F', '16-Jan-2001', 'H00445683', '18-Dec-2021', '3000', '10am To 4 Pm', 'H00445683@Hct.ac.ee', null);

INSERT INTO PHARMACIST (Pharmacist#, Fname, Lname, Gender, Dob, License#, Hiredate, Salary, Workingtime, Email, Pharmacist#_FK )
VALUES (Pharmacist_Seq.Nextval, 'Maryam', 'Waleed', 'F', '14-Aug-2000', 'H00445586', '01-Mar-2020', '3500', '9am To 5pm', 'H00445586@Hct.ac.ae', null);

INSERT INTO PHARMACIST (Pharmacist#, Fname, Lname, Gender, Dob, License#, Hiredate, Salary, Workingtime, Email, Pharmacist#_FK )
VALUES (Pharmacist_Seq.Nextval, 'Hind', 'Alhammadi', 'F', '02-Jul-1990', 'H00996640', '15-Apr-2019', '4200', '10am To 6pm', 'H00445507@Hct.ac.ae', null);


INSERT INTO PHARMACIST (Pharmacist#, Fname, Lname, Gender, Dob, License#, Hiredate, Salary, Workingtime, Email, Pharmacist#_FK )
VALUES (Pharmacist_Seq.Nextval, 'Hour', 'Alhammadi', 'F', '26-Sep-1988', 'H00325450', '05-Feb-2022', '2900', '11am To 7pm', 'H00445580@Hct.ac.ae', null);


INSERT INTO PHARMACIST (Pharmacist#, Fname, Lname, Gender, Dob, License#, Hiredate, Salary, Workingtime, Email, Pharmacist#_FK )
VALUES (Pharmacist_Seq.Nextval, 'Adam', 'Lee', 'M', '18-May-1995', 'H45456767', '21-Nov-2018', '3800', '9am To 5pm', NULL, null);


INSERT INTO PHARMACIST (Pharmacist#, Fname, Lname, Gender, Dob, License#, Hiredate, Salary, Workingtime, Email, Pharmacist#_FK )
VALUES (Pharmacist_Seq.Nextval, 'Olivia', 'Taylor', 'F', '09-Jan-1983', 'H09786534', '07-Sep-2020', '3100', '10am To 6pm', 'olivia.taylor@hotmail.com', null);


INSERT INTO PHARMACIST (Pharmacist#, Fname, Lname, Gender, Dob, License#, Hiredate, Salary, Workingtime, Email, Pharmacist#_FK )
VALUES (Pharmacist_Seq.Nextval, 'Michael', 'Davis', 'M', '03-Dec-1992', 'H99117654', '28-Feb-2017', '4600', '11am To 7pm', NULL, null);


INSERT INTO PHARMACIST (Pharmacist#, Fname, Lname, Gender, Dob, License#, Hiredate, Salary, Workingtime, Email, Pharmacist#_FK )
VALUES (Pharmacist_Seq.Nextval, 'Sophia', 'Wilson', 'F', '29-Nov-1987', 'H79791100', '14-Aug-2021', '3200', '9am To 5pm', 'sophia.wilson@gmail.com', null);


INSERT INTO PHARMACIST (Pharmacist#, Fname, Lname, Gender, Dob, License#, Hiredate, Salary, Workingtime, Email, Pharmacist#_FK )
VALUES (Pharmacist_Seq.Nextval, 'David', 'Clark', 'M', '22-Feb-1991', 'H88990011', '09-Jun-2018', '3900', '10am To 6pm', 'david.clark@gmail.com', null);


INSERT INTO PHARMACIST (Pharmacist#, Fname, Lname, Gender, Dob, License#, Hiredate, Salary, Workingtime, Email, Pharmacist#_FK )
VALUES (Pharmacist_Seq.Nextval, 'Emma', 'Garcia', 'F', '16-Apr-1998', 'H00112233', '03-Jan-2023', '2800', '11am To 7pm', 'emma.garcia@gmail.com', null);


INSERT INTO PHARMACIST (Pharmacist#, Fname, Lname, Gender, Dob, License#, Hiredate, Salary, Workingtime, Email , Pharmacist#_FK )
VALUES (Pharmacist_Seq.Nextval, 'Mia', 'Lopez', 'F', '30-Jan-1986', 'H90094455', '12-Jun-2019', '3300', '10am To 6pm', 'mia.lopez@gmail.com', null);


INSERT INTO PHARMACIST (Pharmacist#, Fname, Lname, Gender, Dob, License#, Hiredate, Salary, Workingtime, Email, Pharmacist#_FK )
VALUES (Pharmacist_Seq.Nextval, 'Alexander', 'Martinez', 'M', '23-Mar-1993', 'H00995566', '27-Dec-2021', '4200', '11am To 7pm', 'alexander.martinez@gmail.com', null);


INSERT INTO PHARMACIST (Pharmacist#, Fname, Lname, Gender, Dob, License#, Hiredate, Salary, Workingtime, Email, Pharmacist#_FK )
VALUES (Pharmacist_Seq.Nextval, 'Chloe', 'Gonzalez', 'F', '11-Nov-1984', 'H00666677', '14-Sep-2020', '2900', '9am To 5pm', 'chloe.gonzalez@gmail.com', null);


INSERT INTO PHARMACIST (Pharmacist#, Fname, Lname, Gender, Dob, License#, Hiredate, 
Salary, Workingtime, Email, Pharmacist#_FK )
VALUES (Pharmacist_Seq.Nextval, 'Ethan', 'Hernandez', 'M', '02-Jun-1996', 'H11223344', '01-Mar-2018', '3800', '10am To 6pm', 'ethan.hernandez@gmail.com', null);


INSERT INTO PHARMACIST (Pharmacist#, Fname, Lname, Gender, Dob, License#, Hiredate, Salary, Workingtime, Email, Pharmacist#_FK )
VALUES (Pharmacist_Seq.Nextval, 'Ava', 'Rivera', 'F', '25-Oct-1989', 'H44448899', '18-Aug-2022', '3500', '11am To 7pm', NULL , null);


INSERT INTO PHARMACIST (Pharmacist#, Fname, Lname, Gender, Dob, License#, Hiredate, Salary, Workingtime, Email, Pharmacist#_FK )
VALUES (Pharmacist_Seq.Nextval, 'William', 'Gomez', 'M', '17-Feb-1997', 'H00339900', '05-May-2017', '4600', '9am To 5pm', 'william.gomez@gmail.com', null);


--Updating the FK Pharmacist#_FK in pharmacist table.
Update pharmacist set Pharmacist#_FK = '12' 
Where pharmacist# = '2';

Update pharmacist set Pharmacist#_FK = '12' 
Where pharmacist# = '11';

Update pharmacist set Pharmacist#_FK = '12' 
Where pharmacist# = '14';

Update pharmacist set Pharmacist#_FK = '1' 
Where pharmacist# = '5';

Update pharmacist set Pharmacist#_FK = '1' 
Where pharmacist# = '13';

Update pharmacist set Pharmacist#_FK = '1' 
Where pharmacist# = '9';

 Update pharmacist set Pharmacist#_FK = '1' 
Where pharmacist# = '4';

Update pharmacist set Pharmacist#_FK = '12' 
Where pharmacist# = '6';

Update pharmacist set Pharmacist#_FK = '12' 
Where pharmacist# = '7';

Update pharmacist set Pharmacist#_FK = '1' 
Where pharmacist# = '8';

Update pharmacist set Pharmacist#_FK = '12' 
Where pharmacist# = '10';

Update pharmacist set Pharmacist#_FK = '12' 
Where pharmacist# = '15';

Update pharmacist set Pharmacist#_FK = '16' 
Where pharmacist# = '3';


--INSERTING RECORDS INTO INVOICE 
INSERT INTO INVOICE 
VALUES ( INVOICE_SEQ .NEXTVAL, '19-FEB-2023', 930, 3, '1', '1');

INSERT INTO INVOICE (INVOICE# , ISSUEDDATE, TOTAL, TOTALITEMS, PHARMACIST#, PRESCRIPTION#)
VALUES ( INVOICE_SEQ .NEXTVAL, '22-FEB-2023', 730, 4, '2', '2');

INSERT INTO INVOICE (INVOICE# , ISSUEDDATE, TOTAL, TOTALITEMS ,PHARMACIST#, PRESCRIPTION#)
VALUES ( INVOICE_SEQ .NEXTVAL, '23-FEB-2023', 200, 2,'7', '3');

INSERT INTO INVOICE (INVOICE# , ISSUEDDATE, TOTAL, TOTALITEMS ,PHARMACIST#, PRESCRIPTION#)
 VALUES ( INVOICE_SEQ .NEXTVAL, '24-FEB-2023', 150.23, 1, '3', '4');

INSERT INTO INVOICE (INVOICE# , ISSUEDDATE, TOTAL, TOTALITEMS ,PHARMACIST#, PRESCRIPTION#)
VALUES ( INVOICE_SEQ .NEXTVAL,  '25-FEB-2023', 400.75, 3,  '5'  , '5');

INSERT INTO INVOICE (INVOICE# , ISSUEDDATE, TOTAL, TOTALITEMS ,PHARMACIST#, PRESCRIPTION#)
VALUES ( INVOICE_SEQ .NEXTVAL, '26-FEB-2023', 650, 4, '10'  , '6');

INSERT INTO INVOICE (INVOICE# , ISSUEDDATE, TOTAL, TOTALITEMS ,PHARMACIST#, PRESCRIPTION#)
VALUES ( INVOICE_SEQ .NEXTVAL, '27-FEB-2023', 1000, 4,'16'  , '7');

INSERT INTO INVOICE (INVOICE# , ISSUEDDATE, TOTAL, TOTALITEMS ,PHARMACIST#, PRESCRIPTION#)
VALUES ( INVOICE_SEQ .NEXTVAL, '28-FEB-2023', 300, 2, '9' , '8');

INSERT INTO INVOICE (INVOICE# , ISSUEDDATE, TOTAL, TOTALITEMS ,PHARMACIST#, PRESCRIPTION#)
VALUES ( INVOICE_SEQ .NEXTVAL, '01-MAR-2023', 800, 3, '7'  , '11');

INSERT INTO INVOICE (INVOICE# , ISSUEDDATE, TOTAL, TOTALITEMS ,PHARMACIST#, PRESCRIPTION#)
VALUES ( INVOICE_SEQ .NEXTVAL,  '02-MAR-2023', 35.7, 1, '12'  ,'10');

INSERT INTO INVOICE (INVOICE# , ISSUEDDATE, TOTAL, TOTALITEMS ,pharmacist#, prescription#)
 VALUES ( INVOICE_SEQ .Nextval, '03-Mar-2023', 103.45, 4, '10' , '9');

--INSERTING RECORDS INTO BRANCH 
INSERT INTO BRANCH (BRANCH#, LOCATIONS, OPENINGTIME, AREA, STREET# ) 
VALUES ( BRANCH_SEQ.NEXTVAL, 'UAQ', '7 AM TO 11 PM', 'AL-SALAMAH', 'STR. 10S' );

INSERT INTO BRANCH (BRANCH#, LOCATIONS, OPENINGTIME, AREA, STREET# ) 
VALUES (BRANCH_SEQ.NEXTVAL, 'AD', '8 AM TO 9 PM', 'AL-HUDAYRIAT', 'STR. 11L');

INSERT INTO BRANCH (BRANCH#, LOCATIONS, OPENINGTIME, AREA, STREET# ) 
VALUES (BRANCH_SEQ.NEXTVAL, 'DUB', '9 AM TO 10 PM', 'JUMEIRAH', 'STR. 33A');

INSERT INTO BRANCH (BRANCH#, LOCATIONS, OPENINGTIME, AREA, STREET# ) 
VALUES (BRANCH_SEQ.NEXTVAL, 'SHJ', '10 AM TO 8 PM', 'AL-RAHMANIYA', 'STR. 6');

INSERT INTO BRANCH (BRANCH#, LOCATIONS, OPENINGTIME, AREA, STREET# ) 
VALUES (BRANCH_SEQ.NEXTVAL, 'RAK', '6 AM TO 12 PM', 'KHUZAM', 'STR. 21');

INSERT INTO BRANCH (BRANCH#, LOCATIONS, OPENINGTIME, AREA, STREET# ) 
VALUES (BRANCH_SEQ.NEXTVAL, 'FUJ', '7 AM TO 11 PM', 'AL-RIMAILAH', 'STR. 75');

INSERT INTO BRANCH (BRANCH#, LOCATIONS, OPENINGTIME, AREA, STREET# ) 
VALUES (BRANCH_SEQ.NEXTVAL, 'AJM', '8 AM TO 9 PM', 'AL-JERF', 'STR. 90');

INSERT INTO BRANCH (BRANCH#, LOCATIONS, OPENINGTIME, AREA, STREET# ) 
VALUES (BRANCH_SEQ.NEXTVAL, 'ALAIN', '9 AM TO 10 PM', 'ZAKHIR', 'STR. 19M');

INSERT INTO BRANCH (BRANCH#, LOCATIONS, OPENINGTIME, AREA, STREET# ) 
VALUES (BRANCH_SEQ.NEXTVAL, 'KHF', '10 AM TO 8 PM', 'AL MUDAIFI', 'STR. 54');

INSERT INTO BRANCH (BRANCH#, LOCATIONS, OPENINGTIME, AREA, STREET# ) 
VALUES (BRANCH_SEQ.NEXTVAL, 'SHJ', '10 AM TO 8 PM', 'AL-NOUF', 'STR. 62');

INSERT INTO BRANCH (BRANCH#, LOCATIONS, OPENINGTIME, AREA, STREET# ) 
VALUES (BRANCH_SEQ.NEXTVAL, 'DUB', '9 AM TO 10 PM', 'AL-BARSHAH 2', 'STR. 36A');

INSERT INTO BRANCH (BRANCH#, LOCATIONS, OPENINGTIME, AREA, STREET# ) 
VALUES (BRANCH_SEQ.NEXTVAL, 'SHJ', '10 AM TO 8 PM', 'MUWAILEH', 'STR. 8F');

INSERT INTO BRANCH (BRANCH#, LOCATIONS, OPENINGTIME, AREA, STREET# ) 
VALUES (BRANCH_SEQ.NEXTVAL, 'AJM', '8 AM TO 9 PM', 'AL-HAMIDIYA 1', 'STR. 9');

--INSERTING RECORDS INTO PHARMACIST BRANCH 

INSERT INTO BRANCH_PHARM  VALUES('1', '1');

INSERT INTO BRANCH_PHARM  VALUES('1', '2');

INSERT INTO BRANCH_PHARM  VALUES('2', '3');

INSERT INTO BRANCH_PHARM  VALUES('2', '4');

INSERT INTO BRANCH_PHARM  VALUES('3', '5');

INSERT INTO BRANCH_PHARM  VALUES('3', '6');


--VIEWS
--CREATING VIEWS FOR discount details 
Create view discountDetails As (
SELECT total, (total*0.15) AS Discount, (total-(total*0.15)) As sum_WO_tax, (total * 0.05) as TAX, (total-(total*0.15)+ (total * 0.05)) AS SUM_TAX ,totalitems, invoice#
FROM invoice
WHERE total > 500 and totalitems >= 3);


--Creating view to providing details of the invoice 
create View orderDetails AS (

select m.item#, i.itemname, m.dosage, pm.qty, p.doctorname, inv.total, inv.totalitems, ph.fname, ph.lname
from items i
join medicine m on (i.item# = m.item#)
join prescribedmedicine pm on (m.item# = pm.item#)
join prescription p on (pm.item# = p.prescription#)
join invoice inv on (p.prescription# = inv.prescription#)
join pharmacist ph on (inv.prescription# = ph.pharmacist#)
);
--Calculate the TAX for the total items.
Create view TotalTax AS(
SELECT total,(total * 0.05) as TAX, (total-(total*0.15)+ (total * 0.05)) AS SUM_TAX ,totalitems, invoice#
FROM invoice);

--INDEX:
--creating index on Item type
create index items_type_indx on items (itemtype);
--creating index on supplier# column in items table
Create index items_sup_indx on items(supplier#);
--creating a composite index on Item type and OTC “over the counter.”
Create index items_otc_indx on items (OTC, itemname);


 
