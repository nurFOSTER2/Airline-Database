CREATE TABLE Airport(
	airport_id INT PRIMARY KEY,
	location VARCHAR(50),
	airport_name VARCHAR(100),
	runway_numbers INT
);

CREATE TABLE Aircraft(
	aircraft_id INT PRIMARY KEY,
	aircraft_model VARCHAR(50),
	maintenance_schedule TIMESTAMP,
	registration_number INT UNIQUE
);

CREATE TABLE Passenger(
	passenger_id INT PRIMARY KEY,
	passenger_name VARCHAR(100) NOT NULL,
	contact_info VARCHAR(100),
	loyalty_status VARCHAR(50)
);

CREATE TABLE Crew(
	crew_id INT PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	position VARCHAR(50),
	contact_info VARCHAR(50),
	certification VARCHAR(50)
);

CREATE TABLE Flight(
	flight_id INT PRIMARY KEY,
	aircraft_id INT REFERENCES Aircraft(aircraft_id),
	departure_time TIMESTAMP,
	arrival_time TIMESTAMP
);

CREATE TABLE Flight_crew(
	fc_id INT PRIMARY KEY,
	flight_id INT REFERENCES Flight(flight_id),
	crew_id INT REFERENCES Crew(crew_id),
	role VARCHAR(50)
);

CREATE TABLE Flight_airport(
	fa_id INT PRIMARY KEY,
	flight_id INT REFERENCES Flight(flight_id),
	airport_id INT REFERENCES Airport(airport_id),
	type VARCHAR(50)
);

CREATE TABLE Payment(
	payment_id INT PRIMARY KEY,
	payment_method VARCHAR(50)
);

CREATE TABLE Reservation(
	reservation_id INT PRIMARY KEY,
	date_of_reservation TIMESTAMP,
	payment_id INT REFERENCES Payment(payment_id),
	passenger_id INT REFERENCES Passenger(passenger_id),
	flight_id INT REFERENCES Flight(flight_id)
);


CREATE TABLE Ticket(
	ticket_id INT PRIMARY KEY,
	ticket_class VARCHAR(50),
	refundable BOOLEAN,
	reservation_id INT REFERENCES Reservation(reservation_id)
);

CREATE TABLE Luggage(
	luggage_id INT PRIMARY KEY,
	weight INT NOT NULL,
	ticket_id INT REFERENCES Ticket(ticket_id),
	luggage_type VARCHAR(50)
);
