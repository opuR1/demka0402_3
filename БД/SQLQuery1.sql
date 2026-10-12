create table Roles(
	RoleId int primary key identity(1,1),
	RoleName nvarchar(255) not null
);

create table Cities(
	CityId int primary key identity(1,1),
	CityName nvarchar(255) not null
);

create table Units(
	UnitId int primary key identity(1,1),
	UnitName nvarchar(255) not null
);

create table Suppliers(
	SupplierId int primary key identity(1,1),
	SupplierName nvarchar(255) not null
);

create table Producers(
	ProducerId int primary key identity(1,1),
	ProducerName nvarchar(255) not null
);

create table Categories(
	CategoryId int primary key identity(1,1),
	CategoryName nvarchar(255) not null
);

create table OrderStatuses(
	OrderStatusId int primary key identity(1,1),
	OrderStatusName nvarchar(255) not null
);

create table Users(
	UserId int primary key identity(1,1),
	RoleId int foreign key references Roles(RoleId) not null,
	LastName nvarchar(255) not null,
	FirstName nvarchar(255) not null,
	MiddleName nvarchar(255) not null,
	Login nvarchar(255) not null,
	Password nvarchar(255) not null
);

create table PickupPoints(
	PointId int primary key identity(1,1),
	PointIndex int,
	CityId int foreign key references Cities(CityId) not null,
	Street nvarchar(255),
	House int
);

create table Products(
	ProductId int primary key identity(1,1),
	ProductArtycle nvarchar(255),
	ProductName nvarchar(255) not null,
	UnitId int foreign key references Units(UnitId) not null,
	Price decimal(10,2),
	SupplierId int foreign key references Suppliers(SupplierId) not null,
	ProducerId int foreign key references Producers(ProducerId) not null,
	CategoryId int foreign key references Categories(CategoryId) not null,
	Discount int,
	StorageCount int,
	Description nvarchar(255),
	Photo nvarchar(255)
);

create table Orders(
	OrderId int primary key identity(1,1),
	CreateDate date not null,
	DeliveryDate date not null,
	PointId int foreign key references PickupPoints(PointId) not null,
	UserId int foreign key references Users(UserId) not null,
	Code int not null,
	OrderStatusId int foreign key references OrderStatuses(OrderStatusId) not null
);

create table OrdersInfo(
	OrderInfoId int primary key identity(1,1),
	ProductId int foreign key references Products(ProductId) not null,
	ProductCount int,
	OrderId int foreign key references Orders(OrderId) not null
);