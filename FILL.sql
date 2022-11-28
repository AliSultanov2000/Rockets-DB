USE Civilian_rockets;

DELETE FROM Fuels;

INSERT Fuels(id_fuel, name_fuel, μ, I, ρ, η, c , P_p, Tkr, toxicity) VALUES 
(1, 'Hydrogen', 2.016, -4354, 70, 0.000013, 9.36, 101.3, 33.3, FALSE),
(2, 'Hydrazine', 32.048, 1576, 1010, 0.00009, 3.084, 1.9, 652, TRUE),
(3, 'Kerosene', 100, -1948, 850, 0.000015, 2.38, 4.2, 673, FALSE),
(4, 'Xylidine', 121.12, -291, 977, 0.00004, 2.17, 3.12, 618, TRUE),
(5, 'Methane', 16.043, -5566, 420, 0.00009, 3.424, 101.3, 191, FALSE),
(6, 'NDMG', 60.102, 828, 790, 0.000051, 2.73, 21, 522, TRUE),
(7, 'Triethylamine', 101.07, -610, 728, 0.000035, 2.13, 18, 533, TRUE),
(8, 'TG-02', 76.38, -451, 850, 0.00007, 2.22, 1.3, 498, TRUE);



DELETE FROM Oxidizers;

INSERT Oxidizers(id_oxidizer, name_oxidizer, μ, I, ρ, η, c , P_p, Tkr, toxicity) VALUES 
(1, 'Nitric acid', 63.016, -2764, 1520, 0.000075, 1.763, 5.73, 531, TRUE),
(2, 'Oxygen', 32, -398, 1140, 0.00002, 1.7, 101.3, 155, FALSE),
(3, 'Hydrogen peroxide', 34.016, -5520, 1430, 0.000012, 2.88, 0.26, 730, FALSE),
(4, 'Nitrogen tetraoxide', 92.016, -207, 1440, 0.000042, 1.539, 101.3, 431, TRUE),
(5, 'АК-20', 47, -1985, 1503, 0.000015, 1.5, 16, 370, TRUE),
(6, 'АК-27', 47.632, -2732, 1600, 0.000016, 1.325, 20, 589, TRUE);




DELETE FROM Liquid_pump_engines;

INSERT Liquid_pump_engines(id_engine, id_F, id_O, engine_name, engine_type, fuel_delivery, engine_schema, pump, count_TNA, count_gas_generator,
nozzle_type, reusable_launch, cooling, launch_type, thrust, specific_impulse, P_combustion_chamber, working_hours, 
l_combustion_chamber, d_combustion_chamber,  l_nozzle, ignition_method, RKS_system, SOB_system)
VALUES
(1, 1, 2, 'RD-580', 'Liquid propellant rocket engine', 'Pump', 'L + L', 'Lobed', 1, 1, 'Laval nozzle', TRUE, 'Regenerative', 'Smooth', 420, 475, 260, 95.3, 0.5, 0.5, 2.2, 'Сhemical', TRUE, TRUE),
(2, 1, 2, 'RD-540', 'Liquid propellant rocket engine', 'Pump', 'G + G', 'Lobed', 2, 2, 'Laval nozzle', TRUE, 'Regenerative', 'Stepped', 380, 394, 214, 80.2, 0.6, 0.4, 1.8, 'Сhemical', TRUE, TRUE),
(3, 6, 4, 'RD-350', 'Liquid propellant rocket engine', 'Pump', 'L + L', 'Lobed', 1, 1, 'Laval nozzle', TRUE, 'Regenerative', 'Stepped', 360, 321, 200, 120, 0.35, 0.35, 1.6, 'Сhemical', TRUE, TRUE),
(4, 6, 4, 'RD-310', 'Liquid propellant rocket engine', 'Pump', 'L + L', 'Lobed', 1, 1, 'Laval nozzle', TRUE, ' Regenerative', 'Smooth', 240, 216, 187, 100, 0.24, 0.24, 1.2, 'Сhemical', TRUE, TRUE),
(5, 6, 4, 'RD-111', 'Liquid propellant rocket engine', 'Pump', 'Г + L', 'Lobed', 1, 1, 'Laval nozzle', TRUE, 'Regenerative', 'Smooth', 150, 149, 160, 160.5, 0.2, 0.2, 1.2, 'Сhemical', TRUE, TRUE),
(6, 6, 4, 'RD-140', 'Liquid propellant rocket engine', 'Pump', 'L + L', 'Lobed', 1, 1, 'Laval nozzle', TRUE, 'Regenerative', 'Stepped', 260, 273, 179, 95, 0.27, 0.27, 1, 'Сhemical', TRUE, TRUE),
(7, 4, 5, 'RD-980', 'Liquid propellant rocket engine', 'Pump', 'L + L', 'Voluminous', 1, 1, 'Laval nozzle', TRUE, 'Regenerative', 'Smooth', 140, 148, 121, 150, 0.2, 0.2, 0.8, 'Сhemical', TRUE, TRUE),
(8, 4, 5, 'RD-983', 'Liquid propellant rocket engine', 'Pump', 'L + L', 'Voluminous', 1, 1, 'Laval nozzle', TRUE, 'Regenerative', 'Smooth',  142, 149, 127, 130, 0.22, 0.22, 0.8, 'Сhemical', TRUE, TRUE),
(9, 4, 5, 'RD-981', 'Liquid propellant rocket engine', 'Pump', 'L + L', 'Lobed', 1, 1, 'Laval nozzle', TRUE, 'Regenerative', 'Smooth', 139, 137, 129, 150, 0.15, 0.15, 0.6, 'Сhemical', TRUE, TRUE),
(10, 4, 6,'RD-982', 'Liquid propellant rocket engine', 'Pump', 'L + L', 'Lobed', 1, 1, 'Laval nozzle', TRUE, 'Regenerative', 'Smooth', 124, 128, 130, 145, 0.13, 0.13, 0.58, 'Сhemical', TRUE, TRUE);

 

INSERT Liquid_displacement_engines(id_engine, id_F, id_O, engine_name, engine_type, fuel_delivery, temperature_classific, specific_view, 
nozzle_type, reusable_launch, cooling, launch_type, thrust, specific_impulse, P_combustion_chamber, working_hours, l_combustion_chamber, 
d_combustion_chamber, l_nozzle, ignition_method, RKS_system, SOB_system)
VALUES 
(11, 3, 2, 'RD-1', 'Liquid rocket engine', 'Displacement', 'Hot gas', 'Chemical boost', 'Laval nozzle', TRUE, 'Regenerative', 'Smooth', 250, 231, 140, 90, 0.27, 0.27, 0.9, 'Electrospark', TRUE, TRUE),
(12, 3, 2, 'RD-2', 'Liquid rocket engine', 'Displacement', 'Hot gas', 'Gas balloon', 'Laval nozzle', TRUE, 'Regenerative', 'Smooth', 110, 116, 136, 90, 0.2, 0.2, 0.75, 'Electrospark', TRUE, TRUE),
(13, 3, 2, 'RD-3', 'Liquid rocket engine', 'Displacement', 'Hot gas', 'Gas balloon', 'Laval nozzle', TRUE, 'Regenerative', 'Smooth', 118, 124, 139, 95, 0.25, 0.25, 0.9, 'Electrospark', TRUE, TRUE),
(14, 3, 2, 'RD-4', 'Liquid rocket engine', 'Displacement', 'Hot gas', 'Gas balloon', 'Conical', TRUE, 'Regenerative', 'Smooth', 90, 98, 120, 150, 0.1, 0.1, 0.5, 'Electrospark', TRUE, TRUE),
(15, 3, 2, 'RD-5', 'Liquid rocket engine', 'Displacement', 'Hot gas', 'Gas balloon', 'Conical', TRUE, 'Regenerative', 'Smooth', 95, 101, 127, 100, 0.15, 0.15, 0.8, 'Electrospark', TRUE, TRUE),
(16, 3, 2, 'RD-6', 'Liquid rocket engine', 'Displacement', 'Cold gas', 'Chemical boost', 'Laval nozzle', TRUE, 'Regenerative', 'Smooth', 258, 239, 140, 94, 0.35, 0.35, 1.2, 'Electrospark', TRUE, TRUE),
(17, 3, 2, 'RD-7', 'Liquid rocket engine', 'Displacement', 'Cold gas', 'Chemical boost', 'Laval nozzle', TRUE, 'Regenerative', 'Smooth', 260, 241, 143, 92, 0.38, 0.32, 0.9, 'Electrospark', TRUE, TRUE),
(18, 3, 2, 'RD-8', 'Liquid rocket engine', 'Displacement', 'Cold gas', 'Gas balloon', 'Conical', TRUE, 'Regenerative', 'Smooth', 218, 207, 107, 120, 0.25, 0.25, 0.65, 'Electrospark', TRUE, TRUE),
(19, 3, 2, 'RD-9', 'Liquid rocket engine', 'Displacement', 'Cold gas', 'Gas balloon', 'Laval nozzle', TRUE, 'Regenerative', 'Smooth', 90, 94, 69, 150, 0.12, 0.12, 0.5, 'Electrospark', TRUE, TRUE),
(20, 3, 2, 'RD-10', 'Liquid rocket engine', 'Displacement', 'Cold gas', 'Gas balloon', 'Conical', TRUE, 'Regenerative', 'Stepped', 92, 91, 71, 200, 0.14, 0.14, 0.5, 'Electrospark', TRUE, TRUE);



DELETE FROM Solid_fuel_engines; 

INSERT Solid_fuel_engines(id_engine, engine_name, engine_type, fuel_delivery, layout, fuel_type, charge_form, nozzle_type, reusable_launch, 
cooling, launch_type, thrust, specific_impulse, P_combustion_chamber, working_hours, l_combustion_chamber, d_combustion_chamber, l_nozzle)
VALUES 
(21, 'RD-21', 'Solid fuel', 'Absent', 'SZ type charge', 'Mixed', 'Telescopic charge', 'Laval nozzle', TRUE, 'Refrigerant', 'Cannon', 92, 97, 71, 150, 0.10, 0.10, 0.4),
(22, 'RD-22', 'Solid fuel', 'Absent', 'SZ type charge', 'Mixed', 'Telescopic charge', 'Conical', TRUE, 'Refrigerant', 'Cannon', 98, 101, 89, 130, 0.12, 0.12, 0.48),
(23, 'RD-23', 'Solid fuel', 'Absent', 'SZ type charge', 'Mixed', 'Telescopic charge', 'Laval nozzle', TRUE, 'Refrigerant', 'Cannon', 150, 169, 100, 130, 0.2, 0.2, 0.6),
(24, 'RD-24', 'Solid fuel', 'Absent', 'SZ type charge', 'Mixed', 'Telescopic charge', 'Conical', TRUE, 'Refrigerant', 'Cannon', 163, 171, 103, 95, 0.2, 0.2, 0.63),
(25, 'RD-25', 'Solid fuel', 'Absent', 'SZ type charge', 'Mixed', 'Telescopic charge', 'Laval nozzle', TRUE, 'Refrigerant', 'Cannon', 93, 98, 72, 155, 0.11, 0.11, 0.43),
(26, 'RD-26', 'Solid fuel', 'Absent', 'SZ type charge', 'Mixed', 'Telescopic charge', 'Conical', TRUE, 'Refrigerant', 'Cannon', 97, 99, 79, 140, 0.13, 0.12, 0.5),
(27, 'RD-27', 'Solid fuel', 'Absent', 'SZ type charge', 'Mixed', 'Telescopic charge', 'Conical', TRUE, 'Refrigerant', 'Cannon', 95, 94, 72, 145, 0.15, 0.15, 0.3),
(28, 'RD-28', 'Solid fuel', 'Absent', 'SZ type charge', 'Mixed', 'Telescopic charge', 'Conical', TRUE, 'Refrigerant', 'Cannon', 99, 92, 78, 150, 0.12, 0.12, 0.32),
(29, 'RD-29', 'Solid fuel', 'Absent', 'SZ type charge', 'Mixed', 'Telescopic charge', 'Laval nozzle', TRUE, 'Refrigerant', 'Cannon', 102, 105, 94, 160, 0.175, 0.175, 0.44),
(30, 'RD-30', 'Solid fuel', 'Absent', 'SZ type charge', 'Mixed', 'Telescopic charge', 'Laval nozzle', TRUE, 'Refrigerant', 'Cannon', 104, 112, 97, 130, 0.13, 0.13, 0.47);



DELETE FROM Liquid_pump_engines_tests;

INSERT Liquid_pump_engines_tests(id_engine_t, t1_engine_test, t2_engine_test, engine_test_name, engine_test_result, thrust_test, specific_impulse_test, P_combustion_chamber_test)
VALUES
(1, '1960-03-10', '1960-03-12', 'RD-580', 'All systems are normal', 420, 475, 260),
(2, '1974-02-12', '1974-02-12', 'RD-540', 'Pressure jump in CS', 0, 0, 0),
(2, '1974-03-15', '1974-03-15', 'RD-540', 'All systems are normal', 380, 394, 214),
(3, '1980-02-12', '1980-02-15', 'RD-350', 'All systems are normal', 360, 321, 200),
(4, '1979-06-12', '1979-06-14', 'RD-310', 'Destruction of the nozzle', 0, 0, 0),
(4, '1979-09-15', '1979-09-17', 'RD-310', 'All systems are normal', 240, 216, 187),
(5, '1969-03-15', '1969-03-15', 'RD-111', 'All systems are normal', 150, 149, 160),
(6, '1996-02-17', '1996-02-19', 'RD-140', 'All systems are normal',  260, 273, 179),
(7, '2003-06-08', '2003-06-09', 'RD-980', 'All systems are normal', 140, 148, 121),
(8, '2008-01-19', '2008-01-23', 'RD-983', 'All systems are normal', 142, 149, 127),
(9, '1984-09-13', '1984-09-16', 'RD-981', 'All systems are normal', 139, 137, 129),
(10, '2010-04-12', '2010-04-16', 'RD-982', 'All systems are normal', 124, 128, 130);


DELETE FROM Liquid_displacement_engines_tests;

