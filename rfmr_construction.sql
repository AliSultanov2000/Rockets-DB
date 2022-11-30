SHOW DATABASES;

DROP DATABASE IF EXISTS civilian_rockets;

CREATE DATABASE IF NOT EXISTS сivilian_rockets;

USE сivilian_rockets;

SHOW TABLES;

SHOW TRIGGERS;

SET FOREIGN_KEY_CHECKS = 0;

SET FOREIGN_KEY_CHECKS = 1;

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;



-- Optimization criteria in the design:
-- We design the tables so that there is as little duplication of data in the rows as possible


-- ЧТО ОСТАЛОСЬ СДЕЛАТЬ:
-- 1) Добавить id-шник в Rockets для связи с other_rocket_param (добавить после id_test) + 
-- 2) Cделать проверку таблиц mass на соответсвие с массой полезного груза +
-- 3) Добавить комментарии к таблицам в Construction + 
-- 4) Сделать код-ревью аттрибутов к таблицам в Construction + 
-- 5) Cделать полное соответствие таблиц в Construction и Fill -  тогда можно считать, что Fill и Construction - ВСЁ:) + 
-- 6) Удалить все данные в DB. Заново внести в таблицы данные +
-- 7) Сделать ERD - диаграму + 
-- 8) Cоставить запросы к БД  
-- 9) Создать Python файл для подключения к БД
-- 10) Cделать файлик README к проекту
 

# Main table: Data on all rocket launches are stored here

DROP TABLE IF EXISTS Rockets;

CREATE TABLE Rockets
(id_rocket INT PRIMARY KEY,
id_1engine INT, 
id_2engine INT DEFAULT NULL, 
rocket_name VARCHAR(255) NOT NULL,
manufacturer VARCHAR(255) NOT NULL,
rocket_serial_number VARCHAR(255) UNIQUE NOT NULL,
orbit_height DOUBLE UNSIGNED NOT NULL, 
orbit_inclination DOUBLE NOT NULL,
turns_number TINYINT UNSIGNED CHECK(turns_number <= 25) NOT NULL,
mission_success BOOL NOT NULL,
mission_customer VARCHAR(10) NOT NULL, 
basing ENUM('Sea basing', 'Aviation basing', 'Starting table'),
t_launch_preparation DOUBLE,
t_start_time DATETIME, 
launch_cost BIGINT UNSIGNED, 
rocket_efficiency DOUBLE UNSIGNED,
id_1dim INT DEFAULT NULL,
id_2dim INT DEFAULT NULL,
id_1mass INT DEFAULT NULL,
id_2mass INT DEFAULT NULL,
id_1elem INT DEFAULT NULL,
id_2elem INT DEFAULT NULL,
id_test INT DEFAULT NULL,
id_param INT DEFAULT NULL,
FOREIGN KEY (id_1engine) REFERENCES Liquid_pump_engines(id_engine) ON DELETE CASCADE,
FOREIGN KEY (id_1engine) REFERENCES Liquid_displacement_engines(id_engine) ON DELETE CASCADE,
FOREIGN KEY (id_1engine) REFERENCES Solid_fuel_engines(id_engine) ON DELETE CASCADE,
FOREIGN KEY (id_2engine) REFERENCES Liquid_pump_engines(id_engine) ON DELETE CASCADE,
FOREIGN KEY (id_2engine) REFERENCES Liquid_displacement_engines(id_engine) ON DELETE CASCADE,
FOREIGN KEY (id_2engine) REFERENCES Solid_fuel_engines(id_engine) ON DELETE CASCADE,
FOREIGN KEY (id_1dim) REFERENCES Dimension_1stages(id_dimension) ON DELETE CASCADE, 
FOREIGN KEY (id_2dim) REFERENCES Dimension_2stages(id_dimension) ON DELETE CASCADE,
FOREIGN KEY (id_1mass) REFERENCES Mass_1stages(id_m1) ON DELETE CASCADE,
FOREIGN KEY (id_2mass) REFERENCES Mass_2stages(id_m2) ON DELETE CASCADE,
FOREIGN KEY (id_1elem) REFERENCES  Control_elements(id_elem) ON DELETE CASCADE,
FOREIGN KEY (id_2elem) REFERENCES Control_elements(id_elem) ON DELETE CASCADE,
FOREIGN KEY (id_test) REFERENCES Static_tests(id_static_t) ON DELETE CASCADE,
FOREIGN KEY (id_test) REFERENCES Vibration_tests(id_vibration_t) ON DELETE CASCADE,
FOREIGN KEY (id_test) REFERENCES Shock_tests(id_shock_t) ON DELETE CASCADE,
FOREIGN KEY (id_test) REFERENCES Acoustic_tests(id_acoustic_t) ON DELETE CASCADE,
FOREIGN KEY (id_test) REFERENCES Transport_tests(id_transport_t) ON DELETE CASCADE,
FOREIGN KEY (id_test) REFERENCES Climate_tests(id_climate_t) ON DELETE CASCADE,
FOREIGN KEY (id_test) REFERENCES EMC_tests(id_EMC_t) ON DELETE CASCADE,
FOREIGN KEY (id_test) REFERENCES Thermal_vacuum_tests(id_tv_t) ON DELETE CASCADE,
FOREIGN KEY (id_test) REFERENCES Flight_tests(id_flight_t) ON DELETE CASCADE,
FOREIGN KEY (id_param) REFERENCES Other_rocket_parameters(id) ON DELETE CASCADE);


