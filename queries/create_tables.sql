CREATE TABLE Routes (
    RouteID INT IDENTITY(1,1) PRIMARY KEY,
    RouteNumber NVARCHAR(10) NOT NULL UNIQUE,
    RouteName NVARCHAR(255) NOT NULL,
    TicketPrice DECIMAL(10, 2) NOT NULL CHECK (TicketPrice >= 0)
);

CREATE TABLE BusModels (
    ModelID INT IDENTITY(1,1) PRIMARY KEY,
    ModelName NVARCHAR(100) NOT NULL,
    Manufacturer NVARCHAR(100) NULL,
    SeatCount INT NOT NULL CHECK (SeatCount > 0)
);

CREATE TABLE BusStatuses (
    StatusID INT IDENTITY(1,1) PRIMARY KEY,
    StatusName NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Buses (
    BusID INT IDENTITY(1,1) PRIMARY KEY,
    ModelID INT NOT NULL,
    StatusID INT NOT NULL,
    LicensePlate NVARCHAR(15) NOT NULL UNIQUE,
    YearOfManufacture INT NOT NULL CHECK (YearOfManufacture > 1950),
    CONSTRAINT FK_Buses_To_BusModels FOREIGN KEY (ModelID) REFERENCES BusModels(ModelID),
    CONSTRAINT FK_Buses_To_BusStatuses FOREIGN KEY (StatusID) REFERENCES BusStatuses(StatusID)
);

CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    LastName NVARCHAR(50) NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    Patronymic NVARCHAR(50) NULL,
    HireDate DATE NOT NULL
);

CREATE TABLE Roles (
    RoleID INT IDENTITY(1,1) PRIMARY KEY,
    RoleName NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE EmployeeRoles (
    EmployeeID INT NOT NULL,
    RoleID INT NOT NULL,
    PRIMARY KEY (EmployeeID, RoleID),
    CONSTRAINT FK_EmployeeRoles_To_Employees FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE,
    CONSTRAINT FK_EmployeeRoles_To_Roles FOREIGN KEY (RoleID) REFERENCES Roles(RoleID) ON DELETE CASCADE
);

CREATE TABLE Trips (
    TripID INT IDENTITY(1,1) PRIMARY KEY,
    RouteID INT NOT NULL,
    BusID INT NOT NULL,
    DriverID INT NOT NULL,
    StartTime DATETIME2 NOT NULL,
    EndTime DATETIME2 NULL,
    TicketsSold INT NOT NULL DEFAULT 0 CHECK (TicketsSold >= 0),
    CONSTRAINT FK_Trips_To_Routes FOREIGN KEY (RouteID) REFERENCES Routes(RouteID),
    CONSTRAINT FK_Trips_To_Buses FOREIGN KEY (BusID) REFERENCES Buses(BusID),
    CONSTRAINT FK_Trips_To_Employees_Driver FOREIGN KEY (DriverID) REFERENCES Employees(EmployeeID),
    CONSTRAINT CHK_TripTimes CHECK (EndTime IS NULL OR EndTime > StartTime)
);

CREATE TABLE ConductorAssignments (
    TripID INT NOT NULL,
    ConductorID INT NOT NULL,
    PRIMARY KEY (TripID, ConductorID),
    CONSTRAINT FK_ConductorAssignments_To_Trips FOREIGN KEY (TripID) REFERENCES Trips(TripID) ON DELETE CASCADE,
    CONSTRAINT FK_ConductorAssignments_To_Employees_Conductor FOREIGN KEY (ConductorID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE
);

CREATE TABLE MaintenanceLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    BusID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NULL,
    Description NVARCHAR(MAX) NOT NULL,
    Cost DECIMAL(10, 2) NULL,
    CONSTRAINT FK_MaintenanceLog_To_Buses FOREIGN KEY (BusID) REFERENCES Buses(BusID),
    CONSTRAINT CHK_MaintenanceDates CHECK (EndDate IS NULL OR EndDate >= StartDate)
);
GO