INSERT Liquid_displacement_engines_tests(id_engine_t, t1_engine_test, t2_engine_test, engine_test_name, engine_test_result, thrust_test, specific_impulse_test, P_combustion_chamber_test)
VALUES
(11, '1983-02-16', '1983-02-18', 'RD-1', 'All systems are normal', 250, 231, 140),
(12, '1970-02-15', '1970-02-18','RD-2', 'All systems are normal', 110, 116, 136),
(13, '1990-04-12', '1990-04-14', 'RD-3', 'Destruction of the nozzle', 0, 0, 0),
(13, '1990-06-12', '1990-06-14', 'RD-3', 'All systems are normal', 118, 124, 139),
(14, '1998-02-13', '1998-02-15', 'RD-4', 'All systems are normal', 90, 98, 120),
(15, '2015-04-18', '2015-04-20', 'RD-5', 'All systems are normal', 95, 101, 127),
(16, '1990-04-13', '1990-04-16', 'RD-6', 'All systems are normal',  258, 239, 140),
(17, '2003-01-12', '2003-01-15', 'RD-7', 'All systems are normal', 260, 241, 143),
(18, '2006-01-14', '2006-01-15', 'RD-8', 'All systems are normal', 218, 207, 107),
(19, '1995-02-17', '1995-02-18', 'RD-9', 'All systems are normal', 90, 94, 69),
(20, '2009-01-25', '2009-01-28', 'RD-10', 'High-frequency oscillations', 0, 0, 0),
(20, '2010-04-13', '2010-04-13', 'RD-10', 'All systems are normal', 92, 91, 71);



DELETE FROM Solid_fuel_engines_tests;

INSERT Solid_fuel_engines_tests(id_engine_t, t1_engine_test, t2_engine_test, engine_test_name, engine_test_result, thrust_test, specific_impulse_test, P_combustion_chamber_test)
VALUES
(21, '1995-04-12', '1995-04-15', 'RD-21', 'All systems are normal', 92, 97, 71),
(22, '1968-02-13', '1968-02-14', 'RD-22', 'All systems are normal', 98, 101, 89),
(23, '1975-02-17', '1975-02-19', 'RD-23', 'All systems are normal', 150, 169, 100),
(24, '1989-05-17', '1989-05-19', 'RD-24', 'All systems are normal', 163, 171, 103),
(25, '2016-03-19', '2016-03-19', 'RD-25', 'All systems are normal', 93, 98, 72),
(26, '1989-04-15', '1989-04-17', 'RD-26', 'All systems are normal', 97, 99, 79),
(27, '2000-01-17', '2000-01-18', 'RD-27', 'All systems are normal', 95, 94, 72),
(28, '2005-12-14', '2005-12-15', 'RD-28', 'All systems are normal', 99, 92, 78),
(29, '1970-04-10', '1970-04-12', 'RD-29', 'High-frequency oscillations', 0, 0, 0),
(29, '1971-04-11', '1971-04-13', 'RD-29', 'All systems are normal',  102, 105, 94),
(30, '1982-05-12', '1982-05-16', 'RD-30', 'All systems are normal', 104, 112, 97);



DELETE FROM Dimension_1stages;

INSERT Dimension_1stages(id_dimension,  l_total, d, l_head, l_instrument_compartment, l_fuel_tank, l_inter_tank, l_oxidizer_tank, l_tail_section)
VALUES
(1, 5.2, 0.4, 1, 0.5, 1.5, 0.3, 1, 0.9), -- Х-55 + 
(2, 5.3, 0.5, 1, 0.5, 1.5, 0.3, 1, 1), -- Х-90 + 
(3, 6.3, 0.5, 1, 0.5, 2, 0.3, 1.5, 1), -- Х-101 + 
(4, 3.7, 0.5, 0.8, 0.3, 1.1, 0.1, 0.8, 0.6), -- Калибр +  
(5, 7.4, 1, 1.5, 0.4, 2.5, 0, 2, 1), -- Искандер + 
(6, 6.1, 0.8, 1.3, 0.3, 2.2, 0, 1.7, 0.6), -- П - 120 + 
(7, 7.9, 0.9, 1.4, 0.3, 2.6, 0.3, 2.1, 1), -- П-700 + 
(8, 5, 0.6, 0.9, 0.3, 1.9, 0, 1.2, 0.7); -- Бастион + 



DELETE FROM Dimension_2stages;

INSERT Dimension_2stages(id_dimension, l_total, d_1stage, d_2stage, l_head, l_instrument_compartment, l_1stage_fuel_tank, l_1stage_inter_tank,
l_1stage_oxidizer_tank, l_1stage_tail_section, l_transfer_compartment, l_2stage_fuel_tank, l_2stage_inter_tank, l_2stage_oxidizer_tank)
VALUES
(1, 26.1, 3, 3, 3.7, 1, 6, 0.8, 4, 2.6, 1.8, 3.3, 0.8, 2.1), -- Р 16 + 
(2, 23.9, 3, 3, 3.7, 0.7, 6.2, 0, 3.8, 2.5, 1.7, 3.3, 0, 2), -- Р 36  +
(3, 22.9,  3, 3, 4,  0.7,  5.8, 0, 3.6, 2.5, 1.3, 3, 0, 2), -- Р 36 М + 
(4, 22.3, 3, 2.5, 4, 0.6,  5.6, 0, 3.5, 2.4, 1.2, 3, 0, 2), -- УР 100 +
(5, 22.3, 3, 2.5, 4, 0.6,  5.6, 0, 3.5, 2.4, 1.2, 3, 0, 2), -- УР 100М +
(6, 22.5, 3,  3,  4, 0.7,  5.8, 0, 3.6, 2.4, 1.2, 3, 0, 1.8),  -- Сармат + 
(7, 20.6, 2.5, 2.5, 3.5, 0.5, 5, 0, 3, 2, 1, 3.4, 0, 2.2), -- Тополь + 
(8, 20.6, 2.5, 2.5, 3.5, 0.5, 5, 0, 3, 2, 1, 3.4, 0, 2.2), -- Тополь-М + 
(9, 16.4, 2, 2, 3, 0.5, 4, 0, 2.5, 1.6, 1, 2.5, 0, 1.3), -- Пионер 
(10, 7.75, 1.7, 1.7, 2.8, 0.2, 1, 0, 0.8, 0.8, 0.35, 1, 0, 0.8), -- Циркон + 
(11, 7.05, 1.5, 1.5, 2.5, 0.2, 1, 0, 0.6, 0.8, 0.35, 1, 0, 0.6) -- П 1000 +


DELETE FROM Mass_1stages;

INSERT Mass_1stages(id_m1, m_total, m_head, m_instrument_compartment, m_fuel_tank, m_inter_tank, m_oxidizer_tank, m_tail_section, m_fuel, m_oxidizer)
VALUES
(1, 1275 , 280, 53, 50, 4, 43, 145, 500, 300), -- Х-55
(2, 1568, 340, 58, 78, 4,  63, 202, 611, 312), -- Х - 90
(3, 2343, 500, 83, 102, 5, 89, 201, 843, 620), -- Х - 101
(4, 2105, 450, 82, 88, 4, 62, 186,  742, 591), -- Калибр
(5, 4442, 550, 106, 164, 0, 138, 184, 2100, 1200),  -- Искандер  
(6, 3175, 500, 85, 120, 0, 111, 195, 1450, 814), -- П-120
(7, 4899, 580, 120, 185, 4, 160, 220, 2200, 1530), -- П-700
(8, 2435, 600, 88, 94, 0, 75, 178, 850, 650) -- Бастион


DELETE FROM Mass_2stages; 

INSERT Mass_2stages(id_m2, m_total, m_head, m__instrument_compartment, m_1stage_fuel_tank, m_1stage_inter_tank, m_1stage_oxidizer_tank,
m_1stage_tail_section, m_transfer_compartment, m_2stage_fuel_tank, m_2stage_inter_tank, m_2stage_oxidizer_tank, m_2stage_tail_section, 
m_1stage_fuel, m_1stage_oxidizer, m_2stage_fuel, m_2stage_oxidizer)
VALUES
(1, 138882, 2320, 90, 150, 4, 120, 520, 75, 100, 4, 89, 410,  70000, 30000,  25000, 10000), -- Р16
(2, 186263, 4700, 100, 157, 0, 133, 520, 70, 101, 0, 87, 395, 85000, 45000, 32000, 18000),  -- Р36
(3, 197165, 9000, 150, 159, 0, 135, 521, 72, 96, 0, 88, 394, 87000, 47500, 33400, 18650), -- Р36М
(4, 36438, 2350, 124, 146, 0, 120, 452, 70, 94, 0, 78, 304, 15000, 5800, 8000, 3900), -- УР 100
(5, 37179, 3100, 124, 146, 0, 120, 452, 70, 94, 0, 69, 304, 15000, 5800, 8000, 3900), -- УР 100М
(6, 204729, 9400, 170, 195, 0, 110, 612, 90, 140, 0, 97, 415, 90000, 50000, 34000, 19500), -- Сармат
(7, 40465, 1450, 90, 110, 0, 79, 410, 70, 90, 0, 54, 312, 20000, 8000, 7000, 2800), -- Тополь
(8, 41015, 2000, 90, 110, 0, 79, 410, 70, 90, 0, 54, 312, 20000, 8000, 7000, 2800), -- Тополь М
(9, 32751, 2100, 84, 94, 0, 75, 380, 70, 74, 0, 59, 315,  15000, 6000, 6400, 2100), -- Пионер
(10, 3717, 1160, 39, 62, 0, 42, 196, 12,  51, 0, 39, 110, 800, 300, 620, 286), -- Циркон
(11, 7477, 980, 79, 83, 0, 61, 299, 20, 67, 0, 49, 214, 2500, 1500, 1000, 625); -- П 1000

 

-- Высота орбиты + 
-- Наклонение орбиты + 
-- Количество витков на орбите +
-- Успешна миссия или нет + 
-- Вид миссии: для какой страны +