-- Table with the most important parameters of rockets

DROP TABLE IF EXISTS Other_rocket_parameters;

CREATE TABLE Other_rocket_parameters
(id INT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
stage_count TINYINT UNSIGNED NOT NULL,
block_count TINYINT UNSIGNED NOT NULL, 
guidance_system VARCHAR(255) NOT NULL, 
trajectory_control VARCHAR(255) NOT NULL,
BCVM BOOL NOT NULL, 
rocket_status VARCHAR(255) NOT NULL);


-- Table with data on payloads for all launches

DROP TABLE IF EXISTS Head_part;

CREATE TABLE Head_part
(id_head INT NOT NULL,
head_type VARCHAR(255) NOT NULL,
payload_type VARCHAR(255) NOT NULL,
additional_cargo BOOL NOT NULL,
payload_cost DOUBLE UNSIGNED,
payload_exploitability BOOL NOT NULL,
t_payload_operation INT UNSIGNED NOT NULL,
payload_mass DOUBLE UNSIGNED NOT NULL, 
FOREIGN KEY (id_head) REFERENCES Rockets(id_rocket) ON DELETE CASCADE);


-- Table of the location of rockets at the time of launch

DROP TABLE IF EXISTS Basing;

CREATE TABLE Basing 
(id_basing INT NOT NULL,
X_current DOUBLE NOT NULL,
Y_current DOUBLE NOT NULL,
Z_current DOUBLE NOT NULL,
FOREIGN KEY (id_basing) REFERENCES Rockets(id_rocket) ON DELETE CASCADE);



-- Table of dimensions of single-stage rockets 

DROP TABLE IF EXISTS Dimension_1stages;

CREATE TABLE Dimension_1stages
(id_dimension INT PRIMARY KEY,
d DOUBLE UNSIGNED NOT NULL,
l_head DOUBLE UNSIGNED NOT NULL,
l_instrument_compartment DOUBLE UNSIGNED NOT NULL,
l_fuel_tank DOUBLE UNSIGNED NOT NULL,
l_inter_tank DOUBLE UNSIGNED NOT NULL, 
l_oxidizer_tank DOUBLE UNSIGNED NOT NULL,
l_tail_section DOUBLE UNSIGNED NOT NULL);



-- Table of dimensions of two-stage rockets according to the tandem scheme

DROP TABLE IF EXISTS Dimension_2stages;

