SHOW DATABASES;

DROP DATABASE IF EXISTS Russian_Military_rockets;

CREATE DATABASE Russian_Military_rockets;

USE Russian_Military_rockets;

SHOW TABLES;

SET FOREIGN_KEY_CHECKS = 0;

SET FOREIGN_KEY_CHECKS = 1;



-- Критерии оптимизации при проектировании:
-- ТАБЛИЦЫ ПРОЕКТИРУЕМ ТАК, ЧТОБЫ БЫЛО КАК МОЖНО МЕНЬШЕ ДУБЛИРОВАНИЯ ДАННЫХ В СТРОКАХ 
 


DROP TABLE IF EXISTS Rockets;
CREATE TABLE Rockets
(id_rocket INT PRIMARY KEY,
id_1engine INT, 
id_2engine INT DEFAULT NULL, 
rocket_name VARCHAR(255),
manufacturer VARCHAR(255),
rocket_serial_number VARCHAR(255) UNIQUE,
trajectory_classification ENUM('Баллистическая', 'Крылатая'),
rocket_classification ENUM('земля-земля', 'земля-воздух', 'воздух-земля', 'земля-море', 'воздух-воздух', 'воздух-поверхность', 'море-море', 'море-земля'),
distance ENUM('Оперативно-тактическая', 'Cредняя дальность', 'Межконтинентальная'),
max_distance BIGINT UNSIGNED NOT NULL,
basing ENUM('Шахтное базирование', 'Морское базирование', 'Мобильное базирование', 'Авиационное базирование'),
count_of_stage TINYINT CHECK(count_of_stage <= 2),
count_of_block TINYINT CHECK(count_of_block <= 15),
payload_mass INT UNSIGNED,
KBO INT UNSIGNED,
guidance_system SET('Электродистанционное наведение', 'Командное наведение', 'Наведение по наземным ориентирам',
                    'Геофизическое наведение', 'Инерциальное наведение', 'Наведение по лучу', 'Лазерное наведение', 'Спутниковое наведение'),
trajectory_control ENUM('Жесткая траектория', 'Гибкая траектория' ,'Коррекция на пассивном участке'),
BCVM BOOL,
status ENUM('Эскиз', 'Конструкторская документация', 'Испытания', 'На вооружении', 'Снято с вооружения'),
t_launch_preparation DOUBLE,
t1_combat_duty DATETIME, 
t2_combat_duty DATETIME,  
launch_cost BIGINT UNSIGNED,
rocket_efficiency DOUBLE UNSIGNED,
id_1dim INT DEFAULT NULL,
id_2dim INT DEFAULT NULL,
id_1mass INT DEFAULT NULL,
id_2mass INT DEFAULT NULL,
id_1elem INT DEFAULT NULL,
id_2elem INT DEFAULT NULL,
id_test INT DEFAULT NULL,
FOREIGN KEY (id_1engine) REFERENCES Liquid_pump_engines(id_engine) ON DELETE CASCADE,
FOREIGN KEY (id_1engine) REFERENCES Liquid_displacement_engines(id_engine) ON DELETE CASCADE,
FOREIGN KEY (id_1engine) REFERENCES Solid_fuel_engines(id_engine) ON DELETE CASCADE,
FOREIGN KEY (id_2engine) REFERENCES Liquid_pump_engines(id_engine) ON DELETE CASCADE,
FOREIGN KEY (id_2engine) REFERENCES Liquid_displacement_engines(id_engine) ON DELETE CASCADE,
FOREIGN KEY (id_2engine) REFERENCES Solid_fuel_engines(id_engine) ON DELETE CASCADE,
FOREIGN KEY (id_1dim) REFERENCES Dimension_1stages(id_dimension) ON UPDATE CASCADE, 
FOREIGN KEY (id_2dim) REFERENCES Dimension_2stages(id_dimension) ON UPDATE CASCADE,
FOREIGN KEY (id_1mass) REFERENCES Mass_1stages(id_m1) ON UPDATE CASCADE,
FOREIGN KEY (id_2mass) REFERENCES Mass_2stages(id_m2) ON UPDATE CASCADE,
FOREIGN KEY (id_1elem) REFERENCES  Control_elements(id_elem) ON UPDATE CASCADE,
FOREIGN KEY (id_2elem) REFERENCES Control_elements(id_elem) ON UPDATE CASCADE,
FOREIGN KEY (id_test) REFERENCES Static_tests(id_static_t) ON DELETE CASCADE,
FOREIGN KEY (id_test) REFERENCES Vibration_tests(id_vibration_t) ON DELETE CASCADE,
FOREIGN KEY (id_test) REFERENCES Shock_tests(id_shock_t) ON DELETE CASCADE,
FOREIGN KEY (id_test) REFERENCES Acoustic_tests(id_acoustic_t) ON DELETE CASCADE,
FOREIGN KEY (id_test) REFERENCES Transport_tests(id_transport_t) ON DELETE CASCADE,
FOREIGN KEY (id_test) REFERENCES Climate_tests(id_climate_t) ON DELETE CASCADE,
FOREIGN KEY (id_test) REFERENCES EMC_tests(id_EMC_t) ON DELETE CASCADE,
FOREIGN KEY (id_test) REFERENCES Thermal_vacuum_tests(id_tv_t) ON DELETE CASCADE,
FOREIGN KEY (id_test) REFERENCES Flight_tests(id_flight_t) ON DELETE CASCADE
);