-- Добавить сюда id-шник для связи с other_rocket_param
INSERT Rockets(id_rocket, id_1engine, id_2engine, rocket_name, manufacturer, rocket_serial_number,  orbit_height, orbit_inclination, turns_number, 
mission_success, mission_customer, basing,  t_launch_preparation, t_start_time, launch_cost, rocket_efficiency, id_1dim, id_2dim, id_1mass, id_2mass, id_1elem, id_2elem, id_test)
VALUES                                                                                                                         
(1, 1, 1, 'TP-16', 'OKB-586', '18А400', 340, 90, 5, TRUE, 'UA', 'Starting table',  300, '1962-04-10', 12300000, 0.89, NULL, 1, NULL, 1, 8, 8, 1),
(2, 1, 1, 'TP-16', 'OKB-586', '18А401', 344, 92, 10, TRUE, 'UA', 'Starting table',  300, '1962-05-12', 12300000, 0.89, NULL, 1, NULL, 1, 8, 8, 1),
(3, 1, 1, 'TP-16', 'OKB-586', '18А402', 190, 15, 3, TRUE, 'UA', 'Starting table',  300, '1962-06-18', 12300000, 0.89, NULL, 1, NULL, 1, 8, 8, 1),
(4, 1, 1, 'TP-16', 'OKB-586', '18А403', 215, 20, 2, TRUE, 'UA', 'Starting table',  300, '1963-07-20', 12300000, 0.89, NULL, 1, NULL, 1, 8, 8, 1),
(5, 1, 1, 'TP-16', 'OKB-586', '18А404', 550, 25, 5, TRUE, 'UA', 'Starting table',  300, '1963-03-21', 12300000, 0.89, NULL, 1, NULL, 1, 8, 8, 1),
(6, 1, 1, 'TP-16', 'OKB-586', '18А405', 490, 24, 5, TRUE, 'UA', 'Starting table',  300, '1963-07-27', 12300000, 0.89, NULL, 1, NULL, 1, 8, 8, 1),
(7, 1, 1, 'TP-16', 'OKB-586', '18А406', 380, 70, 4, TRUE, 'USA', 'Starting table',  300, '1963-08-21', 12300000, 0.89, NULL, 1, NULL, 1, 8, 8, 1),
(8, 1, 1, 'TP-16', 'OKB-586', '18А407', 340, 75,  3, TRUE, 'USA', 'Starting table',  300, '1963-07-19', 12300000, 0.89, NULL, 1, NULL, 1, 8, 8, 1),
(9, 1, 1, 'TP-16', 'OKB-586', '18А408', 340, 75.3, 2, TRUE, 'UK', 'Starting table',  300, '1963-03-11', 12300000, 0.89, NULL, 1, NULL, 1, 8, 8, 1),
(10, 1, 1, 'TP-36', 'OKB-586', '18А409', 348, 79, 4, TRUE,  'UK', 'Starting table',   250, '1967-07-15', 13450000, 0.92, NULL, 2, NULL, 2, 8, 8, 2),
(11, 1, 1, 'TP-36', 'OKB-586', '18А410', 290, 70.3, 6, TRUE, 'UK', 'Starting table',   250, '1967-04-18', 3450000, 0.92, NULL, 2, NULL, 2, 8, 8, 2),
(12, 1, 1, 'TP-36', 'OKB-586', '18А411', 190,  20, 4, TRUE, 'UK', 'Starting table',   250, '1967-02-22', 13450000, 0.92, NULL, 2, NULL, 2, 8, 8, 2),
(13, 1, 1, 'TP-36', 'OKB-586', '18А412', 330,  21, 2, TRUE, 'UK', 'Starting table',   250, '1967-01-11', 13450000, 0.92, NULL, 2, NULL, 2, 8, 8, 2),
(14, 1, 1, 'TP-36', 'OKB-586', '18А413', 550,  22, 1, TRUE, 'UK', 'Starting table',   250, '1967-09-10', 13450000, 0.92, NULL, 2, NULL, 2, 8, 8, 2),
(15, 1, 1, 'TP-36', 'OKB-586', '18А414', 600,  22, 10, TRUE, 'AZE', 'Starting table',   250, '1967-10-12', 13450000, 0.92, NULL, 2, NULL, 2, 8, 8, 2),
(16, 1, 1, 'TP-36', 'OKB-586', '18А415', 640,  22.3, 5, TRUE, 'AZE', 'Starting table',   250, '1967-11-18', 13450000, 0.92, NULL, 2, NULL, 2, 8, 8, 2),
(17, 2, 2, 'TР-36-M', 'OKB-586', '18А416', 430,  23.1, 3, TRUE, 'ARM', 'Starting table',   120, '1990-09-13',  11200000, 0.96, NULL, 3, NULL, 3, 8, 8, 3),
(18, 2, 2, 'TP-36-M', 'OKB-586', '18А417', 424,  30, 2, TRUE, 'ARM', 'Starting table',   120, '1990-08-14', 11200000, 0.96, NULL, 3, NULL, 3, 8, 8, 3),
(19, 2, 2, 'TP-36-М', 'OKB-586', '18А418', 522,  31.2, 1, TRUE, 'ARM', 'Starting table',   120, '1990-12-15', 11200000, 0.96, NULL, 3, NULL, 3, 8, 8, 3),
(20, 2, 2, 'TP-36-M', 'OKB-586', '18А419', 645,  32.6, 5, TRUE, 'ARM', 'Starting table',   120, '1990-02-22', 11200000, 0.96, NULL, 3, NULL, 3, 8, 8, 3),
(21, 2, 2, 'TP-36-M', 'ОКB-586', '18А420', 423,  39, 5, TRUE, 'ARM', 'Starting table',   120, '1990-03-28', 11200000, 0.96, NULL, 3, NULL, 3, 8, 8, 3),
(22, 2, 2, 'TP-36-M', 'ОКB-586', '18А421', 312,  40, 5, TRUE, 'JS', 'Starting table',   120, '1990-11-27', 11200000, 0.96, NULL, 3, NULL, 3, 8, 8, 3),
(23, 2, 2, 'TP-36-M', 'ОКB-586', '18А422', 524,  31, 5, TRUE, 'JS', 'Starting table',   120, '1991-06-13', 11200000, 0.96, NULL, 3, NULL, 3, 8, 8, 3),
(24, 2, 2, 'TP-36-M', 'ОКB-586', '18А423', 423,  31.2, 5, TRUE, 'AZE', 'Starting table',   120, '1991-07-19', 11200000, 0.96, NULL, 3, NULL, 3, 8, 8, 3),
(25, 2, 2, 'TP-36-M', 'ОКB-586', '18А424', 323,  39, 5, TRUE, 'TK', 'Starting table',   120, '1992-02-24', 11200000, 0.96, NULL, 3, NULL, 3, 8, 8, 3),
(26, 2, 2, 'TP-36-M', 'ОКB-586', '18А425', 440,  41, 6, TRUE, 'TK', 'Starting table',   120, '1992-12-13', 11200000, 0.96, NULL, 3, NULL, 3, 8, 8, 3),
(27, 1, 1, 'AIDO-1725', 'ОКB-52', '18А426', 510,  43, 6, TRUE, 'TK', 'Starting table',  180, '1975-04-14', 7560000, 0.94, NULL, 4, NULL, 4, 8, 8, 4),
(28, 1, 1, 'AIDO-1725', 'ОКB-52', '18А427', 340,  44, 6, TRUE, 'TK', 'Starting table',  180, '1975-03-17', 7560000, 0.94, NULL, 4, NULL, 4, 8, 8, 4),
(29, 1, 1, 'AIDO-1725', 'ОКB-52', '18А428', 390,  45, 6, TRUE, 'TK', 'Starting table', 180, '1975-02-13', 7560000, 0.94, NULL, 4, NULL, 4, 8, 8, 4),
(30, 1, 1, 'AIDO-1725', 'ОКB-52', '18А429', 400,  46.2, 6, TRUE, 'USA', 'Starting table',  180, '1975-01-12', 7560000, 0.94, NULL, 4, NULL, 4, 8, 8, 4),
(31, 1, 1, 'AIDO-1725', 'ОКB-52', '18А430', 320,  48, 3, TRUE, 'USA', 'Starting table',  180, '1975-02-18', 7560000, 0.94, NULL, 4, NULL, 4, 8, 8, 4),
(32, 1, 1, 'AIDO-1725', 'ОКB-52', '18А431', 350,  50, 2, TRUE, 'USA', 'Starting table',  180, '1975-09-22', 7560000, 0.94, NULL, 4, NULL, 4, 8, 8, 4),
(33, 1, 1, 'AIDO-1725', 'ОКB-52', '18А432', 380,  80, 1, TRUE, 'UA', 'Starting table',  180, '1976-10-12', 7560000, 0.94, NULL, 4, NULL, 4, 8, 8, 4),
(34, 1, 1, 'AIDO-1725', 'ОКB-52', '18А433', 396,  82, 4, TRUE, 'UA', 'Starting table',  180, '1976-12-16', 7560000, 0.94, NULL, 4, NULL, 4, 8, 8, 4),
(35, 1, 1, 'AIDO-1725', 'ОКB-52', '18А434', 399,  84, 5, TRUE, 'USA', 'Starting table',  180, '1976-05-18', 7560000, 0.94, NULL, 4, NULL, 4, 8, 8, 4),
(36, 1, 1, 'AIDO-1725', 'ОКB-52', '18А435', 410,  85, 5, TRUE, 'UA', 'Starting table',  180, '1976-12-25', 7560000, 0.94, NULL, 4, NULL, 4, 8, 8, 4),
(37, 1, 1, 'AIDO-1725', 'ОКB-52', '18А436', 420,  84, 7, TRUE, 'UA', 'Starting table',  180, '1976-09-12', 7560000, 0.94, NULL, 4, NULL, 4, 8, 8, 4),
(38, 1, 1, 'AIDO-1725', 'ОКB-52', '18А437', 430,  86, 6, TRUE, 'UA', 'Starting table',  180, '1976-11-03', 7560000, 0.94, NULL, 4, NULL, 4, 8, 8, 4),
(39, 1, 1, 'AIDO-1725', 'ОКB-52', '18А438', 640,  31, 5, TRUE, 'UA', 'Starting table',  180, '1976-12-01', 7560000, 0.94, NULL, 4, NULL, 4, 8, 8, 4),
(40, 1, 1, 'AIDO-1725', 'ОКB-52', '18А439', 321,  32, 4, TRUE, 'TK', 'Starting table',  180, '1976-10-09', 7560000, 0.94, NULL, 4, NULL, 4, 8, 8, 4),
(41, 1, 1, 'AIDO-1725-M', 'ОКB-52', '18А440', 420, 90, 3, TRUE, 'TK', 'Starting table',  120, '1995-06-12', 7800000, 0.95, NULL, 5, NULL, 5, 8, 8, 5),
(42, 1, 1, 'AIDO-1725-M', 'ОКB-52', '18А441', 323, 91, 2, TRUE, 'TK', 'Starting table',  120, '1995-04-16', 7800000, 0.95, NULL, 5, NULL, 5, 8, 8, 5),
(43, 1, 1, 'AIDO-1725-M', 'ОКB-52', '18А442', 320, 93, 7, TRUE, 'USA', 'Starting table',  120, '1995-12-18', 7800000, 0.95, NULL, 5, NULL, 5, 8, 8, 5),
(44, 1, 1, 'AIDO-1725-M', 'ОКB-52', '18А443', 0, 0, 0, FALSE, 'USA', 'Starting table',  120, '1995-04-01', 7800000, 0.95, NULL, 5, NULL, 5, 8, 8, 5),
(45, 1, 1, 'AIDO-1725-M', 'ОКB-52', '18А444', 0,  0, 0, FALSE,  'USA', 'Starting table',  120, '1995-10-02', 7800000, 0.95, NULL, 5, NULL, 5, 8, 8, 5),
(46, 1, 1, 'AIDO-1725-M', 'ОКB-52', '18А445', 320,  94, 7, TRUE, 'TK', 'Starting table',  120, '1995-09-08', 7800000, 0.95, NULL, 5, NULL, 5, 8, 8, 5),
(47, 1, 1, 'AIDO-1725-M', 'ОКB-52', '18А446', 280,  31, 4, TRUE, 'TK', 'Starting table',  120, '1995-02-05', 7800000, 0.95, NULL, 5, NULL, 5, 8, 8, 5),
(48, 2, 3, 'CRT-400', 'Space Y', '18А447', 211,  38, 7, TRUE, 'USA', 'Starting table',  70, '2020-04-12', 8350000, 0.96, NULL, 6, NULL, 6, 8, 8, 6),
(49, 2, 3, 'CRT-400', 'Space Y', '18А448', 260,  30, 5, TRUE, 'USA', 'Starting table',  70, '2020-03-08', 8350000, 0.96, NULL, 6, NULL, 6, 8, 8, 6),
(50, 2, 3, 'CRT-400', 'Space Y', '18А449', 290,  31, 5, TRUE, 'AZE', 'Starting table',  70, '2020-02-13', 8350000, 0.96, NULL, 6, NULL, 6, 8, 8, 6),
(51, 2, 3, 'CRT-400', 'Space Y', '18А450', 280,  38, 5, TRUE, 'UK', 'Starting table',  70, '2020-10-19', 8350000, 0.96, NULL, 6, NULL, 6, 8, 8, 6),
(52, 2, 3, 'CRT-400', 'Space Y', '18А451', 300,  36, 5, TRUE, 'UK', 'Starting table',  70, '2021-09-26', 8350000, 0.96, NULL, 6, NULL, 6, 8, 8, 6),
(53, 2, 3, 'CRT-400', 'Space Y', '18А452', 217,  35, 5, TRUE, 'PK', 'Starting table',  70, '2021-07-25', 8350000, 0.96, NULL, 6, NULL, 6, 8, 8, 6),
(54, 2, 3, 'CRT-400', 'Space Y', '18А453', 250,  34, 5, TRUE, 'PK', 'Starting table',  70, '2022-02-19', 8350000, 0.96, NULL, 6, NULL, 6, 8, 8, 6),
(55, 2, 3, 'CRT-400', 'Space Y', '18А454', 230,  31, 5, TRUE, 'USA', 'Starting table',  70, '2022-11-12', 8350000, 0.96, NULL, 6, NULL, 6, 8, 8, 6),
(56, 2, 3, 'CRT-400', 'Space Y', '18А455', 220,  33, 5, TRUE, 'UA', 'Starting table',  70, '2022-12-15', 8350000, 0.96, NULL, 6, NULL, 6, 8, 8, 6),
(57, 7, NULL, 'ISNO-550', 'KBM', '18А456', 230,  32, 6, TRUE, 'UA', 'Starting table',  90, '2008-04-15', 3950000, 0.92, 5, NULL, 5, NULL, 4, NULL, 7),
(58, 7, NULL, 'ISNO-550', 'KBM', '18А457', 243,  34, 6, TRUE, 'US', 'Starting table',  90, '2008-01-17', 3950000, 0.92, 5, NULL, 5, NULL, 4, NULL, 7),
(59, 7, NULL, 'ISNO-550', 'КBM', '18А458', 222,  39, 6, TRUE, 'ES', 'Starting table', 90, '2008-08-27', 3950000, 0.92, 5, NULL, 5, NULL, 4, NULL, 7),
(60, 7, NULL, 'ISNO-550', 'КBM', '18А459', 216,  34, 4, TRUE, 'ES', 'Starting table',  90, '2008-02-20', 3950000, 0.92, 5, NULL, 5, NULL, 4, NULL, 7),
(61, 7, NULL, 'ISNO-550', 'КBM', '18А460', 330,  24, 4, TRUE, 'ES', 'Starting table',  90, '2009-07-19', 3950000, 0.92, 5, NULL, 5, NULL, 4, NULL, 7),
(62, 7, NULL, 'ISNO-550', 'КBM', '18А461', 221,  31.1, 4, TRUE, 'PK', 'Starting table', 90, '2009-09-15', 3950000, 0.92, 5, NULL, 5, NULL, 4, NULL, 7),
(63, 7, NULL, 'ISNO-550', 'КBM', '18А462', 199,  33, 3, TRUE, 'PK', 'Starting table',  90, '2010-08-12', 3950000, 0.92, 5, NULL, 5, NULL, 4, NULL, 7),
(64, 7, NULL, 'ISNO-550', 'КBM', '18А463', 270,  39, 3, TRUE, 'PK', 'Starting table',  90, '2010-09-17', 3950000, 0.92, 5, NULL, 5, NULL, 4, NULL, 7),
(65, 7, NULL, 'ISNO-550', 'КBM', '18А464', 214,  40, 3, TRUE, 'PK', 'Starting table',  90, '2010-02-16', 3950000, 0.92, 5, NULL, 5, NULL, 4, NULL, 7),
(66, 7, NULL, 'ISNO-550', 'КBM', '18А465', 216,  47, 3, TRUE, 'UA', 'Starting table',  90, '2010-03-11', 3950000, 0.92, 5, NULL, 5, NULL, 4, NULL, 7),
(67, 7, NULL, 'ISNO-550', 'КBM', '18А466', 219,  49, 3, TRUE, 'UA', 'Starting table',  90, '2011-10-03', 3950000, 0.92, 5, NULL, 5, NULL, 4, NULL, 7),
(68, 7, NULL, 'ISNO-550', 'КBM', '18А467', 210,  50, 3, TRUE, 'UA', 'Starting table',  90, '2011-12-19', 3950000, 0.92, 5, NULL, 5, NULL, 4, NULL, 7),
(69, 7, NULL, 'ISNO-550', 'КBM', '18А468', 222,  90, 2, TRUE, 'UA', 'Starting table',  90, '2011-11-13', 3950000, 0.92, 5, NULL, 5, NULL, 4, NULL, 7),
(70, 7, NULL, 'ISNO-550', 'КBM', '18А469', 217,  190, 3, TRUE, 'UA', 'Starting table',  90, '2011-05-10', 3950000, 0.92, 5, NULL, 5, NULL, 4, NULL, 7),
(71, 12, NULL, 'XE-6', 'MKB Rainbow', '18А470', 160,  91, 5, TRUE, 'AZE', 'Aviation basing',  150, '1983-12-13', 1200000, 0.8, 1, NULL, 1, NULL, 4, NULL, 8),
(72, 12, NULL, 'XE-6', 'MKB Rainbow', '18А471', 130, 107, 4, TRUE, 'AZE', 'Aviation basing',  150, '1983-05-01', 1200000, 0.8, 1, NULL, 1, NULL, 4, NULL, 8),
(73, 12, NULL, 'XE-6', 'MKB Rainbow', '18А472', 140,  103, 10, TRUE, 'USA', 'Aviation basing',  150, '1983-03-02', 1200000, 0.8, 1, NULL, 1, NULL, 4, NULL, 8),
(74, 12, NULL, 'XE-6', 'MKB Rainbow', '18А473', 160,  109, 11, TRUE, 'ES', 'Aviation basing',  150, '1983-10-05', 1200000, 0.8, 1, NULL, 1, NULL, 4, NULL, 8),
(75, 12, NULL, 'XE-6', 'MKB Rainbow', '18А474', 130,  132, 12, TRUE, 'PK', 'Aviation basing',  150, '1983-11-11', 1200000, 0.8, 1, NULL, 1, NULL, 4, NULL, 8),
(76, 12, NULL, 'XE-6', 'MKB Rainbow', '18А475', 122,  93, 10, TRUE, 'PK', 'Aviation basing', 150, '1983-07-09', 1200000, 0.8, 1, NULL, 1, NULL, 4, NULL, 8),
(77, 12, NULL, 'XE-6', 'MKB Rainbow', '18А476', 143,  94, 5, TRUE, 'PK', 'Aviation basing',  150, '1983-08-04', 1200000, 0.8, 1, NULL, 1, NULL, 4, NULL, 8),
(78, 12, NULL, 'XE-6', 'MKB Rainbow', '18А477', 122,  91, 5, TRUE, 'UA', 'Aviation basing',  150, '1983-04-10', 1200000, 0.8, 1, NULL, 1, NULL, 4, NULL, 8),
(79, 12, NULL, 'XE-6', 'MKB Rainbow', '18А478', 130,  93, 5, TRUE, 'UA', 'Aviation basing',  150, '1983-03-21', 1200000, 0.8, 1, NULL, 1, NULL, 4, NULL, 8),
(80, 12, NULL, 'XE-6', 'MKB Rainbow', '18А479',  121,  95, 5, TRUE, 'ESA', 'Aviation basing',  150, '1983-02-23', 1200000, 0.8, 1, NULL, 1, NULL, 4, NULL, 8),
(81, 12, NULL, 'XE-6', 'MKB Rainbow', '18А480', 132,  94, 5, TRUE, 'UA', 'Aviation basing',  150, '1983-01-23', 1200000, 0.8, 1, NULL, 1, NULL, 4, NULL, 8),
(82, 12, NULL, 'XE-6', 'MKB Rainbow', '18А481', 122,  90, 4, TRUE, 'UA', 'Aviation basing',  150, '1983-10-27', 1200000, 0.8, 1, NULL, 1, NULL, 4, NULL, 8),
(83, 12, NULL, 'XE-6', 'MKB Rainbow', '18А482', 190,  91, 4, TRUE, 'UA', 'Aviation basing',  150, '1983-11-20', 1200000, 0.8, 1, NULL, 1, NULL, 4, NULL, 8),
(84, 12, NULL, 'XE-6', 'MKB Rainbow', '18А483', 130,  92, 2, TRUE, 'USA', 'Aviation basing',  150, '1983-12-17', 1200000, 0.8, 1, NULL, 1, NULL, 4, NULL, 8),
(85, 11, NULL, 'XE-9', 'MKB Rainbow', '18А484', 150,  93, 2, TRUE, 'EA', 'Aviation basing',  140, '1990-11-22', 1340000, 0.85, 2, NULL, 2, NULL, 4, NULL, 9),
(86, 11, NULL, 'XE-9', 'MKB Rainbow', '18А485', 155,  94, 1, TRUE, 'UA', 'Aviation basing',  140, '1990-09-27', 1340000, 0.85, 2, NULL, 2, NULL, 4, NULL, 9),
(87, 11, NULL, 'XE-9', 'MKB Rainbow', '18А486', 156,  95, 5, TRUE, 'UA', 'Aviation basing',  140, '1990-04-24', 1340000, 0.85, 2, NULL, 2, NULL, 4, NULL, 9),
(88, 11, NULL, 'XE-9', 'MKB Rainbow', '18А487', 140,  96, 5, TRUE, 'UA', 'Aviation basing',  140, '1990-02-13', 1340000, 0.85, 2, NULL, 2, NULL, 4, NULL, 9),
(89, 11, NULL, 'XE-9', 'MKB Rainbow', '18А488', 120,  97, 5, TRUE, 'UA', 'Aviation basing',  140, '1991-06-05', 1340000, 0.85, 2, NULL, 2, NULL, 4, NULL, 9),
(90, 11, NULL, 'XE-9', 'MKB Rainbow', '18А489', 121,  98, 4, TRUE, 'UA', 'Aviation basing',  140, '1991-09-14', 1340000, 0.85, 2, NULL, 2, NULL, 4, NULL, 9),
(91, 11, NULL, 'XE-9', 'MKB Rainbow', '18А490', 122,  99, 7, TRUE, 'ARM', 'Aviation basing',  140, '1991-11-15', 1340000, 0.85, 2, NULL, 2, NULL, 4, NULL, 9),
(92, 11, NULL, 'XE-9', 'MKB Rainbow', '18А491', 123,  100, 7, TRUE, 'ARM', 'Aviation basing',  140, '1992-07-17', 1340000, 0.85, 2, NULL, 2, NULL, 4, NULL, 9),
(93, 11, NULL, 'XE-9', 'MKB Rainbow', '18А492', 145,  101, 7, TRUE, 'GA', 'Aviation basing',  140, '1992-02-11', 1340000, 0.85, 2, NULL, 2, NULL, 4, NULL, 9),
(94, 11, NULL, 'XE-9', 'MKB Rainbow', '18А493', 190,  40, 7, TRUE, 'GA', 'Aviation basing',  140, '1992-01-19', 340000, 0.85, 2, NULL, 2, NULL, 4, NULL, 9),
(95, 11, NULL, 'XE-14', 'MKB Rainbow', '18А494', 200,  41, 7, TRUE, 'GA', 'Aviation basing',  110, '2005-12-31', 1100000, 0.88, 3, NULL, 3, NULL, 11, NULL, 10),
(96, 11, NULL, 'XE-14', 'MKB Rainbow', '18А495', 180,  42, 7, TRUE, 'GA', 'Aviation basing',  110, '2005-04-12', 1100000, 0.88, 3, NULL, 3, NULL, 11, NULL, 10),
(97, 11, NULL, 'XE-14', 'MKB Rainbow', '18А496', 183,  43, 7, TRUE, 'GA', 'Aviation basing',  110, '2005-03-18', 1100000, 0.88, 3, NULL, 3, NULL, 11, NULL, 10),
(98, 11, NULL, 'XE-14', 'MKB Rainbow', '18А497', 189,  44, 7, TRUE, 'GA', 'Aviation basing',  110, '2005-09-12', 1100000, 0.88, 3, NULL, 3, NULL, 11, NULL, 10),
(99, 11, NULL, 'XE-14', 'MKB Rainbow', '18А498', 135,  45, 7, TRUE, 'UA', 'Aviation basing',  110, '2005-08-16', 1100000, 0.88, 3, NULL, 3, NULL, 11, NULL, 10),
(100, 11, NULL, 'XE-14', 'MKB Rainbow', '18А499', 122,  46, 5, TRUE, 'UA', 'Aviation basing',  110, '2006-01-19', 1100000, 0.88, 3, NULL, 3, NULL, 11, NULL, 10),
(101, 11, NULL, 'XE-14', 'MKB Rainbow', '18А500', 132,  47, 5, TRUE, 'UA', 'Aviation basing',  110, '2006-02-27', 1100000, 0.88, 3, NULL, 3, NULL, 11, NULL, 10),
(102, 11, NULL, 'XE-14', 'MKB Rainbow', '18А501', 190,  48, 5, TRUE, 'USA', 'Aviation basing',  110, '2006-04-15', 1100000, 0.88, 3, NULL, 3, NULL, 11, NULL, 10),
(103, 11, NULL, 'XE-14', 'MKB Rainbow', '18А502', 132, 49, 5, TRUE, 'UA', 'Aviation basing',  110, '2006-06-19', 1100000, 0.88, 3, NULL, 3, NULL, 11, NULL, 10),
(104, 11, NULL, 'XE-14', 'MKB Rainbow', '18А503', 124,  50, 7, TRUE, 'UA', 'Aviation basing',  110, '2006-09-20', 1100000, 0.88, 3, NULL, 3, NULL, 11, NULL, 10),
(105, 24, 24, 'PR-88', 'ОКB-34', '18А504', 250,  51, 5, TRUE, 'UK', 'Starting table',  130, '1998-04-15', 13500000, 0.94, NULL, 7, NULL, 7, 17, 17, 11),
(106, 24, 24, 'PR-88', 'ОКB-34', '18А505', 290,  52, 5, TRUE, 'UK', 'Starting table',  130, '1998-05-19', 13500000, 0.94, NULL, 7, NULL, 7, 17, 17, 11),
(107, 24, 24, 'PR-88', 'ОКB-34', '18А506', 280,  53, 5, TRUE, 'USA', 'Starting table',  130, '1998-08-20', 13500000, 0.94, NULL, 7, NULL, 7, 17, 17, 11),
(108, 24, 24, 'PR-88', 'ОКB-34', '18А507', 320,  54, 5, TRUE, 'AZE', 'Starting table',  130, '1998-02-27', 13500000, 0.94, NULL, 7, NULL, 7, 17, 17, 11),
(109, 24, 24, 'PR-88', 'ОКB-34', '18А508', 210,  55, 3, TRUE, 'PK', 'Starting table',  130, '1998-01-29', 13500000, 0.94, NULL, 7, NULL, 7, 17, 17, 11),
(110, 24, 24, 'PR-88', 'ОКB-34', '18А509', 300,  56, 4, TRUE, 'PK', 'Starting table',  130, '1998-11-12', 13500000, 0.94, NULL, 7, NULL, 7, 17, 17, 11),
(111, 24, 24, 'PR-88', 'ОКB-34', '18А510', 315,  57, 7, TRUE, 'PK', 'Starting table',  130, '1999-10-16', 13500000, 0.94, NULL, 7, NULL, 7, 17, 17, 11),
(112, 24, 24, 'PR-88-M', 'ОКB-34', '18А511', 320,  58, 8, TRUE, 'PK', 'Starting table',  110, '2005-10-20', 12400000, 0.95, NULL, 8, NULL, 8, 17, 17, 12),
(113, 24, 24, 'PR-88-M', 'ОКB-34', '18А512', 322,  59, 8, TRUE, 'UA', 'Starting table',  110, '2005-11-26', 12400000, 0.95, NULL, 8, NULL, 8, 17, 17, 12),
(114, 24, 24, 'PR-88-M', 'ОКB-34', '18А513', 340,  60, 8, TRUE, 'UA', 'Starting table',  110, '2005-05-13', 12400000, 0.95, NULL, 8, NULL, 8, 17, 17, 12),
(115, 24, 24, 'PR-88-M', 'ОКB-34', '18А514', 350,  61, 7, TRUE, 'UA', 'Starting table',  110, '2006-03-20', 12400000, 0.95, NULL, 8, NULL, 8, 17, 17, 12),
(116, 24, 24, 'PR-88-M', 'ОКB-34', '18А515', 330,  62, 6, TRUE, 'USA', 'Starting table',  110, '2006-02-17', 12400000, 0.95, NULL, 8, NULL, 8, 17, 17, 12),
(117, 24, 24, 'PR-88-M', 'ОКB-34', '18А516', 350,  62, 8, TRUE, 'UA', 'Starting table',  110, '2006-08-04', 12400000, 0.95, NULL, 8, NULL, 8, 17, 17, 12),
(118, 12, NULL, 'U-120', 'NPO', '18А517', 360,  62, 5, TRUE, 'AZE', 'Sea basing',   135, '1972-03-20', 1150000, 0.91, 6, NULL, 6, NULL, 5, NULL, 13),
(119, 12, NULL, 'U-120', 'NPO', '18А518', 366,  62, 5, TRUE, 'ARM', 'Sea basing',   135, '1973-10-25', 1150000, 0.91, 6, NULL, 6, NULL, 5, NULL, 13),
(120, 12, NULL, 'U-120', 'NPO', '18А519', 370,  130, 4, TRUE, 'ARM', 'Sea basing',   135, '1973-11-09', 1150000, 0.91, 6, NULL, 6, NULL, 5, NULL, 13),
(121, 12, NULL, 'U-120', 'NPO', '18А520', 375,  131, 4, TRUE, 'ARM', 'Sea basing',   135, '1973-09-12', 1150000, 0.91, 6, NULL, 6, NULL, 5, NULL, 13),
(122, 16, NULL, 'U-700', 'NPO', '18А521', 380,  132, 4, TRUE, 'ARM', 'Sea basing',  120, '1993-06-11', 1200000, 0.92, 7, NULL, 7, NULL, 5, NULL, 14),
(123, 16, NULL, 'U-700', 'NPO', '18А522', 388,  133, 7, TRUE, 'UA', 'Sea basing',  120, '1993-07-12', 1200000, 0.92, 7, NULL, 7, NULL, 5, NULL, 14),
(124, 16, NULL, 'U-700', 'NPO', '18А523', 390,  160, 7, TRUE, 'UA', 'Sea basing',  120, '1993-03-15', 1200000, 0.92, 7, NULL, 7, NULL, 5, NULL, 14),
(125, 16, NULL, 'U-700', 'NPO', '18А524', 395,  91, 7, TRUE, 'OS', 'Sea basing',  120, '1993-02-20', 1200000, 0.92, 7, NULL, 7, NULL, 5, NULL, 14),
(126, 16, NULL, 'U-700', 'NPO', '18А525', 396, 92, 6, TRUE, 'OS', 'Sea basing',  120, '1993-10-21', 1200000, 0.92, 7, NULL, 7, NULL, 5, NULL, 14),
(127, 16, NULL, 'U-700', 'NPO', '18А526', 320,  90, 6, TRUE, 'OS', 'Sea basing',  120, '1993-12-30', 1200000, 0.92, 7, NULL, 7, NULL, 5, NULL, 14),
(128, 16, 18, 'U-1000', 'NPO', '18А527', 300,  94, 4, TRUE, 'OS', 'Sea basing',  110, '2008-10-10', 1340000, 0.97, NULL, 11, NULL, 11, 5, 5, 15),
(129, 16, 18, 'U-1000', 'NPO', '18А528', 305,  95, 5, TRUE, 'TL', 'Sea basing',  110, '2008-11-15', 1340000, 0.97, NULL, 11, NULL, 11, 5, 5, 15),
(130, 16, 18, 'U-1000', 'NPO', '18А529', 310,  96, 6, TRUE, 'TL', 'Sea basing',  110, '2008-04-20', 1340000, 0.97, NULL, 11, NULL, 11, 5, 5, 15),
(131, 16, 18, 'U-1000', 'NPO', '18А530', 315,  97, 6, TRUE, 'TL', 'Sea basing',  110, '2008-02-17', 1340000, 0.97, NULL, 11, NULL, 11, 5, 5, 15),
(132, 16, 18, 'U-1000', 'NPO', '18А531', 320,  97, 7, TRUE, 'TL', 'Sea basing',  110, '2009-12-19', 1340000, 0.97, NULL, 11, NULL, 11, 5, 5, 15),
(133, 16, 18, 'U-1000', 'NPO', '18А532', 325,  90, 3, TRUE, 'TL', 'Sea basing',  110, '2009-05-11', 1340000, 0.97, NULL, 11, NULL, 11, 5, 5, 15),
(134, 16, 18, 'U-1000', 'NPO', '18А533', 330,  94, 8, TRUE, '', 'Sea basing',  110, '2009-07-14', 1340000, 0.97, NULL, 11, NULL, 11, 5, 5, 15),
(135, 6, 6, 'CRK-7', 'NPO', '18А534', 340,  80, 5, TRUE, 'USA', 'Sea basing',  90, '2019-05-12', 1500000, 0.98, NULL, 10, NULL, 10, 5, 5, 16), 
(136, 6, 6, 'CRK-7', 'NPO', '18А535', 350,  82, 8, TRUE, 'UA', 'Sea basing',  90, '2019-05-12', 1500000, 0.98, NULL, 10, NULL, 10, 5, 5, 16), 
(137, 6, 6, 'CRK-7', 'NPO', '18А536', 360,  81, 7, TRUE, 'UK', 'Sea basing',  90, '2019-05-12', 1500000, 0.98, NULL, 10, NULL, 10, 5, 5, 16), 
(138, 6, 6, 'CRK-7', 'NPO', '18А537', 370,  50, 6, TRUE, 'UK', 'Sea basing',  90, '2019-05-12', 1500000, 0.98, NULL, 10, NULL, 10, 5, 5, 16),
(139, 6, 6, 'CRK-7', 'NPO', '18А538', 375,  60, 5, TRUE, 'UK', 'Sea basing',  90, '2019-05-12', 1500000, 0.98, NULL, 10, NULL, 10, 5, 5, 16), 
(140, 6, 6, 'CRK-7', 'NPO', '18А539', 380,  90, 8, TRUE, , 'Sea basing',  90, '2019-05-12', 1500000, 0.98, NULL, 10, NULL, 10, 5, 5, 16), 
(141, 27, NULL, 'KLF-486', 'OKB New technologies', '18А540', 270,  180, 6, TRUE, 'UK', 'Sea basing',  94, '2005-04-16', 1200000, 0.94, 4, NULL, 4, NULL, 18, NULL, 17),
(142, 27, NULL, 'KLF-486', 'OKB New technologies', '18А541', 275,  160, 6, TRUE, 'ARM', 'Sea basing',  94, '2005-09-14', 1200000, 0.94, 4, NULL, 4, NULL, 18, NULL, 17),
(143, 27, NULL, 'KLF-486', 'OKB New technologies', '18А542', 278,  150, 4, TRUE, 'AZE', 'Sea basing',  94, '2006-06-19', 1200000, 0.94, 4, NULL, 4, NULL, 18, NULL, 17),
(144, 27, NULL, 'KLF-486', 'OKB New technologies', '18А543', 281,  140, 4, TRUE, 'TL', 'Sea basing',  94, '2006-09-08', 1200000, 0.94, 4, NULL, 4, NULL, 18, NULL, 17),
(145, 27, NULL, 'KLF-486', 'OKB New technologies', '18А544', 284,  135, 8, TRUE, 'UK', 'Sea basing',  94, '2006-10-09', 1200000, 0.94, 4, NULL, 4, NULL, 18, NULL, 17),
(146, 27, NULL, 'KLF-486', 'OKB New technologies', '18А545', 285,  130, 7, TRUE, 'USA', 'Sea basing',  94, '2006-11-13', 1200000, 0.94, 4, NULL, 4, NULL, 18, NULL, 17),
(147, 27, NULL, 'KLF-486', 'OKB New technologies', '18А546', 288,  125, 6, TRUE, 'USA', 'Sea basing',  94, '2006-12-25', 1200000, 0.94, 4, NULL, 4, NULL, 18, NULL, 17),
(148, 27, NULL, 'KLF-486', 'OKB New technologies', '18А547', 300,  120, 8, TRUE, 'USA', 'Sea basing',  94, '2006-02-20', 1200000, 0.94, 4, NULL, 4, NULL, 18, NULL, 17),
(149, 27, NULL, 'BST-321', 'NPO', '18А548', 200,  100, 5, TRUE, 'UK', 'Starting table',  110, '2010-04-05', 1250000, 0.94, 8, NULL, 8, NULL, 18, NULL, 18),
(150, 27, NULL, 'BST-321', 'NPO', '18А549', 205,  101, 5, TRUE, 'UK', 'Starting table',  110, '2011-04-21', 1250000, 0.94, 8, NULL, 8, NULL, 18, NULL, 18),
(151, 27, NULL, 'BST-321', 'NPO', '18А550', 210,  102, 4, TRUE, 'UK', 'Starting table',  110, '2010-06-19', 1250000, 0.94, 8, NULL, 8, NULL, 18, NULL, 18),
(152, 27, NULL, 'BST-321', 'NPO', '18А551', 200,  103, 4, TRUE, 'UK', 'Starting table',  110, '2010-08-14', 1250000, 0.94, 8, NULL, 8, NULL, 18, NULL, 18),
(153, 27, NULL, 'BST-321', 'NPO', '18А552', 200,  104, 3, TRUE, 'USA', 'Starting table',  110, '2011-10-15', 1250000, 0.94, 8, NULL, 8, NULL, 18, NULL, 18),
(154, 27, NULL, 'BST-321', 'NPO', '18А553', 216,  105, 3, TRUE, 'UA', 'Starting table',  110, '2011-11-25', 1250000, 0.94, 8, NULL, 8, NULL, 18, NULL, 18),
(155, 23, 23, 'PIO-780', 'ОКB-34', '18А554', 320,  106, 3, TRUE, 'UA', 'Starting table',  140, '1976-03-27', 12300000, 0.93, NULL, 9, NULL, 9, 17, 17, 19),
(156, 23, 23, 'PIO-780', 'ОКB-34', '18А555', 325,  107, 3, TRUE, 'UK', 'Starting table',  140, '1976-08-23', 12300000, 0.93, NULL, 9, NULL, 9, 17, 17, 19),
(157, 23, 23, 'PIO-780', 'ОКB-34', '18А556', 330,  108, 2, TRUE, 'UK', 'Starting table',  140, '1976-09-20', 12300000, 0.93, NULL, 9, NULL, 9, 17, 17, 19),
(158, 23, 23, 'PIO-780', 'ОКB-34', '18А557', 332,  109, 2, TRUE, 'USA', 'Starting table',  140, '1976-12-26', 12300000, 0.93, NULL, 9, NULL, 9, 17, 17, 19),
(159, 23, 23, 'PIO-780', 'ОКB-34', '18А558', 335,  110, 6, TRUE, 'TL', 'Starting table',  140, '1976-04-19', 12300000, 0.93, NULL, 9, NULL, 9, 17, 17, 19),
(160, 23, 23, 'PIO-780', 'ОКB-34', '18А559', 340,  111, 7, TRUE, 'UA', 'Starting table',  140, '1976-02-10', 12300000, 0.93, NULL, 9, NULL, 9, 17, 17, 19);