CREATE TABLE Dimension_2stages
(id_dimension INT PRIMARY KEY,
d_1stage DOUBLE UNSIGNED NOT NULL,
d_2stage DOUBLE UNSIGNED NOT NULL,
l_head DOUBLE UNSIGNED NOT NULL, 
l_instrument_compartment DOUBLE UNSIGNED NOT NULL,
l_1stage_fuel_tank DOUBLE UNSIGNED NOT NULL,
l_1stage_inter_tank DOUBLE UNSIGNED NOT NULL,
l_1stage_oxidizer_tank DOUBLE UNSIGNED NOT NULL,
l_1stage_tail_section DOUBLE UNSIGNED NOT NULL,
l_transfer_compartment DOUBLE UNSIGNED NOT NULL, 
l_2stage_fuel_tank DOUBLE UNSIGNED NOT NULL,
l_2stage_inter_tank DOUBLE UNSIGNED NOT NULL,
l_2stage_oxidizer_tank DOUBLE UNSIGNED NOT NULL);



-- Table of mass of single-stage rockets 

DROP TABLE IF EXISTS Mass_1stages;

CREATE TABLE Mass_1stages
(id_m1 INT PRIMARY KEY,
m_head INT UNSIGNED NOT NULL,
m_instrument_compartment INT UNSIGNED NOT NULL,
m_fuel_tank INT UNSIGNED NOT NULL,
m_inter_tank INT UNSIGNED NOT NULL,
m_oxidizer_tank INT UNSIGNED NOT NULL,
m_tail_section INT UNSIGNED NOT NULL,
m_fuel INT UNSIGNED NOT NULL,  
m_oxidizer INT UNSIGNED NOT NULL); 



-- Table of mass of two-stage rockets according to the tandem scheme

DROP TABLE IF EXISTS Mass_2stages; 

CREATE TABLE Mass_2stages
(id_m2 INT PRIMARY KEY,
m_head INT UNSIGNED NOT NULL,
m__instrument_compartment INT UNSIGNED NOT NULL,
m_1stage_fuel_tank INT UNSIGNED NOT NULL,
m_1stage_inter_tank INT UNSIGNED NOT NULL,
m_1stage_oxidizer_tank INT UNSIGNED NOT NULL,
m_1stage_tail_section INT UNSIGNED NOT NULL,
m_transfer_compartment INT UNSIGNED NOT NULL, 
m_2stage_fuel_tank INT UNSIGNED NOT NULL,
m_2stage_inter_tank INT UNSIGNED NOT NULL,
m_2stage_oxidizer_tank INT UNSIGNED NOT NULL,
m_2stage_tail_section INT UNSIGNED NOT NULL,
m_1stage_fuel INT UNSIGNED NOT NULL,  
m_1stage_oxidizer INT UNSIGNED NOT NULL, 
m_2stage_fuel INT UNSIGNED NOT NULL,  
m_2stage_oxidizer INT UNSIGNED NOT NULL);



# A table with data on the control system for specific types of rockets

DROP TABLE IF EXISTS Control_elements;

CREATE TABLE Control_elements
(id_elem INT PRIMARY KEY,
pitch_control ENUM('Gas jet rudders', 'Steering nozzles', 'Main nozzles', 'CUS', 'Gas injection', 'Latticed stabilizers', 'Stabilizers'),  
yaw_control ENUM('Gas jet rudders', 'Steering nozzles', 'Main nozzles', 'CUS', 'Gas injection', 'Latticed stabilizers', 'Stabilizers'),   
roll_control ENUM('Steering nozzles', 'Main nozzles'));


-- Table with fuel data for various types of rockets

DROP TABLE IF EXISTS Fuels;

CREATE TABLE Fuels
(id_fuel INT PRIMARY KEY,
name_fuel VARCHAR(255) NOT NULL,
μ DOUBLE UNSIGNED NOT NULL,
I DOUBLE NOT NULL,
ρ DOUBLE UNSIGNED NOT NULL,
η DOUBLE UNSIGNED NOT NULL,
c DOUBLE UNSIGNED NOT NULL,
P_p DOUBLE UNSIGNED NOT NULL,
Tkr DOUBLE UNSIGNED NOT NULL,
toxicity BOOL NOT NULL); 


-- A table with data on oxidizing agents for various types of rockets

DROP TABLE IF EXISTS Oxidizers;

CREATE TABLE Oxidizers
(id_oxidizer INT PRIMARY KEY,
name_oxidizer VARCHAR(255) NOT NULL,
μ DOUBLE UNSIGNED NOT NULL,
I DOUBLE NOT NULL,
ρ DOUBLE UNSIGNED NOT NULL,
η DOUBLE UNSIGNED NOT NULL,
c DOUBLE UNSIGNED NOT NULL,
P_p DOUBLE UNSIGNED NOT NULL,
Tkr DOUBLE UNSIGNED NOT NULL,
toxicity BOOL NOT NULL);


