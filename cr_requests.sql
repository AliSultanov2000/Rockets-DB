USE сivilian_rockets;


SHOW DATABASES;


-- query to the main table

SELECT * FROM Rockets;


-- unique types of rockets

SELECT Rocket AS 'Unique rockets' FROM 
   (SELECT rocket_name AS Rocket, ROW_NUMBER() OVER (PARTITION BY rocket_name) AS R_N FROM Rockets) AS subquery
   WHERE R_N = 1;
  
  
  
-- Let's look at the launches on the timeline
  
SELECT rocket_name AS 'Rocket', t_start_time AS 'Rocket launch time' FROM Rockets
ORDER BY t_start_time ASC;


-- let's look at the maximum and minimum orbit for this type of rocket

SELECT rocket_name AS 'Rocket', MIN(orbit_height) AS 'Minimum rocket orbit', MAX(orbit_height) AS 'Maximum rocket orbit' FROM Rockets
GROUP BY rocket_name;


-- Let's look at the number of successful and unsuccessful missions

SELECT mission_success AS 'Mission success', COUNT(mission_success) AS 'Number of missions' FROM Rockets
GROUP BY mission_success;


-- Let's look at the earliest and latest launch for this type of rocket

SELECT rocket_name AS 'Rocket', MIN(t_start_time) AS 'The earliest launch', MAX(t_start_time) AS 'Latest launch' FROM Rockets
GROUP BY rocket_name;


--  Let's look at the minimum and maximum cost of launching this type of rocket

SELECT rocket_name AS 'Rocket', MIN(launch_cost) AS 'Minimum launch cost', MAX(launch_cost) AS 'Maximum launch cost' FROM Rockets
GROUP BY rocket_name;


-- Engines and fuel components to them

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


-- Engines and tests for them

SELECT * FROM
Liquid_pump_engines JOIN Lpe_tests
ON Liquid_pump_engines.id_engine = Lpe_tests.id_engine_t;

SELECT * FROM 
Liquid_displacement_engines JOIN Lde_tests
ON Liquid_displacement_engines.id_engine = Lde_tests.id_engine_t;

SELECT * FROM
Solid_fuel_engines JOIN Sfe_tests
ON Solid_fuel_engines.id_engine = Sfe_tests.id_engine_t;


-- Maximum thrust among all types of engines 

DROP PROCEDURE IF EXISTS best_thrust;

CREATE PROCEDURE best_thrust()
BEGIN
    DECLARE max_thrust1, max_thrust2, max_thrust3 INT;
    SET max_thrust1 = (SELECT MAX(thrust) FROM Liquid_pump_engines);
    SET max_thrust2 = (SELECT MAX(thrust) FROM Liquid_displacement_engines);
    SET max_thrust3 = (SELECT MAX(thrust) FROM Solid_fuel_engines);
   IF(max_thrust1 > max_thrust2 AND max_thrust1 > max_thrust3) THEN
        SELECT max_thrust1 AS 'Max thrust of all engines';
   ELSEIF(max_thrust2 > max_thrust1 AND max_thrust_2 > max_thrust3) THEN 
        SELECT max_thrust2 AS 'Max thrust of all engines';
   ELSEIF(max_thrust3 > max_thrust1 AND max_thrust3 > max_thrust2) THEN
        SELECT max_thrust3 AS 'Max thrust of all engines';
   END IF;  
END


CALL best_thrust();


-- Basing of rockets

SELECT rocket_name, rocket_serial_number, X_current, Y_current, Z_current FROM 
Rockets JOIN Basing
ON Rockets.id_rocket = Basing.id_basing;



-- Rocket dimensions  (1 stages)

SELECT * FROM
Rockets JOIN Dimension_1stages
ON Rockets.id_1dim = Dimension_1stages.id_dimension;


-- Rocket dimensions (2 stages)

SELECT * FROM
Rockets JOIN Dimension_2stages
ON Rockets.id_2dim = Dimension_2stages.id_dimension;


-- Mass of rockets (1 stages)

SELECT * FROM 
Rockets JOIN Mass_1stages
ON Rockets.id_1mass = Mass_1stages.id_m1;


-- Mass of rockets (2 stages)

SELECT * FROM 
Rockets JOIN Mass_2stages
ON Rockets.id_2mass = Mass_2stages.id_m2;



-- Other rocket parameters 

SELECT * FROM 
Rockets JOIN Other_rocket_parameters
ON Rockets.id_param = Other_rocket_parameters.id;