-- Закончили 
DELETE FROM Other_rocket_parameters;
INSERT Other_rocket_parameters(id, name, stage_count, block_count, guidance_system, trajectory_control, BCVM, rocket_status)
VALUES
(1, 'TP-16', 2, 2, 'Electric guidance', 'Rigid trajectory', FALSE, 'The rocket is not in operation'),
(2, 'TP-36', 2, 2, 'Electric guidance', 'Flexible trajectory', FALSE, 'The rocket is not in operation'),
(3, 'TР-36-M', 2, 2, 'Inertial guidance', 'Flexible trajectory', TRUE, 'The rocket is being operated'),
(4, 'AIDO-1725', 2, 2,  'Electric guidance', 'Flexible trajectory', TRUE, 'The rocket is not in operation'),
(5, 'AIDO-1725-M', 2, 2,  'Electric guidance', 'Flexible trajectory', TRUE, 'The rocket is being operated'),
(6, 'CRT-400', 2, 2,  'Inertial guidance', 'Flexible trajectory', TRUE, 'The rocket is being operated'),
(7, 'ISNO-550', 1, 1,  ' Inertial guidance', 'Flexible trajectory', TRUE, 'The rocket is being operated'),
(8, 'XE-6', 1, 1,  'Beam guidance', 'Rigid trajectory', FALSE, 'The rocket is not in operation'),
(9, 'XE-9', 1, 1,  'Inertial guidance', 'Flexible trajectory', FALSE, 'The rocket is not in operation'),
(10, 'XE-14', 1, 1,  'Laser guidance', 'Flexible trajectory', TRUE, 'The rocket is being operated'),
(11, 'PR-88', 2, 2,  'Inertial guidance', 'Flexible trajectory', TRUE, 'The rocket is not in operation'),
(12, 'PR-88-M', 2, 2, 'Inertial guidance', 'Flexible trajectory', TRUE, 'The rocket is being operated'),
(13, 'U-120', 1, 1, 'Inertial guidance', 'Flexible trajectory', FALSE, 'The rocket is not in operation'),
(14, 'U-700', 1, 1, 'Inertial guidance', 'Flexible trajectory', TRUE, 'The rocket is being operated'),
(15, 'U-1000', 2, 2, 'Laser guidance', 'Flexible trajectory', TRUE, 'The rocket is being operated'),
(16, 'CRK-7', 2, 2, 'Laser guidance', 'Flexible trajectory', TRUE, 'The rocket is being operated'),
(17, 'KLF-486', 1, 1, 'Inertial guidance', 'Flexible trajectory', TRUE, 'The rocket is being operated'),
(18, 'BST-321', 1, 1, 'Inertial guidance', 'Flexible trajectory', TRUE, 'The rocket is being operated'),
(19, 'PIO-780', 2, 2, 'Inertial guidance', 'Flexible trajectory', TRUE, 'The rocket is not in operation');