DROP TABLE IF EXISTS Basing;
CREATE TABLE Basing 
(id_basing INT,
X_current DOUBLE,
Y_current DOUBLE,
Z_current DOUBLE,
FOREIGN KEY (id_basing) REFERENCES Rockets(id_rocket) ON DELETE CASCADE
);


DROP TABLE IF EXISTS Monoblock_head_parts;
CREATE TABLE Monoblock_head_parts
(id_mono INT UNIQUE,
head_shape ENUM('Оживальная', 'ГЧ с притупленным наконечником', 'Коническая'),
maneuverability BOOL DEFAULT FALSE,
count_false_object INT UNSIGNED,
sredstvo_otdeleniya ENUM('Нет отделения','Пироболты', 'Пирозамки'),
sredstvo_razdeleniya ENUM('Нет разделения', 'Холодное разделение', 'Теплое разделение', 'Горячее разделение'),
warhead ENUM('Ударно-кинетическая БЧ', 'Зажигательная БЧ', 'Осколочно-фугасная БЧ', 'Фугасная БЧ', 'Кумулятивная БЧ', 'Тандемная кумулятивная БЧ',
             'Ядерная БЧ', 'Термобарическая БЧ', 'Кассетная БЧ', 'Химическая БЧ'),
BB_power BIGINT UNSIGNED NOT NULL,
FOREIGN KEY (id_mono) REFERENCES Rockets(id_rocket) ON DELETE CASCADE
); 


DROP TABLE IF EXISTS Multiblock_head_parts;
CREATE TABLE Multiblock_head_parts
(id_multi INT UNIQUE,  
head_shape ENUM('Оживальная', 'ГЧ с притупленным наконечником', 'Коническая'),
maneuverability BOOL DEFAULT TRUE,
count_false_object INT UNSIGNED,
sredstvo_otdeleniya ENUM('Нет отделения','Пироболты', 'Пирозамки'),
sredstvo_razdeleniya ENUM('Нет разделения', 'Холодное разделение', 'Теплое разделение', 'Горячее разделение'),
warhead ENUM('Ударно-кинетическая БЧ', 'Зажигательная БЧ', 'Осколочно-фугасная БЧ', 'Фугасная БЧ', 'Кумулятивная БЧ', 'Тандемная кумулятивная БЧ',
             'Ядерная БЧ', 'Термобарическая БЧ', 'Кассетная БЧ', 'Химическая БЧ'),
head_type ENUM('MRV', 'MIRV', 'MARV'),
lighting_type ENUM('Лепестковая схема', 'Чулочная схема'),
cnt_block TINYINT UNSIGNED NOT NULL,
power_of_1_BB BIGINT UNSIGNED NOT NULL,
BB_schema ENUM('Тянущая схема', 'Толкающая схема'),
FOREIGN KEY (id_multi) REFERENCES Rockets(id_rocket) ON DELETE CASCADE
);