-- Table with data on liquid rockets engines with fuel pumping

DROP TABLE IF EXISTS Liquid_pump_engines;

CREATE TABLE Liquid_pump_engines
(id_engine INT PRIMARY KEY,
id_F INT,
id_O INT,
engine_name VARCHAR(255) CHECK(engine_name LIKE 'RD%'),
engine_type VARCHAR(255) DEFAULT 'Liquid propellant rocket engine',
fuel_delivery VARCHAR(255) DEFAULT 'Насосная' CHECK(fuel_delivery = 'Pump'),
engine_schema ENUM('L + L', 'G + G', 'L + G'),
pump ENUM('Lobed', 'Voluminous'),
count_TNA TINYINT UNSIGNED NOT NULL,
count_gas_generator TINYINT UNSIGNED NOT NULL,
nozzle_type ENUM('Laval nozzle', 'Conical'),
reusable_launch BOOL DEFAULT TRUE,
cooling VARCHAR(255) DEFAULT 'Regenerative',
launch_type ENUM('Smooth', 'Stepped', 'Cannon'),
thrust INT UNSIGNED NOT NULL,
specific_impulse INT UNSIGNED NOT NULL,
P_combustion_chamber INT UNSIGNED NOT NULL,
working_hours DOUBLE UNSIGNED NOT NULL,
l_combustion_chamber INT UNSIGNED NOT NULL,
d_combustion_chamber INT UNSIGNED NOT NULL,
l_nozzle INT UNSIGNED NOT NULL,
ignition_method ENUM('Сhemical', 'Electrospark', 'Laser'),
RKS_system BOOL DEFAULT TRUE, 
SOB_system BOOL DEFAULT TRUE,
FOREIGN KEY (id_F) REFERENCES Fuels(id_fuel) ON DELETE CASCADE,
FOREIGN KEY (id_O) REFERENCES Oxidizers(id_oxidizer) ON DELETE CASCADE);


-- Table with data on liquid rockets engines with fuel displace

DROP TABLE IF EXISTS Liquid_displacement_engines;

CREATE TABLE Liquid_displacement_engines
(id_engine INT PRIMARY KEY,
id_F INT,
id_O INT,
engine_name VARCHAR(255) CHECK(engine_name LIKE 'RD%'),
engine_type VARCHAR(255) DEFAULT 'Liquid propellant rocket engine',
fuel_delivery VARCHAR(255) DEFAULT 'Displacement', 
temperature_classific ENUM('Cold gas', 'Hot gas'), 
specific_view VARCHAR(255),
nozzle_type ENUM('Laval nozzle', 'Conical'),
reusable_launch BOOL DEFAULT TRUE,
cooling VARCHAR(255) DEFAULT 'Regenerative',
launch_type ENUM('Smooth', 'Stepped', 'Cannon'),
thrust INT UNSIGNED NOT NULL,
specific_impulse INT UNSIGNED NOT NULL,
P_combustion_chamber INT UNSIGNED NOT NULL,
working_hours DOUBLE UNSIGNED NOT NULL,
l_combustion_chamber INT UNSIGNED NOT NULL,
d_combustion_chamber INT UNSIGNED NOT NULL,
l_nozzle INT UNSIGNED NOT NULL,
ignition_method ENUM('Сhemical', 'Electrospark', 'Laser'),
RKS_system BOOL DEFAULT TRUE,
SOB_system BOOL DEFAULT TRUE,
FOREIGN KEY (id_F) REFERENCES Fuels(id_fuel) ON DELETE CASCADE,
FOREIGN KEY (id_O) REFERENCES Oxidizers(id_oxidizer) ON DELETE CASCADE);


-- Table about rocket engines with solid fuel

DROP TABLE IF EXISTS Solid_fuel_engines;

