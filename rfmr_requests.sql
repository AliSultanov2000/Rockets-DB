USE Russian_Military_rockets;


SELECT * FROM Rockets;

-- Общие характеристики ракет 
SELECT rocket_name AS 'Название ракет', manufacturer 'Завод-изготовитель', rocket_serial_number AS 'Серийный номер ракет', 
trajectory_classification AS 'Классификация траектории', rocket_classification AS 'Класс ракеты', distance AS 'Дистанция',
max_distance AS 'Максимальная дистанция', count_of_stage AS 'Количество ступеней', count_of_block AS 'Количество блоков',
payload_mass AS 'Масса полезной нагрузки', KBO  AS 'Круговое отклонение', guidance_system AS 'Система наведения',
trajectory_control AS 'Система управления', BCVM AS 'БЦВМ', status AS 'Статус', t_launch_preparation AS 'Время подготовки к старту',
t1_combat_duty AS 'Постановка на боевое дежурство', t2_combat_duty AS 'Снятие с боевого дежурства', launch_cost AS 'Стоимость запуска', 
rocket_efficiency AS 'Эффективность ракеты ' FROM Rockets;


-- Текущая ядерная мощь от моноблочных ГЧ и многоблочных ГЧ

SELECT SUM(BB_power) AS Sum_power FROM Rockets JOIN Monoblock_head_parts
ON Rockets.id_rocket = Monoblock_head_parts.id_mono
WHERE warhead = 'Ядерная БЧ' AND t2_combat_duty >= NOW()
UNION
SELECT SUM(cnt_block * power_of_1_BB) AS Sum_power FROM Rockets JOIN Multiblock_head_parts
ON Rockets.id_rocket = Multiblock_head_parts.id_multi
WHERE warhead = 'Ядерная БЧ' AND t2_combat_duty >= NOW();


-- Текущая суммарная ядерная мощь
SELECT SUM(Sum_power) AS Over_power, NOW() AS 'На текущий момент' FROM (SELECT SUM(BB_power) AS Sum_power FROM Rockets JOIN Monoblock_head_parts
ON Rockets.id_rocket = Monoblock_head_parts.id_mono
WHERE warhead = 'Ядерная БЧ' AND t2_combat_duty >= NOW()
UNION
SELECT SUM(cnt_block * power_of_1_BB) AS Sum_power FROM Rockets JOIN Multiblock_head_parts
ON Rockets.id_rocket = Multiblock_head_parts.id_multi
WHERE warhead = 'Ядерная БЧ' AND t2_combat_duty >= NOW()) AS subquery;


-- Процедура для уникальных ракет 
DROP PROCEDURE IF EXISTS Unique_rockets;
CREATE PROCEDURE Unique_rockets()
BEGIN 
	START TRANSACTION;
    SELECT rocket_name AS 'Уникальные ракеты' FROM 
    (SELECT rocket_name, ROW_NUMBER() OVER (PARTITION BY rocket_name ORDER BY rocket_name) AS rezult FROM Rockets) AS subquery
    WHERE rezult = 1;
    SELECT COUNT(*) AS 'Кол-во уникальных ракет' FROM (SELECT DISTINCT(rocket_name) FROM Rockets) AS Subquery;
   COMMIT;
END


CALL Unique_rockets();


-- Общая стоимость ракет данного класса на вооружении
SELECT rocket_name, CASE 
	WHEN sum_cost < 50000000 THEN 'Сумма малая'
	ELSE 'Сумма большая'
END AS 'Статус'
FROM 
(SELECT rocket_name, SUM(launch_cost) AS sum_cost FROM Rockets GROUP BY rocket_name) AS subquery;


-- Ракеты и их габаритные характеристики

SELECT id_rocket, rocket_name, manufacturer, rocket_serial_number, trajectory_classification, rocket_classification, distance, max_distance,
basing count_of_stage, count_of_block, payload_mass, KBO, guidance_system, trajectory_control, BCVM, status, t_launch_preparation, t1_combat_duty,
t2_combat_duty, launch_cost, rocket_efficiency, l_total, d, l_head, l_instrument_compartment, l_fuel_tank, l_inter_tank, l_oxidizer_tank, l_tail_section 
FROM Rockets JOIN Dimension_1stages 
ON Rockets.id_1dim = Dimension_1stages.id_dimension;


SELECT id_rocket, rocket_name, manufacturer, rocket_serial_number, trajectory_classification, rocket_classification, distance, max_distance,
basing count_of_stage, count_of_block, payload_mass, KBO, guidance_system, trajectory_control, BCVM, status, t_launch_preparation, t1_combat_duty,
t2_combat_duty, launch_cost, rocket_efficiency, l_total, d_1stage, d_2stage, l_head, l_instrument_compartment, l_1stage_fuel_tank, l_1stage_inter_tank,
l_1stage_oxidizer_tank, l_1stage_tail_section, l_transfer_compartment, l_2stage_fuel_tank, l_2stage_inter_tank, l_2stage_oxidizer_tank
FROM Rockets JOIN Dimension_2stages
ON Rockets.id_2dim = Dimension_2stages.id_dimension;