-- В этой таблице будут габариты одноступенчатых ракет + 
DROP TABLE IF EXISTS Dimension_1stages;
CREATE TABLE Dimension_1stages
(id_dimension INT PRIMARY KEY,
l_total DOUBLE UNSIGNED NOT NULL ,
d DOUBLE UNSIGNED NOT NULL,
l_head DOUBLE UNSIGNED NOT NULL,
l_instrument_compartment DOUBLE UNSIGNED NOT NULL,
l_fuel_tank DOUBLE UNSIGNED NOT NULL,
l_inter_tank DOUBLE UNSIGNED NOT NULL, 
l_oxidizer_tank DOUBLE UNSIGNED NOT NULL,
l_tail_section DOUBLE UNSIGNED NOT NULL
);



-- В этой таблице будут длины двухступенчатых ракет по тандемной схеме + 
DROP TABLE IF EXISTS Dimension_2stages;
CREATE TABLE Dimension_2stages
(id_dimension INT PRIMARY KEY,
l_total DOUBLE UNSIGNED,
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
l_2stage_oxidizer_tank DOUBLE UNSIGNED NOT NULL
);




-- В этой таблице будут массы одноступенчатых +  
DROP TABLE IF EXISTS Mass_1stages;
CREATE TABLE Mass_1stages
(id_m1 INT PRIMARY KEY,
m_total INT UNSIGNED NOT NULL,
m_head INT UNSIGNED NOT NULL,
m_instrument_compartment INT UNSIGNED NOT NULL,
m_fuel_tank INT UNSIGNED NOT NULL,
m_inter_tank INT UNSIGNED NOT NULL,
m_oxidizer_tank INT UNSIGNED NOT NULL,
m_tail_section INT UNSIGNED NOT NULL,
m_fuel INT UNSIGNED NOT NULL,  
m_oxidizer INT UNSIGNED NOT NULL
); 




-- В этой таблице будут массы двухступенчатых ракет по тандемной схеме + 
DROP TABLE IF EXISTS Mass_2stages; 
CREATE TABLE Mass_2stages
(id_m2 INT PRIMARY KEY,
m_total INT UNSIGNED,
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
m_2stage_oxidizer INT UNSIGNED NOT NULL
);




DROP TABLE IF EXISTS Control_elements;
CREATE TABLE Control_elements
(id_elem INT PRIMARY KEY,
pitch_control ENUM('Газоструйные рули', 'Основные сопла', 'Стабилизаторы', 'Решетчатые стабилизаторы', 'Вдув газа', 'КУС', 'Разрезное сопло'),  -- Тангаж
yaw_control ENUM('Газоструйные рули', 'Основные сопла', 'Стабилизаторы', 'Решетчатые стабилизаторы', 'Вдув газа', 'КУС', 'Разрезное сопло'),  -- Рыскание 
roll_control ENUM('Рулевые сопла', 'Основные сопла')  -- Крен
);



DROP TABLE IF EXISTS Fuels;
CREATE TABLE Fuels
(id_fuel INT PRIMARY KEY,
name_fuel VARCHAR(255),
μ DOUBLE UNSIGNED,
I DOUBLE,
ρ DOUBLE UNSIGNED,
η DOUBLE UNSIGNED,
c DOUBLE UNSIGNED,
P_p DOUBLE UNSIGNED,
Tkr DOUBLE UNSIGNED,
toxicity BOOL
); 


DROP TABLE IF EXISTS Oxidizers;
CREATE TABLE Oxidizers
(id_oxidizer INT PRIMARY KEY,
name_oxidizer VARCHAR(255),
μ DOUBLE UNSIGNED,
I DOUBLE,
ρ DOUBLE UNSIGNED,
η DOUBLE UNSIGNED,
c DOUBLE UNSIGNED,
P_p DOUBLE UNSIGNED,
Tkr DOUBLE UNSIGNED,
toxicity BOOL
);