DELETE FROM Static_tests;

INSERT Static_tests(id_static_t, name, t1_static_test, t2_static_test, static_test_result, static_strength, n_static) VALUES
(1, 'TP-16', '1960-04-02', '1960-05-02', 'Static tests were successful', TRUE, 12),
(2, 'TP-36', '1965-03-12', '1965-03-19', 'Static tests were successful', TRUE, 17),
(3, 'TP-36-M', '1985-04-12', '1985-04-20', 'Static tests were successful', TRUE, 20),
(4, 'AIDO-1725', '1974-02-19', '1974-03-01', 'Static tests were successful', TRUE, 35), 
(5, 'AIDO-1725-M', '1990-07-12', '1990-07-29', 'Static tests were successful', TRUE, 35),
(6, 'CRT-400', '2010-05-12', '2010-05-28', 'Static tests were successful', TRUE, 68),
(7, 'ISNO-550', '2005-08-12', '2005-08-24', 'Static tests were successful', TRUE, 75),
(8, 'XE-6', '1980-03-12', '1980-03-20', 'Static tests were successful', TRUE, 400),
(9, 'XE-9', '1984-03-18', '1984-03-27', 'Static tests were successful', TRUE, 900),
(10, 'XE-14', '2000-05-19', '2000-05-30', 'Static tests were successful', TRUE, 570),
(11, 'PR-88', '1995-04-12', '1995-04-20', 'Static tests were successful',  TRUE, 10),
(12, 'PR-88-M', '2000-10-10', '2000-10-25', 'Static tests were successful', TRUE, 9),
(13, 'U-120', '1970-03-12', '1970-03-18', 'Static tests were successful', TRUE, 650),
(14, 'U-700', '1990-01-17', '1990-01-28', 'Static tests were successful', TRUE, 750),
(15, 'U-1000', '2005-01-20', '2005-01-26', 'Static tests were successful', TRUE, 930),
(16, 'CRK-7', '2015-02-19', '2015-02-26', 'Static tests were successful', TRUE, 998),
(17, 'KLF-486', '2000-01-10', '2000-01-28', 'Static tests were successful', TRUE, 930),
(18, 'BST-321', '2000-05-12', '2000-05-19', 'Static tests were successful', TRUE, 842),
(19, 'PIO-780', '1970-02-16', '1970-03-10', 'Static tests were successful', TRUE, 948);




DELETE FROM Vibration_tests;