CREATE TABLE Solid_fuel_engines
(id_engine INT PRIMARY KEY,
engine_name VARCHAR(255) CHECK(engine_name LIKE 'RD%'),
engine_type VARCHAR(255) DEFAULT 'Solid fuel',
fuel_delivery VARCHAR(255) DEFAULT 'Absent' CHECK(fuel_delivery = 'Absent'),
layout VARCHAR(255) DEFAULT 'SZ type charge',
fuel_type VARCHAR(255) DEFAULT 'Mixed',
charge_form VARCHAR(255) DEFAULT 'Telescopic charge',
nozzle_type ENUM('Laval nozzle', 'Conical'),
reusable_launch BOOL DEFAULT FALSE,
cooling VARCHAR(255) DEFAULT 'Refrigerant',
launch_type ENUM('Smooth', 'Stepped', 'Cannon'),
thrust INT UNSIGNED NOT NULL,
specific_impulse INT UNSIGNED NOT NULL,
P_combustion_chamber INT UNSIGNED NOT NULL,
working_hours DOUBLE NOT NULL,
l_combustion_chamber DOUBLE UNSIGNED NOT NULL,
d_combustion_chamber DOUBLE UNSIGNED NOT NULL,
l_nozzle DOUBLE UNSIGNED NOT NULL);


-- Table of tests of liquid rocket engines with pumping feed

DROP TABLE IF EXISTS Liquid_pump_engines_tests;

CREATE TABLE Liquid_pump_engines_tests
(id_engine_t INT,
t1_engine_test DATETIME NOT NULL,
t2_engine_test DATETIME NOT NULL,
engine_test_name VARCHAR(255) NOT NULL,
engine_test_result TEXT,
thrust_test INT UNSIGNED NOT NULL,
specific_impulse_test INT UNSIGNED NOT NULL,
P_combustion_chamber_test INT UNSIGNED NOT NULL,
FOREIGN KEY (id_engine_t) REFERENCES Liquid_pump_engines(id_engine) ON DELETE CASCADE);


-- Table of test of liquid propellant rocket engines with displacement feed

DROP TABLE IF EXISTS Liquid_displacement_engines_tests;

CREATE TABLE Liquid_displacement_engines_tests
(id_engine_t INT,
t1_engine_test DATETIME NOT NULL,
t2_engine_test DATETIME NOT NULL,
engine_test_name VARCHAR(255) NOT NULL,
engine_test_result TEXT,
thrust_test INT UNSIGNED NOT NULL,
specific_impulse_test INT UNSIGNED NOT NULL,
P_combustion_chamber_test INT UNSIGNED NOT NULL,
FOREIGN KEY (id_engine_t) REFERENCES Liquid_displacement_engines(id_engine) ON DELETE CASCADE);


-- Table on testing rocket engines on solid fuel

DROP TABLE IF EXISTS Solid_fuel_engines_tests;

CREATE TABLE Solid_fuel_engines_tests
(id_engine_t INT,
t1_engine_test DATETIME NOT NULL,
t2_engine_test DATETIME NOT NULL,
engine_test_name VARCHAR(255) NOT NULL,
engine_test_result TEXT,
thrust_test INT UNSIGNED NOT NULL,
specific_impulse_test INT UNSIGNED NOT NULL,
P_combustion_chamber_test INT UNSIGNED NOT NULL,
FOREIGN KEY (id_engine_t) REFERENCES Solid_fuel_engines(id_engine) ON DELETE CASCADE);



-- Table with data on static rocket tests

DROP TABLE IF EXISTS Static_tests; 

CREATE TABLE Static_tests
(id_static_t INT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
t1_static_test DATETIME NOT NULL, 
t2_static_test DATETIME NOT NULL,
static_test_result TEXT,
static_strength BOOL DEFAULT TRUE,
n_static INT );


-- Table with data on vibration rockets tests

DROP TABLE IF EXISTS Vibration_tests;  

CREATE TABLE Vibration_tests 
(id_vibration_t INT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
t1_vibration_test DATETIME NOT NULL,
t2_vibration_test DATETIME NOT NULL,
vibration_test_result TEXT,
n_amplitude_t INT,
n_resonance_frequency INT);


-- Table with data on rockets impact tests

DROP TABLE IF EXISTS Shock_tests; 