DROP TABLE IF EXISTS Liquid_pump_engines;
CREATE TABLE Liquid_pump_engines
(id_engine INT PRIMARY KEY,
id_F INT,
id_O INT,
engine_name VARCHAR(255) CHECK(engine_name LIKE 'РД%'),
engine_type VARCHAR(255) DEFAULT 'ЖРД',
fuel_delivery VARCHAR(255) DEFAULT 'Насосная' CHECK(fuel_delivery = 'Насосная'),
engine_schema ENUM('Ж + Ж', 'Г + Ж', 'Г + Г'),
pump ENUM('Объёмные', 'Лопастные', 'Струйные'),
count_TNA TINYINT UNSIGNED NOT NULL,
count_gas_generator TINYINT UNSIGNED NOT NULL,
nozzle_type ENUM('Сопло Лаваля', 'Коническое'),
reusable_launch BOOL DEFAULT TRUE,
cooling VARCHAR(255) DEFAULT 'Регенеративное',
launch_type ENUM('Плавный', 'Ступенчатый', 'Пушечный'),
thrust INT UNSIGNED NOT NULL,
specific_impulse INT UNSIGNED NOT NULL,
P_combustion_chamber INT UNSIGNED NOT NULL,
working_hours DOUBLE UNSIGNED NOT NULL,
l_combustion_chamber INT UNSIGNED NOT NULL,
d_combustion_chamber INT UNSIGNED NOT NULL,
l_nozzle INT UNSIGNED NOT NULL,
ignition_method ENUM('Химический', 'Пиротехнический', 'Электроискровой', 'Лазерный'),
RKS_system BOOL DEFAULT TRUE, 
SOB_system BOOL DEFAULT TRUE,
FOREIGN KEY (id_F) REFERENCES Fuels(id_fuel) ON DELETE CASCADE,
FOREIGN KEY (id_O) REFERENCES Oxidizers(id_oxidizer) ON DELETE CASCADE
);



DROP TABLE IF EXISTS Liquid_displacement_engines;
CREATE TABLE Liquid_displacement_engines
(id_engine INT PRIMARY KEY,
id_F INT,
id_O INT,
engine_name VARCHAR(255) CHECK(engine_name LIKE 'РД%'),
engine_type VARCHAR(255) DEFAULT 'ЖРД',
fuel_delivery VARCHAR(255) DEFAULT 'Вытеснительная' CHECK(fuel_delivery = 'Вытеснительная'),
temperature_classific ENUM('Холодный газ', 'Горячий газ'), 
specific_view ENUM('Испарительная', 'Газобалонная', 'Химический наддув', 'Генераторный'),
nozzle_type ENUM('Сопло Лаваля', 'Коническое'),
reusable_launch BOOL DEFAULT TRUE,
cooling VARCHAR(255) DEFAULT 'Регенеративное',
launch_type ENUM('Плавный', 'Ступенчатый', 'Пушечный'),
thrust INT UNSIGNED NOT NULL,
specific_impulse INT UNSIGNED NOT NULL,
P_combustion_chamber INT UNSIGNED NOT NULL,
working_hours DOUBLE UNSIGNED NOT NULL,
l_combustion_chamber INT UNSIGNED NOT NULL,
d_combustion_chamber INT UNSIGNED NOT NULL,
l_nozzle INT UNSIGNED NOT NULL,
ignition_method ENUM('Химический', 'Пиротехнический', 'Электроискровой', 'Лазерный'),
RKS_system BOOL DEFAULT TRUE,
SOB_system BOOL DEFAULT TRUE,
FOREIGN KEY (id_F) REFERENCES Fuels(id_fuel) ON DELETE CASCADE,
FOREIGN KEY (id_O) REFERENCES Oxidizers(id_oxidizer) ON DELETE CASCADE
);