INSERT Vibration_tests(id_vibration_t, name, t1_vibration_test, t2_vibration_test, vibration_test_result, n_amplitude_t, n_resonance_frequency)
VALUES
(1, 'TP-16', '1960-07-01', '1960-07-02', 'Vibration tests were successful', 1600, 30),
(2, 'TP-36', '1965-04-19', '1965-04-19', 'Vibration tests were successful', 1873, 48),
(3, 'TP-36-M', '1985-05-18', '1985-05-18', 'Vibration tests were successful', 431, 62),
(4, 'AIDO-1725', '1974-08-01', '1974-08-03', 'Vibration tests were successful', 741, 19), 
(5, 'AIDO-1725-M', '1990-01-10', '1990-01-10', 'Vibration tests were successful', 851, 9),
(6, 'CRT-400', '2010-05-10', '2010-05-14', 'Vibration tests were successful', 1582, 532),
(7, 'ISNO-550', '2005-03-04', '2005-03-04', 'Vibration tests were successful', 653, 931),
(8, 'XE-6', '1980-09-04', '1980-09-06', 'Vibration tests were successful', 390, 440),
(9, 'XE-9', '1984-02-19', '1984-02-19', 'Vibration tests were successful', 548, 841),
(10, 'XE-14', '2000-03-11', '2000-03-12', 'Vibration tests were successful', 469, 952),
(11, 'PR-88', '1995-07-15', '1995-07-18', 'Vibration tests were successful',  569, 101),
(12, 'PR-88-M', '2000-12-10', '2000-12-15', 'Vibration tests were successful', 617, 90),
(13, 'U-120', '1970-09-14', '1970-09-16', 'Vibration tests were successful', 952, 641),
(14, 'U-700', '1990-02-18', '1990-02-20', 'Vibration tests were successful', 743, 792),
(15, 'U-1000', '2005-07-20', '2005-07-23', 'Vibration tests were successful', 341, 821),
(16, 'CRK-7', '2015-08-21', '2015-08-23', 'Vibration tests were successful', 903, 481),
(17, 'KLF-486', '2000-04-15', '2000-04-17', 'Vibration tests were successful', 140, 650),
(18, 'BST-321', '2000-07-19', '2000-07-21', 'Vibration tests were successful', 428, 785),
(19, 'PIO-780', '1970-02-18', '1970-02-20', 'Vibration tests were successful', 844, 948);



DELETE FROM Shock_tests;

INSERT Shock_tests(id_shock_t, name, t1_shock_test, t2_shock_test, shock_test_result, normal_shock)
VALUES 
(1, 'TP-16', '1960-03-01', '1960-03-02', 'The shock tests were successful', 16000),
(2, 'TP-36', '1964-10-21', '1964-10-23', 'The shock tests were successful', 18473),
(3, 'TP-36-M', '1985-04-14', '1985-04-15', 'The shock tests were successful', 5311),
(4, 'AIDO-1725', '1974-03-07', '1974-03-08', 'The shock tests were successful', 7410), 
(5, 'AIDO-1725-M', '1990-08-13', '1990-08-13', 'The shock tests were successful', 8515),
(6, 'CRT-400', '2010-10-13', '2010-10-15', 'The shock tests were successful', 7587),
(7, 'ISNO-550', '2005-09-17', '2005-09-18', 'The shock tests were successful', 4273),
(8, 'XE-6', '1980-11-03', '1980-11-05', 'The shock tests were successful', 4694),
(9, 'XE-9', '1984-10-21', '1984-10-24', 'The shock tests were successful', 1289),
(10, 'XE-14', '2000-05-12', '2000-05-14', 'The shock tests were successful', 4649),
(11, 'PR-88', '1995-03-17', '1995-03-18', 'The shock tests were successful',  10431),
(12, 'PR-88-M', '2000-01-13', '2000-01-14', 'The shock tests were successful', 8649),
(13, 'U-120', '1970-10-14', '1970-10-15', 'The shock tests were successful', 9361),
(14, 'U-700', '1990-11-19', '1990-11-20', 'The shock tests were successful', 8694),
(15, 'U-1000', '2005-03-24', '2005-04-26', 'The shock tests were successful', 8572),
(16, 'CRK-7', '2015-09-25', '2015-09-27', 'The shock tests were successful', 9673),
(17, 'KLF-486', '2000-07-13', '2000-07-15', 'The shock tests were successful', 8534),
(18, 'BST-321', '2000-02-11', '2000-02-13', 'The shock tests were successful', 9565),
(19, 'PIO-780', '1970-07-14', '1970-07-26', 'The shock tests were successful',  3452);



DELETE FROM  Acoustic_tests;

INSERT Acoustic_tests(id_acoustic_t, name, t1_acoustic_test, t2_acoustic_test, acoustic_test_result, normal_acoustic_P)
VALUES
(1, 'TP-16', '1960-01-06', '1960-01-08', 'Acoustic tests were successful', 563),
(2, 'TP-36', '1964-09-25', '1964-09-25', 'Acoustic tests were successful', 582),
(3, 'TP-36-M', '1984-12-14', '1984-12-15', 'Acoustic tests were successful', 582),
(4, 'AIDO-1725', '1973-08-15', '1973-08-15', 'Acoustic tests were successful', 652), 
(5, 'AIDO-1725-M', '1991-04-12', '1991-04-15', 'Acoustic tests were successful', 602),
(6, 'CRT-400', '2011-11-13', '2011-11-15', 'Acoustic tests were successful', 600),
(7, 'ISNO-550', '2004-03-13', '2004-03-13', 'Acoustic tests were successful', 591),
(8, 'XE-6', '1981-12-04', '1981-12-06', 'Acoustic tests were successful', 563),
(9, 'XE-9', '1984-11-24', '1984-11-27', 'Acoustic tests were successful', 654),
(10, 'XE-14', '2001-08-15', '2001-08-17', 'Acoustic tests were successful', 531),
(11, 'PR-88', '1995-07-12', '1995-07-15', 'Acoustic tests were successful',  642),
(12, 'PR-88-M', '2000-04-17', '2000-04-19', 'Acoustic tests were successful', 564),
(13, 'U-120', '1970-03-15', '1970-03-17', 'Acoustic tests were successful', 453),
(14, 'U-700', '1990-05-12', '1990-05-14', 'Acoustic tests were successful', 642),
(15, 'U-1000', '2005-09-26', '2005-09-28', 'Acoustic tests were successful', 583),
(16, 'CRK-7', '2014-02-27', '2015-02-28', 'Acoustic tests were successful', 594),
(17, 'KLF-486', '2000-02-15', '2000-02-17', 'Acoustic tests were successful', 583),
(18, 'BST-321', '2000-08-12', '2000-08-14', 'Acoustic tests were successful', 653),
(19, 'PIO-780', '1970-04-12', '1970-04-15', 'Acoustic tests were successful',  685);


DELETE FROM Transport_tests;

INSERT Transport_tests(id_transport_t, name, t1_transport_test, t2_transport_test, transport_test_result, types_of_transport, normal_v)
VALUES
(1, 'TP-16', '1959-04-02', '1959-04-12', 'The transport tests were successful', 'Railway transport', 1965),
(2, 'TP-36', '1964-07-23', '1964-07-30', 'The transport tests were successful', 'Railway transport', 2488),
(3, 'TP-36-M', '1983-11-12', '1983-11-17', 'The transport tests were successful', 'Railway transport', 1885),
(4, 'AIDO-1725', '1973-03-12', '1973-03-20', 'The transport tests were successful', 'Railway transport', 2358), 
(5, 'AIDO-1725-M', '1991-07-12', '1991-07-20', 'The transport tests were successful', 'Railway transport', 1321),
(6, 'CRT-400', '2011-12-10', '2011-12-20', 'The transport tests were successful', 'Railway transport', 2521),
(7, 'ISNO-550', '2004-02-11', '2004-02-23', 'The transport tests were successful', 'Road transport', 2398),
(8, 'XE-6', '1980-12-10', '1980-12-10', 'The transport tests were successful', 'Road transport', 2461),
(9, 'XE-9', '1986-12-20', '1984-12-30', 'The transport tests were successful', 'Road transport', 1774),
(10, 'XE-14', '2000-02-12', '2000-02-19', 'The transport tests were successful', 'Road transport', 2346),
(11, 'PR-88', '1994-12-17', '1995-12-30', 'The transport tests were successful', 'Road transport',  1760),
(12, 'PR-88-M', '2002-03-10', '2002-03-25', 'The transport tests were successful', 'Road transport', 2352),
(13, 'U-120', '1970-02-10', '1970-02-20', 'The transport tests were successful', 'Water transport', 2653),
(14, 'U-700', '1990-08-12', '1990-08-26', 'The transport tests were successful', 'Water transport', 4642),
(15, 'U-1000', '2005-04-10', '2005-04-28', 'The transport tests were successful', 'Water transport', 2783),
(16, 'CRK-7', '2013-01-03', '2015-01-23', 'The transport tests were successful', 'Water transport', 1596),
(17, 'KLF-486', '2000-01-04', '2000-01-15', 'The transport tests were successful', 'Water transport', 1583),
(18, 'BST-321', '2000-03-06', '2000-03-26', 'The transport tests were successful', 'Water transport', 3250),
(19, 'PIO-780', '1969-01-04', '1969-01-20', 'The transport tests were successful', 'Railway transport',  1850);




DELETE FROM Climate_tests;

INSERT Climate_tests(id_climate_t, name, t1_climate_test, t2_climate_test, climate_test_result, normal_positive_temperature, normal_negative_temperature)
VALUES
(1, 'TP-16', '1960-02-15', '1960-02-15', 'The climate tests were successful',  60, -60),
(2, 'TP-36', '1964-07-23', '1964-07-30', 'The climate tests were successful',  60, -60),
(3, 'TP-36-M', '1983-04-15', '1983-04-20', 'The climate tests were successful',  60, -60),
(4, 'AIDO-1725', '1973-07-03', '1973-07-03', 'The climate tests were successful',  65, -65), 
(5, 'AIDO-1725-M', '1991-06-10', '1991-06-10', 'The climate tests were successful',  67, -67),
(6, 'CRT-400', '2011-04-12', '2011-04-12', 'The climate tests were successful',  69, -69),
(7, 'ISNO-550', '2004-03-14', '2004-03-14', 'The climate tests were successful',  60, -60),
(8, 'XE-6', '1980-12-15', '1980-12-15', 'The climate tests were successful',  66, -66),
(9, 'XE-9', '1983-11-10', '1983-11-10', 'The climate tests were successful',  60, -60),
(10, 'XE-14', '2000-08-18', '2000-08-18', 'The climate tests were successful',  66, -66),
(11, 'PR-88', '1994-06-12', '1995-06-12', 'The climate tests were successful',   60, -60),
(12, 'PR-88-M', '2002-08-13', '2002-08-13', 'The climate tests were successful',  70, -70),
(13, 'U-120', '1970-02-12', '1970-02-12', 'The climate tests were successful',  60, -60),
(14, 'U-700', '1990-03-07', '1990-03-10', 'The climate tests were successful',  65, -65),
(15, 'U-1000', '2005-06-15', '2005-06-15', 'The climate tests were successful',  67, -67),
(16, 'CRK-7', '2013-04-02', '2015-04-02', 'The climate tests were successful',  70, -70),
(17, 'KLF-486', '1999-03-02', '2000-03-02', 'The climate tests were successful',  69, -69),
(18, 'BST-321', '2000-10-14', '2000-10-14', 'The climate tests were successful',  70, -70),
(19, 'PIO-780', '1970-02-01', '1970-02-01', 'The climate tests were successful',  75, -75);



DELETE FROM EMC_tests;

INSERT EMC_tests(id_EMC_t, name, t1_EMC, t2_EMC, EMC_test_result)
VALUES
(1, 'TP-16', '1960-05-12', '1960-05-14', 'The EMC tests were successful'),
(2, 'TP-36', '1964-08-22', '1964-08-24', 'The EMC tests were successful'),
(3, 'TP-36-M', '1983-01-12', '1983-01-14', 'The EMC tests were successful'),
(4, 'AIDO-1725', '1973-11-04', '1973-11-06', 'The EMC tests were successful'), 
(5, 'AIDO-1725-M', '1991-10-10', '1991-10-12', 'The EMC tests were successful'),
(6, 'CRT-400', '2011-07-18', '2011-07-20', 'The EMC tests were successful'),
(7, 'ISNO-550', '2004-02-16', '2004-02-18', 'The EMC tests were successful'),
(8, 'XE-6', '1980-11-15', '1980-11-17', 'The EMC tests were successful'),
(9, 'XE-9', '1983-05-12', '1983-05-14', 'The EMC tests were successful'),
(10, 'XE-14', '2000-04-12', '2000-04-14', 'The EMC tests were successful'),
(11, 'PR-88', '1994-03-11', '1995-03-13', 'The EMC tests were successful'),
(12, 'PR-88-M', '2002-11-17', '2002-11-19', 'The EMC tests were successful'),
(13, 'U-120', '1970-02-13', '1970-02-16', 'The EMC tests were successful'),
(14, 'U-700', '1991-02-01', '1991-02-03', 'The EMC tests were successful'),
(15, 'U-1000', '2004-02-11', '2004-02-13', 'The EMC tests were successful'),
(16, 'CRK-7', '2013-02-01', '2015-02-03', 'The EMC tests were successful'),
(17, 'KLF-486', '1999-03-15', '2000-03-17', 'The EMC tests were successful'),
(18, 'BST-321', '2000-10-15', '2000-10-17', 'The EMC tests were successful'),
(19, 'PIO-780', '1970-08-10', '1970-08-13', 'The EMC tests were successful');




DELETE FROM Thermal_vacuum_tests;

INSERT Thermal_vacuum_tests(id_tv_t, name, t1_tv, t2_tv, tv_test_result, tv_control_system_efficiency)
VALUES
(1, 'TP-16', '1960-08-14', '1960-08-18', 'The thermal vacuum tests were successful', TRUE),
(2, 'TP-36', '1964-01-20', '1964-01-21', 'The thermal vacuum tests were successful', TRUE),
(3, 'TP-36-M', '1983-03-15', '1983-03-17', 'The thermal vacuum tests were successful', TRUE),
(4, 'AIDO-1725', '1973-11-07', '1973-11-08', 'The thermal vacuum tests were successful', TRUE), 
(5, 'AIDO-1725-M', '1991-12-15', '1991-12-17', 'The thermal vacuum tests were successful', TRUE),
(6, 'CRT-400', '2011-07-20', '2011-07-22', 'The thermal vacuum tests were successful', TRUE),
(7, 'ISNO-550', '2004-07-12', '2004-07-14', 'The thermal vacuum tests were successful', TRUE),
(8, 'XE-6', '1980-11-13', '1980-11-14', 'The thermal vacuum tests were successful', TRUE),
(9, 'XE-9', '1983-06-14', '1983-06-16', 'The thermal vacuum tests were successful', TRUE),
(10, 'XE-14', '2000-04-17', '2000-04-18', 'The thermal vacuum tests were successful', TRUE),
(11, 'PR-88', '1994-08-12', '1995-08-14', 'The thermal vacuum tests were successful', TRUE),
(12, 'PR-88-M', '2002-10-12', '2002-10-14', 'The thermal vacuum tests were successful', TRUE),
(13, 'U-120', '1970-01-10', '1970-01-13', 'The thermal vacuum tests were successful', TRUE),
(14, 'U-700', '1991-07-08', '1991-07-10', 'The thermal vacuum tests were successful', TRUE),
(15, 'U-1000', '2004-04-10', '2004-04-15', 'The thermal vacuum tests were successful', TRUE),
(16, 'CRK-7', '2013-01-01', '2015-01-03', 'The thermal vacuum tests were successful', TRUE),
(17, 'KLF-486', '1999-08-18', '2000-08-20', 'The thermal vacuum tests were successful', TRUE),
(18, 'BST-321', '2000-11-12', '2000-11-15', 'The thermal vacuum tests were successful', TRUE),
(19, 'PIO-780', '1970-04-15', '1970-04-17', 'The thermal vacuum tests were successful', TRUE);