CREATE TABLE Shock_tests
(id_shock_t INT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
t1_shock_test DATETIME NOT NULL, 
t2_shock_test DATETIME NOT NULL,
shock_test_result TEXT,
normal_shock INT);

-- Table with acoustic tests of rockets

DROP TABLE IF EXISTS Acoustic_tests;  

CREATE TABLE Acoustic_tests 
(id_acoustic_t INT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
t1_acoustic_test DATETIME NOT NULL,
t2_acoustic_test DATETIME NOT NULL,
acoustic_test_result TEXT,
normal_acoustic_P INT);


-- Table with rocket transport tests

DROP TABLE IF EXISTS Transport_tests;  

CREATE TABLE Transport_tests
(id_transport_t INT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
t1_transport_test DATETIME NOT NULL,
t2_transport_test DATETIME NOT NULL,
transport_test_result TEXT,
types_of_transport VARCHAR(255) NOT NULL,
normal_v INT);

-- Table with climate tests of rockets

DROP TABLE IF EXISTS Climate_tests;  

CREATE TABLE Climate_tests
(id_climate_t INT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
t1_climate_test DATETIME NOT NULL,
t2_climate_test DATETIME NOT NULL,
climate_test_result TEXT,
normal_positive_temperature INT,
normal_negative_temperature INT);

-- Table with electromagnetic tests of rockets 

DROP TABLE IF EXISTS EMC_tests; 

CREATE TABLE EMC_tests
(id_EMC_t INT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
t1_EMC DATETIME NOT NULL,
t2_EMC DATETIME NOT NULL,
EMC_test_result TEXT);

-- Table with thermal vacuum tests of rockets

DROP TABLE IF EXISTS Thermal_vacuum_tests;  

CREATE TABLE Thermal_vacuum_tests
(id_tv_t INT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
t1_tv DATETIME NOT NULL,
t2_tv DATETIME NOT NULL,
tv_test_result TEXT,
tv_control_system_efficiency BOOL);


-- Table with flight tests of rockets

DROP TABLE IF EXISTS Flight_tests;  

CREATE TABLE Flight_tests
(id_flight_t INT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
t1_flight_test DATETIME NOT NULL,
t2_flight_test DATETIME NOT NULL,
flight_test_result TEXT,
all_systems_efficiency BOOL,
crash BOOL);


# We will also create triggers to respond to events: trig1, trig2, trig3

DROP TRIGGER IF EXISTS trig1;

CREATE TRIGGER trig1 BEFORE INSERT ON Liquid_pump_engines
FOR EACH ROW 
BEGIN 
	IF NEW.id_engine IN (SELECT id_engine FROM Liquid_displacement_engines) THEN 
	    SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'id_engine exists in Liquid_displacement_engines';
	ELSEIF NEW.id_engine IN (SELECT id_engine FROM Solid_fuel_engines) THEN 
	    SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'id_engine exists in Solid_fuel_engines';
	END IF;
END



DROP TRIGGER IF EXISTS trig2;

CREATE TRIGGER trig2 BEFORE INSERT ON Liquid_displacement_engines
FOR EACH ROW
BEGIN 
	IF NEW.id_engine IN (SELECT id_engine FROM Liquid_pump_engines) THEN
	    SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'id_engine exists in Liquid_pump_engines';
	ELSEIF NEW.id_engine IN (SELECT id_engine FROM Solid_fuel_engines) THEN 
	    SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'id_engine exists in Solid_fuel_engines';
	END IF;
END


DROP TRIGGER IF EXISTS trig3;

CREATE TRIGGER trig3 BEFORE INSERT ON Solid_fuel_engines
FOR EACH ROW 
BEGIN 
	IF NEW.id_engine IN (SELECT id_engine FROM Liquid_pump_engines) THEN
	    SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'id_engine exists in Liquid_pump_engines';
	ELSEIF NEW.id_engine IN (SELECT id_engine FROM Liquid_displacement_engines) THEN 
	    SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'id_engine exists in Liquid_displacement_engines';
	END IF;
END



-- Let's create indexes for tables whose columns are frequently accessed 
CREATE INDEX idx_1 ON Rockets(rocket_name);

CREATE INDEX idx_2 ON Basing(id_basing);