DROP TABLE IF EXISTS Solid_fuel_engines;
CREATE TABLE Solid_fuel_engines
(id_engine INT PRIMARY KEY,
engine_name VARCHAR(255) CHECK(engine_name LIKE 'РД%'),
engine_type VARCHAR(255) DEFAULT 'Твердотопливная',
fuel_delivery VARCHAR(255) DEFAULT 'Отсутствует' CHECK(fuel_delivery = 'Отсутствует'),
layout ENUM('ВЗ', 'CЗ и отдельные днища','СЗ и отдельное заднее днище', 'СЗ типа коган', 'Многосекционный'),
fuel_type ENUM('Баллиститное', 'Смесевое'),
charge_form VARCHAR(255) DEFAULT 'Телескопический заряд', 
nozzle_type ENUM('Сопло Лаваля', 'Коническое'),
reusable_launch BOOL DEFAULT FALSE,
cooling VARCHAR(255) DEFAULT 'Хладагент',
launch_type ENUM('Плавный', 'Ступенчатый', 'Пушечный'),
thrust INT UNSIGNED NOT NULL,
specific_impulse INT UNSIGNED NOT NULL,
P_combustion_chamber INT UNSIGNED NOT NULL,
working_hours DOUBLE NOT NULL,
l_combustion_chamber DOUBLE UNSIGNED NOT NULL,
d_combustion_chamber DOUBLE UNSIGNED NOT NULL,
l_nozzle DOUBLE UNSIGNED NOT NULL
);



DROP TABLE IF EXISTS Liquid_pump_engines_tests;
CREATE TABLE Liquid_pump_engines_tests
(id_engine_t INT,
t1_engine_test DATETIME,
t2_engine_test DATETIME,
engine_test_name VARCHAR(255),
engine_test_result TEXT,
thrust_test INT UNSIGNED NOT NULL,
specific_impulse_test INT UNSIGNED NOT NULL,
P_combustion_chamber_test INT UNSIGNED NOT NULL,
FOREIGN KEY (id_engine_t) REFERENCES Liquid_pump_engines(id_engine) ON DELETE CASCADE
);


