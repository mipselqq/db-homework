USE HW;

INSERT INTO Roles (RoleName) VALUES

(N'Водитель'),
(N'Кондуктор'),
(N'Механик');

INSERT INTO BusStatuses (StatusName) VALUES
(N'На линии'),
(N'В ремонте'),
(N'Списан');

INSERT INTO BusModels (ModelName, Manufacturer, SeatCount) VALUES
(N'ПАЗ-3205', N'Павловский автобусный завод', 25),
(N'Mercedes-Benz Sprinter', N'Mercedes-Benz', 19),
(N'Ford Transit', N'Ford', 22);

INSERT INTO Routes (RouteNumber, RouteName, TicketPrice) VALUES
(N'10', N'Центральный рынок - Аэропорт', 30.00),
(N'55K', N'Университет - ТРЦ "Мега"', 35.50),
(N'7', N'Вокзал - Микрорайон "Южный"', 28.00);

INSERT INTO Employees (LastName, FirstName, Patronymic, HireDate) VALUES
(N'Иванов', N'Иван', N'Иванович', '2020-05-15'),
(N'Петров', N'Сергей', N'Александрович', '2021-09-01'),
(N'Сидорова', N'Анна', N'Викторовна', '2019-03-10'),
(N'Кузнецова', N'Мария', N'Андреевна', '2022-11-20'),
(N'Смирнов', N'Дмитрий', N'Олегович', '2018-07-22');

INSERT INTO EmployeeRoles (EmployeeID, RoleID) VALUES (1, 1);
INSERT INTO EmployeeRoles (EmployeeID, RoleID) VALUES (2, 1);
INSERT INTO EmployeeRoles (EmployeeID, RoleID) VALUES (3, 2);
INSERT INTO EmployeeRoles (EmployeeID, RoleID) VALUES (4, 2);
INSERT INTO EmployeeRoles (EmployeeID, RoleID) VALUES (5, 1);
INSERT INTO EmployeeRoles (EmployeeID, RoleID) VALUES (5, 2);

INSERT INTO Buses (ModelID, StatusID, LicensePlate, YearOfManufacture) VALUES
(1, 1, N'А123БВ 77', 2018),
(2, 1, N'Р456СТ 77', 2021),
(3, 2, N'У789ХЕ 77', 2019),
(1, 1, N'К111ЛМ 77', 2017);

INSERT INTO Trips (RouteID, BusID, DriverID, StartTime, EndTime, TicketsSold) VALUES
(1, 1, 1, '2025-10-20 08:00:00', '2025-10-20 09:15:00', 120);

INSERT INTO Trips (RouteID, BusID, DriverID, StartTime, EndTime, TicketsSold) VALUES
(2, 2, 2, '2025-10-20 09:30:00', '2025-10-20 10:40:00', 95);

INSERT INTO Trips (RouteID, BusID, DriverID, StartTime, EndTime, TicketsSold) VALUES
(3, 4, 5, '2025-10-20 10:00:00', '2025-10-20 11:05:00', 210);

INSERT INTO Trips (RouteID, BusID, DriverID, StartTime, EndTime, TicketsSold) VALUES
(1, 1, 1, '2025-10-21 08:00:00', NULL, 50);

INSERT INTO ConductorAssignments (TripID, ConductorID) VALUES (1, 3);
INSERT INTO ConductorAssignments (TripID, ConductorID) VALUES (3, 4);
INSERT INTO ConductorAssignments (TripID, ConductorID) VALUES (3, 5);
INSERT INTO ConductorAssignments (TripID, ConductorID) VALUES (4, 4);

INSERT INTO MaintenanceLog (BusID, StartDate, EndDate, Description, Cost) VALUES
(1, '2025-09-01', '2025-09-02', N'Плановое ТО-3, замена масла и фильтров', 15000.00);
INSERT INTO MaintenanceLog (BusID, StartDate, EndDate, Description, Cost) VALUES
(3, '2025-10-18', NULL, N'Ремонт двигателя, ожидание запчастей', NULL);
GO