DELETE FROM Flight_tests;

INSERT Flight_tests(id_flight_t, name, t1_flight_test, t2_flight_test, flight_test_result, all_systems_efficiency, crash)
VALUES
(1, 'TP-16', '1961-08-14', '1961-11-18', 'Flight tests were successful', TRUE, FALSE),
(2, 'TP-36', '1966-05-20', '1966-08-21', 'Flight tests were successful', TRUE, FALSE),
(3, 'TP-36-M', '1989-03-15', '1989-07-14', 'Flight tests were successful', TRUE, FALSE),
(4, 'AIDO-1725', '1974-03-07', '1974-08-29', 'Flight tests were successful', TRUE, FALSE), 
(5, 'AIDO-1725-M', '1994-01-15', '1994-07-02', 'Flight tests were successful', TRUE, FALSE),
(6, 'CRT-400', '2019-07-25', '2019-10-22', 'Flight tests were successful', TRUE, FALSE),
(7, 'ISNO-550', '2007-02-17', '2007-09-20', 'Flight tests were successful', TRUE, FALSE),
(8, 'XE-6', '1982-04-12', '1982-10-19', 'Flight tests were successful', TRUE, FALSE),
(9, 'XE-9', '1989-03-14', '1989-11-17', 'Flight tests were successful', TRUE, FALSE),
(10, 'XE-14', '2004-04-12', '2004-12-12', 'Flight tests were successful', TRUE, FALSE),
(11, 'PR-88', '1997-01-12', '1997-06-19', 'Flight tests were successful', TRUE, FALSE),
(12, 'PR-88-M', '2004-03-12', '2004-11-19', 'Flight tests were successful', TRUE, FALSE),
(13, 'U-120', '1971-01-13', '1971-08-18', 'Flight tests were successful', TRUE, FALSE),
(14, 'U-700', '1992-07-15', '1992-12-10', 'Flight tests were successful', TRUE, FALSE),
(15, 'U-1000', '2007-04-10', '2007-11-19', 'Flight tests were successful', TRUE, FALSE),
(16, 'CRK-7', '2018-01-01', '2018-10-07', 'Flight tests were successful', TRUE, FALSE),
(17, 'KLF-486', '2004-02-10', '2004-12-25', 'Flight tests were successful', TRUE, FALSE),
(18, 'BST-321', '2009-02-11', '2009-12-16', 'Flight tests were successful', TRUE, FALSE),
(19, 'PIO-780', '1975-01-17', '1975-11-19', 'Flight tests were successful', TRUE, FALSE);




-- Здесь хранится места старта ракет
DELETE FROM Basing;

INSERT Basing(id_basing, X_current, Y_current, Z_current) VALUES 
(1, 340, 340, 0),
(2, 340, 340, 0),
(3, 650, 650, 0),
(4, 320, 320, 0),
(5, 360, 360, 0),
(6, 400, 440, 0),
(7, 657, 780, 5),
(8, 430, 500, 5),
(9, 120, 140, 4),
(10, 40, 40, 4),
(11, 50, 40, 4),
(12, 40, 40, 4),
(13, 40, 40, 3),
(14, 23, 23, 4),
(15, 30, 30, 5),
(16, 30, 30, 5),
(17, 195, 190, 15),
(18, 330, 390, 15),
(19, 440, 498, 15),
(20, 990, 943, 15),
(21, 985, 332, 15),
(22, 320, 190, 15),
(23, 333, 333, 15),
(24, 210, 390, 15),
(25, 319, 909, 15),
(26, 410, 865, 15),
(27, 450, 780, 0),
(28, 450, 780, 0),
(29, 430, 430, 0),
(30, 450, 780, 0),
(31, 320, 320, 0),
(32, 340, 350, 0),
(33, 320, 320, 2),
(34, 320, 320, 2),
(35, 320, 320, 0),
(36, 540, 540, 0),
(37, 210, 210, 0),
(38, 430, 540, 3),
(39, 430, 430, 3),
(40, 650, 540, 3),
(41, 387, 310, 15),
(42, 1, 40, 15),
(43, 39, 39, 15),
(44, 44, 44, 15),
(45, 13, 190, 15),
(46, 98, 80, 15),
(47, 47, 80, 15),
(48, 130, 190, 15),
(49, 20, 20, 15),
(50, 10, 15, 15),
(51, 100, 160, 15),
(52, 54, 107, 15),
(53, 188, 190, 15),
(54, 111, 187, 15),
(55, 100, -54, 15),
(56, 67, 649, 15),
(57, 130, 156, 0),
(58, 159, 139, 0),
(59, 600, 600, 0),
(60, 124, 195, 0),
(61, 39, 58, 0),
(62, 95, 90, 0),
(63, 139, 940, 0),
(64, 112, 940, 0),
(65, 129, 500, 0),
(66, 149, 430, 0),
(67, 190, 430, 0),
(68, 354, 950, 0),
(69, 320, 650, 0),
(70, 240, 650, 0),
(71, 100, 200, 0),
(72, 100, 200, 0),
(73, 100, 200, 0),
(74, 100, 200, 0),
(75, 100, 200, 0),
(76, 100, 200, 0),
(77, 100, 200, 0),
(78, 100, 200, 0),
(79, 150, 150, 2),
(80, 150, 150, 2),
(81, 150, 150, 2),
(82, 340, 340, 3),
(83, 340, 340, 3),
(84, 340, 340, 3),
(85, 340, 340, 3),
(86, 340, 340, 3),
(87, 340, 340, 3),
(88, 340, 340, 3),
(89, 340, 340, 3),
(90, 340, 340, 3),
(91, 340, 340, 3),
(92, 340, 340, 3),
(93, 340, 340, 3),
(94, 340, 340, 3),
(95, 580, 445, 0),
(96, 580.1, 445, 0),
(97, 580.2, 445, 0),
(98, 580.3, 445, 0),
(99, 580.4, 445, 0),
(100, 580.5, 445, 0),
(101, 580.6, 445, 0),
(102, 580.7, 445, 0),
(103, 580.8, 445, 0),
(104, 580.9, 445, 0),
(105, 740, 40, 0),
(106, 740, 40, 0),
(107, 740, 40, 0),
(108, 740, 40, 0),
(109, 740, 40, 0),
(110, 740, 40, 0),
(111, 740, 40, 0),
(112, 950, 324, 0),
(113, 493, 589, 0),
(114 ,950, 442, 0),
(115, 640, 539, 0),
(116, 873, 950, 0),
(117, 435, 960, 0),
(118, 100, 240, 0),
(119, 130, 200, 0),
(120, 130, 200, 0),
(121, 130, 200, 0),
(122, 840, 476, 0),
(123, 840.1, 476, 0),
(124, 840.2, 476, 0),
(125, 840.3, 476, 0),
(126, 840.4, 476, 0),
(127, 840.5, 476, 0),
(128, 486, 322, 0),
(129, 486.1, 332, 0),
(130 ,486.3, 332, 0),
(131, 486.4, 332, 0),
(132, 486.5, 332, 0),
(133, 486.6, 332, 0),
(134, 486.7, 332, 0),
(135, 130, 150, 0),
(136, 740, 345, 0),
(137, 468, 963, 0),
(138, 452, 138, 0),
(139, 46, 69, 0),
(140, 693, 760, 0),
(141, 700, 700, 0),
(141, 700, 700.1, 0),
(142, 700, 700.2, 0),
(143, 700, 700.3, 0),
(144, 700, 700.4, 0),
(145, 700, 700.5, 0),
(146, 700, 700.6, 0),
(147, 700, 700.7, 0),
(148, 700, 700.8, 0),
(149, 480, 400, 0),
(150, 480, 400.1, 0),
(151, 480, 400.2, 0),
(152, 480, 400.3, 0),
(153, 480, 400.4, 0),
(154, 480, 400.5, 0),
(155, 400, 400, 0),
(156, 500, 260, 0),
(157, 450, 321, 0),
(158, 450, 321, 0),
(159, 320, 200, 0),
(160, 320, 200, 0);





-- Закончили
-- Тип головной части + 
-- Тип полезного груза + 
-- Наличие дополнительного груза в виде малых спутников +
-- Cтоимоисть полезного груза + 
-- Эксплуатируется ли полезный груз +
-- Срок эксплуатации полезного груза по документам + 
-- Масса полезного груза + 


DELETE FROM Head_part;