-- Ракеты и их массовые характеристики

SELECT id_rocket, rocket_name, manufacturer, rocket_serial_number, trajectory_classification, rocket_classification, distance, max_distance,
basing count_of_stage, count_of_block, payload_mass, KBO, guidance_system, trajectory_control, BCVM, status, t_launch_preparation, t1_combat_duty,
t2_combat_duty, launch_cost, rocket_efficiency, m_total, m_head, m_instrument_compartment, m_fuel_tank, m_inter_tank, m_oxidizer_tank, m_tail_section,
m_fuel, m_oxidizer
FROM Rockets JOIN Mass_1stages
ON Rockets.id_1mass = Mass_1stages.id_m1;


SELECT id_rocket, rocket_name, manufacturer, rocket_serial_number, trajectory_classification, rocket_classification, distance, max_distance,
basing count_of_stage, count_of_block, payload_mass, KBO, guidance_system, trajectory_control, BCVM, status, t_launch_preparation, t1_combat_duty,
t2_combat_duty, launch_cost, rocket_efficiency, m_total, m_head, m__instrument_compartment, m_1stage_fuel_tank, m_1stage_inter_tank,
m_1stage_oxidizer_tank, m_1stage_tail_section, m_transfer_compartment, m_2stage_fuel_tank, m_2stage_inter_tank, m_2stage_oxidizer_tank,
m_2stage_tail_section, m_1stage_fuel, m_1stage_oxidizer, m_2stage_fuel, m_2stage_oxidizer
FROM Rockets JOIN Mass_2stages
ON Rockets.id_2mass = Mass_2stages.id_m2;




-- Ракеты с моноблочными ГЧ

SELECT id_rocket, rocket_name, manufacturer, rocket_serial_number, trajectory_classification, rocket_classification, distance, max_distance,
basing count_of_stage, count_of_block, payload_mass, KBO, guidance_system, trajectory_control, BCVM, status, t_launch_preparation, t1_combat_duty,
t2_combat_duty, launch_cost, rocket_efficiency, head_shape, maneuverability, count_false_object, sredstvo_otdeleniya, sredstvo_razdeleniya,
warhead, BB_power 
FROM Rockets JOIN Monoblock_head_parts
ON Rockets.id_rocket = Monoblock_head_parts.id_mono;

SELECT COUNT(*) AS 'Количество ракет с моноблочным ГЧ' FROM Monoblock_head_parts;


SELECT rocket_name, COUNT(*) AS 'Кол-во моноблочных ГЧ у данного типа ракет' FROM Rockets JOIN Monoblock_head_parts
ON Rockets.id_rocket = Monoblock_head_parts.id_mono
GROUP BY rocket_name;

SELECT COUNT(*) AS 'Кол-во моноблочных ГЧ с Ядерной БЧ' FROM Monoblock_head_parts
WHERE warhead = 'Ядерная БЧ';



-- Ракеты с многоблочными ГЧ

SELECT id_rocket, rocket_name, manufacturer, rocket_serial_number, trajectory_classification, rocket_classification, distance, max_distance,
basing count_of_stage, count_of_block, payload_mass, KBO, guidance_system, trajectory_control, BCVM, status, t_launch_preparation, t1_combat_duty,
t2_combat_duty, launch_cost, rocket_efficiency, head_shape, maneuverability, count_false_object, sredstvo_otdeleniya, sredstvo_razdeleniya,
warhead, head_type, lighting_type, cnt_block, power_of_1_BB, BB_schema
FROM Rockets JOIN Multiblock_head_parts
ON Rockets.id_rocket = Multiblock_head_parts.id_multi;

SELECT COUNT(*) AS 'Количество ракет с многоблочным ГЧ' FROM Multiblock_head_parts;

SELECT rocket_name, COUNT(*) AS 'Кол-во многоблочных ГЧ у данного типа ракет' FROM Rockets JOIN Multiblock_head_parts
ON Rockets.id_rocket = Multiblock_head_parts.id_multi
GROUP BY rocket_name;

SELECT COUNT(*) AS 'Кол-во многоблочных ГЧ с Ядерной БЧ' FROM Multiblock_head_parts
WHERE warhead = 'Ядерная БЧ';



-- Ракеты и места их базирования 

SELECT COUNT(*) AS 'Количество базируемых ракет'
FROM Basing
WHERE  ISNULL(X_current) = FALSE AND ISNULL(Y_current) = FALSE AND ISNULL(Z_current) = FALSE;