DROP TABLE IF EXISTS Liquid_displacement_engines_tests;
CREATE TABLE Liquid_displacement_engines_tests
(id_engine_t INT,
t1_engine_test DATETIME,
t2_engine_test DATETIME,
engine_test_name VARCHAR(255),
engine_test_result TEXT,
thrust_test INT UNSIGNED NOT NULL,
specific_impulse_test INT UNSIGNED NOT NULL,
P_combustion_chamber_test INT UNSIGNED NOT NULL,
FOREIGN KEY (id_engine_t) REFERENCES Liquid_displacement_engines(id_engine) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Solid_fuel_engines_tests;
CREATE TABLE Solid_fuel_engines_tests
(id_engine_t INT,
t1_engine_test DATETIME,
t2_engine_test DATETIME,
engine_test_name VARCHAR(255),
engine_test_result TEXT,
thrust_test INT UNSIGNED NOT NULL,
specific_impulse_test INT UNSIGNED NOT NULL,
P_combustion_chamber_test INT UNSIGNED NOT NULL,
FOREIGN KEY (id_engine_t) REFERENCES Solid_fuel_engines(id_engine) ON DELETE CASCADE
);




DROP TABLE IF EXISTS Static_tests;  
CREATE TABLE Static_tests
(id_static_t INT PRIMARY KEY,
name VARCHAR(255),
t1_static_test DATETIME, 
t2_static_test DATETIME,
static_test_result TEXT,
static_strength BOOL DEFAULT TRUE,
n_static INT 
);



DROP TABLE IF EXISTS Vibration_tests;  
CREATE TABLE Vibration_tests 
(id_vibration_t INT PRIMARY KEY,
name VARCHAR(255),
t1_vibration_test DATETIME,
t2_vibration_test DATETIME,
vibration_test_result TEXT,
n_amplitude_t INT,
n_resonance_frequency INT
);



DROP TABLE IF EXISTS Shock_tests;  
CREATE TABLE Shock_tests
(id_shock_t INT PRIMARY KEY,
name VARCHAR(255),
t1_shock_test DATETIME, 
t2_shock_test DATETIME,
shock_test_result TEXT,
normal_shock INT
);


DROP TABLE IF EXISTS Acoustic_tests;  
CREATE TABLE Acoustic_tests 
(id_acoustic_t INT PRIMARY KEY,
name VARCHAR(255),
t1_acoustic_test DATETIME,
t2_acoustic_test DATETIME,
acoustic_test_result TEXT,
normal_acoustic_P INT
);



DROP TABLE IF EXISTS Transport_tests;  
CREATE TABLE Transport_tests
(id_transport_t INT PRIMARY KEY,
name VARCHAR(255),
t1_transport_test DATETIME,
t2_transport_test DATETIME,
transport_test_result TEXT,
types_of_transport ENUM('Ж/Д транспорт', 'Авиационный', 'Автомобильный', 'Водный'),
normal_v INT
);


DROP TABLE IF EXISTS Climate_tests;  
CREATE TABLE Climate_tests
(id_climate_t INT PRIMARY KEY,
name VARCHAR(255),
t1_climate_test DATETIME,
t2_climate_test DATETIME,
climate_test_result TEXT,
normal_positive_temperature INT,
normal_negative_temperature INT
);


DROP TABLE IF EXISTS EMC_tests; 
CREATE TABLE EMC_tests
(id_EMC_t INT PRIMARY KEY,
name VARCHAR(255),
t1_EMC DATETIME,
t2_EMC DATETIME,
EMC_test_result TEXT
);


DROP TABLE IF EXISTS Thermal_vacuum_tests;  
CREATE TABLE Thermal_vacuum_tests
(id_tv_t INT PRIMARY KEY,
name VARCHAR(255),
t1_tv DATETIME,
t2_tv DATETIME,
tv_test_result TEXT,
tv_control_system_efficiency BOOL
);



DROP TABLE IF EXISTS Flight_tests;  
CREATE TABLE Flight_tests
(id_flight_t INT PRIMARY KEY,
name VARCHAR(255),
t1_flight_test DATETIME,
t2_flight_test DATETIME,
flight_test_result TEXT,
all_systems_efficiency BOOL,
crash BOOL
);



DROP TRIGGER IF EXISTS trig1;
CREATE TRIGGER trig1 BEFORE INSERT ON Liquid_pump_engines
FOR EACH ROW 
BEGIN 
	IF id_engine IN (SELECT id_engine FROM Liquid_displacement_engines) THEN 
	    SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'id_engine существует в Liquid_displacement_engines';
	ELSE IF id_engine IN (SELECT id_engine FROM Solid_fuel_engines) THEN 
	    SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'id_engine существует в Solid_fuel_engines';
	END IF;
END



DROP TRIGGER IF EXISTS trig2;
CREATE TRIGGER trig2 BEFORE INSERT ON Liquid_displacement_engines
FOR EACH ROW
BEGIN 
	IF id_engine IN (SELECT id_engine FROM Liquid_pump_engines) THEN
	    SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'id_engine существует в Liquid_pump_engines';
	ELSE IF id_engine IN (SELECT id_engine FROM Solid_fuel_engines) THEN 
	    SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'id_engine существует в Solid_fuel_engines';
	END IF;
END


DROP TRIGGER IF EXISTS trig3;
CREATE TRIGGER trig3 BEFORE INSERT ON Solid_fuel_engines
FOR EACH ROW 
BEGIN 
	IF in_engine IN (SELECT id_engine FROM Liquid_pump_engines) THEN
	    SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'id_engine существует в Liquid_pump_engines';
	ELSE IF id_engine IN (SELECT id_engine FROM Liquid_displacement_engines) THEN 
	    SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'id_engine существует в Liquid_displacement_engines';
	END IF;
END


CREATE INDEX ind ON Rockets(rocket_name);