INSERT Head_part(id_head, head_type, payload_type, additional_cargo, payload_cost, payload_exploitability, t_payload_operation, payload_mass)
VALUES
(1, 'Conical', 'Communication satellite', TRUE, 1200000, FALSE, 20, 2200),
(2, 'Conical', 'Communication satellite', TRUE, 500000, FALSE, 20, 2200),
(3, 'Conical', 'Communication satellite', FALSE, 450000, FALSE, 20, 2200),
(4, 'HP with a blunted tip', 'Earth remote sensing satellite', FALSE, 770000, FALSE, 25, 2200),
(5, 'HP with a blunted tip', 'Earth remote sensing satellite', FALSE, 1100000, FALSE, 25, 2200),
(6, 'HP with a blunted tip', 'Earth remote sensing satellite', FALSE, 876000, FALSE, 20, 2200),
(7, 'HP with a blunted tip', 'Earth remote sensing satellite', TRUE, 450000, FALSE, 20, 2200),
(8, 'Conical', 'Earth remote sensing satellite', TRUE, 340000, FALSE, 20, 2200),
(9, 'Conical', 'Earth remote sensing satellite', TRUE, 290765, FALSE, 20, 2200),
(10, 'Conical', 'TV satellite', TRUE, 654000, FALSE, 20, 4500), 
(11, 'Conical', 'TV satellite', TRUE, 380000, FALSE, 20, 4500),
(12, 'HP with a blunted tip', 'TV satellite', FALSE, 450000, FALSE, 20, 4500),
(13, 'HP with a blunted tip', 'TV satellite', FALSE, 620000, FALSE, 20, 4500),
(14, 'HP with a blunted tip', 'TV satellite', TRUE, 650000, FALSE, 20, 4500),
(15, 'Conical', 'TV satellite', TRUE, 370540, FALSE, 20, 4500),
(16, 'Conical', 'Earth remote sensing satellite', TRUE, 354000, FALSE, 20, 4500),
(17, 'Conical', 'Earth remote sensing satellite', TRUE, 280000, TRUE, 40, 8800),
(18, 'Conical', 'Earth remote sensing satellite', TRUE, 330000, TRUE, 40, 8800),
(19, 'HP with a blunted tip', 'Earth remote sensing satellite', TRUE, 327000, TRUE, 40, 8800),
(20, 'HP with a blunted tip', 'Earth remote sensing satellite', TRUE, 930000, TRUE, 40, 8800),
(21, 'HP with a blunted tip', 'Earth remote sensing satellite', TRUE, 321900, TRUE, 40, 8800),
(22, 'HP with a blunted tip', 'Earth remote sensing satellite', FALSE, 340000, TRUE, 40, 8800),
(23, 'Conical', 'TV satellite', TRUE, 540000, TRUE, 40, 8800),
(24, 'Conical', 'TV satellite', TRUE, 340000, TRUE, 40, 8800),
(25, 'Conical', 'TV satellite', TRUE, 320000, TRUE, 40, 8800),
(26, 'Conical', 'TV satellite', TRUE, 290560, TRUE, 40, 8800),
(27, 'HP with a blunted tip', 'TV satellite', TRUE, 340000, FALSE, 20, 2350),
(28, 'HP with a blunted tip', 'TV satellite', TRUE, 298700, FALSE, 25, 2350),
(29, 'HP with a blunted tip', 'TV satellite', TRUE, 320000, FALSE, 25, 2350),
(30, 'HP with a blunted tip', 'TV satellite', FALSE, 380000, FALSE, 25, 2350),
(31, 'HP with a blunted tip', 'Earth remote sensing satellite', TRUE, 650000, FALSE, 25, 2350),
(32, 'HP with a blunted tip', 'Earth remote sensing satellite', TRUE, 450000, FALSE, 25, 2350),
(33, 'HP with a blunted tip', 'Earth remote sensing satellite', TRUE, 320000, FALSE, 25, 2350),
(34, 'HP with a blunted tip', 'Earth remote sensing satellite', FALSE, 340215, FALSE, 25, 2350),
(35, 'HP with a blunted tip', 'Earth remote sensing satellite', FALSE, 287900, FALSE, 25, 2350),
(36, 'Conical', 'Weather satellite', TRUE, 840140, FALSE, 25, 2350),
(37, 'Conical', 'Weather satellite', TRUE, 378900, FALSE, 25, 2350),
(38 ,'Conical', 'Weather satellite', TRUE, 350000, FALSE, 25, 2350),
(39, 'Conical', 'Weather satellite', TRUE, 940000, FALSE, 25, 2353),
(40, 'Conical', 'Weather satellite', FALSE, 390000, FALSE, 25, 2354),
(41, 'HP with a blunted tip', 'Weather satellite', TRUE, 450000, TRUE, 40, 3100),
(42, 'HP with a blunted tip', 'Weather satellite', FALSE, 500000, TRUE, 40, 3100),
(43, 'HP with a blunted tip', 'Weather satellite', FALSE, 320000, TRUE, 40, 3100),
(44, 'HP with a blunted tip', 'Weather satellite', FALSE, 290870, FALSE, 40, 3100),
(45, 'HP with a blunted tip', 'Earth remote sensing satellite', TRUE, 430120, FALSE, 40, 3100),
(46, 'HP with a blunted tip', 'Earth remote sensing satellite', TRUE, 340000, TRUE, 40, 3100),
(47, 'HP with a blunted tip', 'Earth remote sensing satellite', TRUE, 450000, TRUE, 40, 3100),
(48, 'HP with a blunted tip', 'Earth remote sensing satellite', TRUE, 650321, TRUE, 40, 9400),
(49, 'HP with a blunted tip', 'Communication satellite', TRUE, 687900, TRUE, 40, 9400),
(50, 'HP with a blunted tip', 'Communication satellite', TRUE, 450000, TRUE, 45, 9400),
(51, 'HP with a blunted tip', 'Communication satellite', TRUE, 850123, TRUE, 43, 9400),
(52, 'HP with a blunted tip', 'Communication satellite', TRUE, 765935, TRUE, 42, 9400),
(53, 'HP with a blunted tip', 'Communication satellite', TRUE, 854930, TRUE, 41, 9400),
(54, 'HP with a blunted tip', 'Weather satellite', TRUE, 853900, TRUE, 43, 9400),
(55, 'HP with a blunted tip', 'Weather satellite', TRUE, 432000, TRUE, 44, 9400),
(56, 'Conical', 'Weather satellite', FALSE, 650430, TRUE, 44, 9400),
(57, 'Conical', 'Weather satellite', FALSE, 764000, TRUE, 44, 480),
(58, 'Conical', 'Weather satellite', FALSE, 940870, TRUE, 45, 480),
(59, 'Conical', 'Weather satellite', FALSE, 760000, TRUE, 50, 480),
(60, 'Conical', 'Weather satellite', TRUE, 540340, TRUE, 41, 480),
(61, 'Conical', 'Weather satellite', TRUE, 560000, TRUE, 41, 480),
(62, 'HP with a blunted tip', 'Communication satellite', TRUE, 760000, TRUE, 40, 480),
(63, 'HP with a blunted tip', 'Communication satellite', TRUE, 540900, TRUE, 40, 480),
(64, 'HP with a blunted tip', 'Communication satellite', TRUE, 860400, TRUE, 40, 480),
(65, 'HP with a blunted tip', 'Communication satellite', TRUE, 340500, TRUE, 43, 480),
(66, 'HP with a blunted tip', 'Earth remote sensing satellite', TRUE, 870500, TRUE, 44, 480),
(67, 'HP with a blunted tip', 'Earth remote sensing satellite', TRUE, 340600, TRUE, 45, 480),
(68, 'HP with a blunted tip', 'Communication satellite', TRUE, 650000, 40, 480),
(69, 'Conical', 'Weather satellite', TRUE, 540320, TRUE, 40, 480),
(70, 'Conical', 'Weather satellite', TRUE, 850200, TRUE, 40, 480),
(71, 'Conical', 'Weather satellite', TRUE, 340600, FALSE, 40, 250),
(72, 'Conical', 'Earth remote sensing satellite', FALSE, 540200, FALSE, 20, 250),
(73, 'Conical', 'Earth remote sensing satellite', FALSE, 430200, FALSE, 20, 250),
(74, 'Conical', 'Earth remote sensing satellite', FALSE, 170800, FALSE, 20, 250), 
(75, 'Conical', 'Earth remote sensing satellite', FALSE, 540600, FALSE, 20, 250),
(76, 'Conical', 'Earth remote sensing satellite', FALSE, 650430, FALSE, 20, 250),
(77, 'Conical', 'Earth remote sensing satellite', FALSE, 850300, FALSE, 20, 250),
(78, 'HP with a blunted tip', 'Weather satellite', FALSE, 430600, FALSE, 20, 250),
(79, 'HP with a blunted tip', 'Weather satellite', FALSE, 864000, FALSE, 20, 250),
(80, 'HP with a blunted tip', 'Weather satellite', FALSE, 430600, FALSE, 20, 250),
(81, 'HP with a blunted tip', 'Weather satellite', FALSE, 650300, FALSE, 20, 250),
(82, 'HP with a blunted tip', 'Weather satellite', FALSE, 340500, FALSE, 20, 250),
(83, 'HP with a blunted tip', 'Weather satellite', FALSE, 540200, FALSE, 20, 250),
(84, 'HP with a blunted tip', 'Weather satellite', FALSE, 650300, FALSE, 20, 250),
(85, 'HP with a blunted tip', 'Weather satellite', FALSE, 360500, TRUE, 45, 300),
(86, 'HP with a blunted tip', 'Weather satellite', FALSE, 950200, TRUE, 44, 300),
(87, 'HP with a blunted tip', 'Weather satellite', TRUE, 540300, TRUE, 43, 300),
(88, 'HP with a blunted tip', 'TV satellite', TRUE, 430200, TRUE, 44, 300),
(89, 'HP with a blunted tip', 'TV satellite', TRUE, 760400, TRUE, 43, 300),
(90, 'HP with a blunted tip', 'TV satellite', TRUE, 430200, TRUE, 43, 300),
(91, 'HP with a blunted tip', 'TV satellite', TRUE, 760300, TRUE, 40, 300),
(92, 'HP with a blunted tip', 'TV satellite', TRUE, 500600, TRUE, 42, 300),
(93, 'HP with a blunted tip', 'TV satellite', FALSE, 430600, TRUE, 41, 300),
(94, 'HP with a blunted tip', 'TV satellite', FALSE, 760200, TRUE, 40, 300),
(95, 'HP with a blunted tip', 'Weather satellite', FALSE, 540210, TRUE, 41, 410),
(96, 'HP with a blunted tip', 'Weather satellite', FALSE, 620300, TRUE, 42, 410),
(97, 'HP with a blunted tip', 'Weather satellite', FALSE, 430200, TRUE, 43, 410),
(98, 'HP with a blunted tip', 'Weather satellite', FALSE, 340600, TRUE, 44, 410),
(99, 'HP with a blunted tip', 'Weather satellite', TRUE, 760200, TRUE, 44, 410),
(100, 'HP with a blunted tip', 'TV satellite', TRUE, 560700, TRUE, 44, 410),
(101, 'HP with a blunted tip', 'TV satellite', TRUE, 230400, TRUE, 44, 410),
(102, 'HP with a blunted tip', 'TV satellite', TRUE, 540600, TRUE, 44, 410),
(103, 'HP with a blunted tip', 'TV satellite', TRUE, 860300, TRUE, 40, 410),
(104, 'HP with a blunted tip', 'TV satellite', TRUE, 240600, TRUE, 42, 410),
(105, 'HP with a blunted tip', 'TV satellite', TRUE, 769300, TRUE, 40, 1300),
(106, 'HP with a blunted tip', 'TV satellite', TRUE, 544970, TRUE, 45, 1300),
(107, 'HP with a blunted tip',  'TV satellite', FALSE, 766800, TRUE, 45, 1300),
(108, 'HP with a blunted tip', 'TV satellite', FALSE, 765490, TRUE, 40, 1300),
(109, 'HP with a blunted tip', 'TV satellite', FALSE, 570800, TRUE, 40, 1300),
(110, 'HP with a blunted tip', 'Earth remote sensing satellite', TRUE, 980700, TRUE, 43, 1300),
(111, 'HP with a blunted tip', 'Earth remote sensing satellite', TRUE, 967900, TRUE, 43, 1300),
(112, 'HP with a blunted tip', 'Earth remote sensing satellite', TRUE, 180500, TRUE, 43, 1800),
(113, 'HP with a blunted tip', 'Earth remote sensing satellite', TRUE, 650300, TRUE, 43, 1800),
(114, 'Conical', 'TV satellite', TRUE, 860500, TRUE, 40, 1800),
(115, 'Conical', 'TV satellite', TRUE, 340600, TRUE, 40, 1800),
(116, 'Conical', 'TV satellite', TRUE, 870500, TRUE, 45, 1800),
(117, 'Conical', 'TV satellite', TRUE, 460900, TRUE, 45, 1800),
(118, 'Conical', 'TV satellite', TRUE, 370800, FALSE, 15, 430),
(119, 'Conical', 'Weather satellite', TRUE, 540200, FALSE, 15, 430),
(120, 'Conical', 'Weather satellite', TRUE, 560700, FALSE, 15, 430),
(121, 'Conical', 'Weather satellite', TRUE, 540200, FALSE, 15, 430),
(122, 'Conical', 'TV satellite', TRUE, 980700, TRUE, 40, 515),
(123, 'Conical', 'TV satellite', TRUE, 560300, TRUE, 40, 515),
(124, 'Conical', 'TV satellite', TRUE, 650700, TRUE, 40, 515),
(125, 'Conical', 'TV satellite', FALSE, 870500, TRUE, 40, 515),
(126, 'Conical', 'TV satellite', FALSE, 320500, TRUE, 40, 515),
(127, 'Conical', 'TV satellite', FALSE, 870300, TRUE, 45, 515),
(128, 'Conical', 'TV satellite', FALSE, 320400, TRUE, 45, 940),
(129,  'Conical', 'Weather satellite', FALSE, 870124, TRUE, 45, 940),
(130, 'Conical', 'Weather satellite', FALSE, 760200, TRUE, 45, 940),
(131, 'Conical', 'Weather satellite', FALSE, 645900, TRUE, 45, 940),
(132, 'Conical', 'Weather satellite', FALSE, 1200000, TRUE, 45, 940),
(133, 'Conical',  'Weather satellite', TRUE, 2400700, TRUE, 45, 940),
(134, 'Conical', 'TV satellite', TRUE, 543980, TRUE, 45, 940),
(135, 'Conical', 'TV satellite', TRUE, 423450, TRUE, 45, 1100),
(136, 'Conical', 'TV satellite', FALSE, 312345, TRUE, 43, 1100),
(137, 'Conical', 'TV satellite', FALSE, 678987, TRUE, 42, 1100),
(138, 'HP with a blunted tip', 'TV satellite', FALSE, 589652, TRUE, 50, 1100),
(139, 'HP with a blunted tip', 'TV satellite', FALSE, 756980, TRUE, 52, 1100),
(140, 'HP with a blunted tip', 'TV satellite', FALSE, 980650, TRUE, 40, 1100),
(141, 'HP with a blunted tip', 'TV satellite', TRUE, 450650, TRUE, 44, 390),
(142, 'HP with a blunted tip', 'TV satellite', TRUE, 345600, TRUE, 45, 390),
(143, 'HP with a blunted tip', 'TV satellite', TRUE, 123456, TRUE, 40, 390),
(144, 'HP with a blunted tip', 'TV satellite', TRUE, 870450, TRUE, 40, 390),
(145, 'HP with a blunted tip', 'TV satellite', TRUE, 432789, TRUE, 45, 390),
(146, 'HP with a blunted tip', 'TV satellite', TRUE, 870300, TRUE, 50, 390),
(147, 'Conical', 'Earth remote sensing satellite', TRUE, 540230, TRUE, 50, 390),
(148, 'Conical', 'Earth remote sensing satellite', TRUE, 540700, TRUE, 50, 390),
(149, 'Conical', 'Earth remote sensing satellite', FALSE, 760800, TRUE, 45, 530),
(150, 'Conical', 'Earth remote sensing satellite', FALSE, 654800, TRUE, 49, 530),
(151, 'Conical', 'Weather satellite', FALSE,  540700, TRUE, 45, 530),
(152, 'Conical', 'Weather satellite', FALSE, 890700, TRUE, 45, 530),
(153, 'HP with a blunted tip', 'Weather satellite', FALSE, 540234, TRUE, 45, 530),
(154, 'HP with a blunted tip', 'Weather satellite', FALSE, 540600, TRUE, 45, 530),
(155, 'HP with a blunted tip', 'Weather satellite', FALSE, 800900, FALSE, 15, 1900),
(156, 'HP with a blunted tip', 'Earth remote sensing satellite', TRUE, 320400, FALSE, 15, 1900),
(157, 'Conical', 'Earth remote sensing satellite', TRUE, 760400, FALSE, 13, 1900),
(158, 'Conical', 'Earth remote sensing satellite', TRUE, 340600, FALSE, 17, 1900),
(159, 'Conical',  'Earth remote sensing satellite', TRUE, 760300, FALSE, 15, 1900), 
(160, 'Conical', 'Earth remote sensing satellite', FALSE, 670300, FALSE, 15, 1900);




DELETE FROM Control_elements;

INSERT Control_elements(id_elem, pitch_control, yaw_control, roll_control)
VALUES
(1, 'Gas jet rudders', 'Gas jet rudders', 'Steering nozzles'),
(2, 'Gas jet rudders', 'Gas jet rudders', 'Main nozzles'),
(3, 'Main nozzles', 'Main nozzles', 'Main nozzles'),
(4, 'Stabilizers', 'Stabilizers', 'Steering nozzles'),
(5, 'Stabilizers', 'Stabilizers', 'Main nozzles'),
(6, 'Latticed stabilizers', 'Latticed stabilizers', 'Steering nozzles'),
(7, 'Latticed stabilizers', 'Latticed stabilizers', 'Main nozzles'), 
(8, 'Main nozzles', 'Main nozzles', 'Steering nozzles'), 
(9, 'Gas jet rudders', 'Stabilizers', 'Steering nozzles'),
(10, 'Gas jet rudders', 'Latticed stabilizers', 'Steering nozzles'),
(11, 'Latticed stabilizers', 'Stabilizers', 'Steering nozzles'),
(12, 'Latticed stabilizers', 'Stabilizers', 'Main nozzles'),
(13, 'Gas injection', 'Gas injection', 'Steering nozzles'),
(14, 'Gas injection', 'Gas injection', 'Main nozzles'),
(15, 'Steering nozzles', 'Steering nozzles', 'Steering nozzles'),
(16, 'Steering nozzles', 'Steering nozzles', 'Main nozzles'),
(17, 'CUS', 'CUS', 'Steering nozzles'),
(18, 'CUS', 'CUS', 'Main nozzles');