SELECT id_rocket, rocket_name, rocket_serial_number, X_current, Y_current, Z_current
FROM Rockets JOIN Basing 
ON Rockets.id_rocket = Basing.id_basing;

SELECT id_rocket, rocket_name, rocket_serial_number, X_current, Y_current, Z_current
FROM Rockets JOIN Basing
ON Rockets.id_rocket = Basing.id_basing
WHERE ISNULL(X_current) = FALSE AND ISNULL(Y_current) = FALSE AND ISNULL(Z_current) = FALSE;

SELECT id_rocket, rocket_name, rocket_serial_number, X_current, Y_current, Z_current
FROM Rockets JOIN Basing
ON Rockets.id_rocket = Basing.id_basing
WHERE ISNULL(X_current) = TRUE AND ISNULL(Y_current) = TRUE AND ISNULL(Z_current) = TRUE;




-- Двигатели и компоненты топлива

SELECT * FROM
Liquid_pump_engines JOIN Fuels
ON Liquid_pump_engines.id_F = Fuels.id_fuel
JOIN Oxidizers
ON Liquid_pump_engines.id_O = Oxidizers.id_oxidizer;

SELECT * FROM
Liquid_displacement_engines JOIN Fuels
ON Liquid_displacement_engines.id_F = Fuels.id_fuel
JOIN Oxidizers
ON Liquid_displacement_engines.id_O = Oxidizers.id_oxidizer;


-- Двигатели и тесты к ним

SELECT * FROM
Liquid_pump_engines JOIN Liquid_pump_engines_tests
ON Liquid_pump_engines.id_engine = Liquid_pump_engines_tests.id_engine_t;

SELECT * FROM 
Liquid_displacement_engines JOIN Liquid_displacement_engines_tests
ON Liquid_displacement_engines.id_engine = Liquid_displacement_engines_tests.id_engine_t;

SELECT * FROM
Solid_fuel_engines JOIN Solid_fuel_engines_tests
ON Solid_fuel_engines.id_engine = Solid_fuel_engines_tests.id_engine_t;


-- Средства управления одноступенчатыми ракетами

SELECT rocket_name, manufacturer, pitch_control, yaw_control, roll_control  FROM 
(SELECT rocket_name, manufacturer, pitch_control, yaw_control, roll_control, ROW_NUMBER() OVER (PARTITION BY rocket_name) AS R_N FROM
Rockets JOIN Control_elements
ON Rockets.id_1elem = Control_elements.id_elem) AS subquery
WHERE R_N = 1


SELECT subquery.rocket_name, subquery.manufacturer, subquery.pitch_control_1stage, subquery.yaw_control_1stage, subquery.roll_control_1stage,
pitch_control AS pitch_control_2stage, yaw_control AS yaw_control_2stage, roll_control AS roll_control_2stage
FROM (SELECT id_2elem, rocket_name, manufacturer, pitch_control AS pitch_control_1stage, yaw_control AS yaw_control_1stage, roll_control AS roll_control_1stage,
ROW_NUMBER () OVER (PARTITION BY rocket_name) AS R_N
FROM Rockets JOIN Control_elements
ON Rockets.id_1elem = Control_elements.id_elem) AS subquery
JOIN Control_elements
ON subquery.id_2elem = Control_elements.id_elem
WHERE R_N = 1;




-- Двигатели одноступенчатых ракет

SELECT rocket_name, engine_name, engine_type, fuel_delivery, engine_schema, pump, count_TNA, count_gas_generator, nozzle_type,
reusable_launch, cooling, launch_type, thrust, specific_impulse, P_combustion_chamber, working_hours, l_combustion_chamber,
d_combustion_chamber, l_nozzle, ignition_method, RKS_system, SOB_system
FROM 
Rockets JOIN Liquid_pump_engines
ON Rockets.id_1engine = Liquid_pump_engines.id_engine
WHERE count_of_stage = 1;


SELECT rocket_name, engine_name, engine_type, fuel_delivery, temperature_classific, specific_view, nozzle_type, reusable_launch, cooling,
launch_type,  thrust, specific_impulse, P_combustion_chamber, working_hours, l_combustion_chamber, d_combustion_chamber, l_nozzle, ignition_method,
RKS_system, SOB_system
FROM
Rockets JOIN Liquid_displacement_engines
ON Rockets.id_1engine = Liquid_displacement_engines.id_engine
WHERE count_of_stage = 1;


-- Двигатели двухступенчатых ракет

-- 1 и 2 ступень насосной подачи
SELECT subquery.rocket_name, subquery.engine_name_1stage, subquery.engine_type_1stage, subquery.fuel_delivery_1stage, subquery.engine_schema_1stage, 
subquery.thrust_1stage, subquery.specific_impulse_1stage, subquery.P_combustion_chamber_1stage, engine_name AS engine_name_2stage,
engine_type AS engine_type_2stage, fuel_delivery  AS fuel_delivery_2stage, engine_schema AS engine_schema_2stage, thrust AS thrust_2stage, 
specific_impulse AS specific_impulse_2stage, P_combustion_chamber AS P_combustion_chamber_2stage FROM 
(SELECT rocket_name, id_2engine, engine_name AS engine_name_1stage, engine_type AS engine_type_1stage, fuel_delivery AS fuel_delivery_1stage, engine_schema AS engine_schema_1stage,
thrust AS thrust_1stage, specific_impulse AS specific_impulse_1stage, P_combustion_chamber AS P_combustion_chamber_1stage
FROM Rockets JOIN Liquid_pump_engines
ON Rockets.id_1engine = Liquid_pump_engines.id_engine
WHERE count_of_stage = 2) AS subquery
JOIN Liquid_pump_engines
ON subquery.id_2engine = Liquid_pump_engines.id_engine;


-- 1 и 2 ступень вытеснительной подачи
SELECT subquery.rocket_name, subquery.engine_name_1stage, subquery.engine_type_1stage, subquery.fuel_delivery_1stage,
subquery.thrust_1stage, subquery.specific_impulse_1stage, subquery.P_combustion_chamber_1stage, engine_name AS engine_name_2stage,
engine_type AS engine_type_2stage, fuel_delivery  AS fuel_delivery_2stage, thrust AS thrust_2stage, 
specific_impulse AS specific_impulse_2stage, P_combustion_chamber AS P_combustion_chamber_2stage FROM 
(SELECT rocket_name, id_2engine, engine_name AS engine_name_1stage, engine_type AS engine_type_1stage, fuel_delivery AS fuel_delivery_1stage,
thrust AS thrust_1stage, specific_impulse AS specific_impulse_1stage, P_combustion_chamber AS P_combustion_chamber_1stage
FROM Rockets JOIN Liquid_displacement_engines
ON Rockets.id_1engine = Liquid_displacement_engines.id_engine
WHERE count_of_stage = 2) AS subquery
JOIN Liquid_displacement_engines
ON subquery.id_2engine = Liquid_displacement_engines.id_engine; 



-- 1 и 2 ступень рдтт 
SELECT subquery.rocket_name, subquery.engine_name_1stage, subquery.engine_type_1stage, subquery.fuel_delivery_1stage, subquery.layout_1stage,
subquery.fuel_type_1stage, subquery.thrust_1stage, subquery.specific_impulse_1stage, subquery.P_combustion_chamber_1stage, engine_name AS engine_name_2stage,
engine_type AS engine_type_2stage, fuel_delivery  AS fuel_delivery_2stage, layout AS layout_2stage, fuel_type AS fuel_type_2stage, thrust AS thrust_2stage, 
specific_impulse AS specific_impulse_2stage, P_combustion_chamber AS P_combustion_chamber_2stage FROM 
(SELECT rocket_name, id_2engine, engine_name AS engine_name_1stage, engine_type AS engine_type_1stage, fuel_delivery AS fuel_delivery_1stage,
layout AS layout_1stage, fuel_type AS fuel_type_1stage, thrust AS thrust_1stage, specific_impulse AS specific_impulse_1stage, P_combustion_chamber AS P_combustion_chamber_1stage
FROM Rockets JOIN Solid_fuel_engines
ON Rockets.id_1engine = Solid_fuel_engines.id_engine
WHERE count_of_stage = 2) AS subquery
JOIN Solid_fuel_engines
ON subquery.id_2engine = Solid_fuel_engines.id_engine;



-- Двигатель с самой высокой тягой
DROP PROCEDURE IF EXISTS Best_thrust;
CREATE PROCEDURE Best_thrust()
BEGIN
	DECLARE max_thrust1, max_thrust2, max_thrust3 INT;
     SET max_thrust1 = (SELECT MAX(thrust) FROM Liquid_pump_engines);
     SET max_thrust2 = (SELECT MAX(thrust) FROM Liquid_displacement_engines);
     SET max_thrust3 = (SELECT MAX(thrust) FROM Solid_fuel_engines);
    IF(max_thrust1 > max_thrust2 AND max_thrust1 > max_thrust3) THEN
        SELECT max_thrust1 AS 'Наибольшая тяга';
   ELSEIF(max_thrust2 > max_thrust1 AND max_thrust_2 > max_thrust3) THEN 
        SELECT max_thrust2 AS 'Наибольшая тяга';
   ELSEIF(max_thrust3 > max_thrust1 AND max_thrust3 > max_thrust2) THEN
        SELECT max_thrust3 AS 'Наибольшая тяга';
   END IF;
END



CALL Best_thrust();












