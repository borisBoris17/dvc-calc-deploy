CREATE TABLE resort (
  resort_id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(30),
  location VARCHAR(30),
  PRIMARY KEY(resort_id)
);

INSERT INTO public.resort (resort_id, name, location) OVERRIDING SYSTEM VALUE VALUES (1, 'Riviera', 'EPCOT Resort Area');
INSERT INTO public.resort (resort_id, name, location) OVERRIDING SYSTEM VALUE VALUES (2, 'Boardwalk', 'EPCOT Resort Area');
INSERT INTO public.resort (resort_id, name, location) OVERRIDING SYSTEM VALUE VALUES (3, 'Beach Club', 'EPCOT Resort Area');
INSERT INTO public.resort (resort_id, name, location) OVERRIDING SYSTEM VALUE VALUES (4, 'Old Key West', 'Disney Springs Resort Area');
INSERT INTO public.resort (resort_id, name, location) OVERRIDING SYSTEM VALUE VALUES (5, 'Saratoga Springs', 'Disney Springs Resort Area');
INSERT INTO public.resort (resort_id, name, location) OVERRIDING SYSTEM VALUE VALUES (6, 'Grand Floridian', 'Magic Kingdom Resort Area');
INSERT INTO public.resort (resort_id, name, location) OVERRIDING SYSTEM VALUE VALUES (7, 'Bay Lake Tower', 'Magic Kingdom Resort Area');
INSERT INTO public.resort (resort_id, name, location) OVERRIDING SYSTEM VALUE VALUES (8, 'Polynesian', 'Magic Kingdom Resort Area');
INSERT INTO public.resort (resort_id, name, location) OVERRIDING SYSTEM VALUE VALUES (9, 'Copper Creek', 'Magic Kingdom Resort Area');
INSERT INTO public.resort (resort_id, name, location) OVERRIDING SYSTEM VALUE VALUES (10, 'Boulder Ridge', 'Magic Kingdom Resort Area');
INSERT INTO public.resort (resort_id, name, location) OVERRIDING SYSTEM VALUE VALUES (11, 'Animal Kingdom Lodge', 'Animal Kingdom Resort Area');
INSERT INTO public.resort (resort_id, name, location) OVERRIDING SYSTEM VALUE VALUES (12, 'Aulani', 'Ko Olina, Hawaii');
INSERT INTO public.resort (resort_id, name, location) OVERRIDING SYSTEM VALUE VALUES (13, 'Vero Beach', 'Vero Beach, FL');
INSERT INTO public.resort (resort_id, name, location) OVERRIDING SYSTEM VALUE VALUES (14, 'Hilton Head Island', 'Hilton Head Island, N.C.');

CREATE TABLE room_type (
  room_type_id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(30),
  capacity INT,
  resort_id INT,
  PRIMARY KEY(room_type_id),
  CONSTRAINT fk_resort
    FOREIGN KEY(resort_id)
       REFERENCES resort(resort_id)
);

INSERT INTO public.room_type (room_type_id, name, capacity, resort_id) OVERRIDING SYSTEM VALUE VALUES (1, 'Tower Studio', 2, 1);
INSERT INTO public.room_type (room_type_id, name, capacity, resort_id) OVERRIDING SYSTEM VALUE VALUES (2, 'Deluxe Studio', 5, 1);
INSERT INTO public.room_type (room_type_id, name, capacity, resort_id) OVERRIDING SYSTEM VALUE VALUES (4, 'Two Bedroom Villa', 9, 1);
INSERT INTO public.room_type (room_type_id, name, capacity, resort_id) OVERRIDING SYSTEM VALUE VALUES (5, 'Three Bedroom Villa', 12, 1);
INSERT INTO public.room_type (room_type_id, name, capacity, resort_id) OVERRIDING SYSTEM VALUE VALUES (8, 'Deluxe Studio', 5, 2);
INSERT INTO public.room_type (room_type_id, name, capacity, resort_id) OVERRIDING SYSTEM VALUE VALUES (12, 'Two Bedroom Villa', 9, 2);
INSERT INTO public.room_type (room_type_id, name, capacity, resort_id) OVERRIDING SYSTEM VALUE VALUES (13, 'Three Bedroom Grand Villa', 12, 2);
INSERT INTO public.room_type (room_type_id, name, capacity, resort_id) OVERRIDING SYSTEM VALUE VALUES (3, 'One Bedroom Villa', 5, 1);
INSERT INTO public.room_type (room_type_id, name, capacity, resort_id) OVERRIDING SYSTEM VALUE VALUES (9, 'One Bedroom Villa', 4, 2);

CREATE TABLE view_type (
  view_type_id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(30),
  room_type_id INT,
  PRIMARY KEY(view_type_id),
  CONSTRAINT fk_room_type
    FOREIGN KEY(room_type_id)
    	REFERENCES room_type(room_type_id)
);

INSERT INTO public.view_type (view_type_id, name, room_type_id) OVERRIDING SYSTEM VALUE VALUES (1, 'Standard', 1);
INSERT INTO public.view_type (view_type_id, name, room_type_id) OVERRIDING SYSTEM VALUE VALUES (2, 'Standard', 2);
INSERT INTO public.view_type (view_type_id, name, room_type_id) OVERRIDING SYSTEM VALUE VALUES (3, 'Preferred', 2);
INSERT INTO public.view_type (view_type_id, name, room_type_id) OVERRIDING SYSTEM VALUE VALUES (4, 'Standard', 3);
INSERT INTO public.view_type (view_type_id, name, room_type_id) OVERRIDING SYSTEM VALUE VALUES (5, 'Preferred', 3);
INSERT INTO public.view_type (view_type_id, name, room_type_id) OVERRIDING SYSTEM VALUE VALUES (6, 'Standard', 4);
INSERT INTO public.view_type (view_type_id, name, room_type_id) OVERRIDING SYSTEM VALUE VALUES (7, 'Preferred', 4);
INSERT INTO public.view_type (view_type_id, name, room_type_id) OVERRIDING SYSTEM VALUE VALUES (8, 'Standard', 5);
INSERT INTO public.view_type (view_type_id, name, room_type_id) OVERRIDING SYSTEM VALUE VALUES (9, 'Boardwalk View', 8);
INSERT INTO public.view_type (view_type_id, name, room_type_id) OVERRIDING SYSTEM VALUE VALUES (10, 'Standard View', 8);
INSERT INTO public.view_type (view_type_id, name, room_type_id) OVERRIDING SYSTEM VALUE VALUES (11, 'Standard View', 9);
INSERT INTO public.view_type (view_type_id, name, room_type_id) OVERRIDING SYSTEM VALUE VALUES (12, 'Boardwalk View', 9);
INSERT INTO public.view_type (view_type_id, name, room_type_id) OVERRIDING SYSTEM VALUE VALUES (13, 'Standard', 12);
INSERT INTO public.view_type (view_type_id, name, room_type_id) OVERRIDING SYSTEM VALUE VALUES (14, 'Boardwalk', 12);
INSERT INTO public.view_type (view_type_id, name, room_type_id) OVERRIDING SYSTEM VALUE VALUES (15, 'Boardwalk', 13);

CREATE TABLE point_value (
  point_value_id INT GENERATED ALWAYS AS IDENTITY,
  weekday_rate INT,
  view_type_id INT,
  weekend_rate INT,
  start_date DATE,
  end_date DATE,
  PRIMARY KEY(point_value_id),
  CONSTRAINT fk_view_type
    FOREIGN KEY(view_type_id)
      REFERENCES view_type(view_type_id)
);

INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (1, 10, 1, 13, '2023-09-01', '2023-09-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (2, 14, 2, 17, '2023-09-01', '2023-09-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (3, 17, 3, 22, '2023-09-01', '2023-09-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (4, 29, 4, 34, '2023-09-01', '2023-09-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (5, 36, 5, 46, '2023-09-01', '2023-09-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (6, 38, 6, 47, '2023-09-01', '2023-09-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (7, 47, 7, 58, '2023-09-01', '2023-09-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (8, 103, 8, 120, '2023-09-01', '2023-09-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (9, 14, 9, 16, '2023-09-01', '2023-09-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (12, 9, 10, 13, '2023-09-01', '2023-09-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (18, 19, 11, 27, '2023-09-01', '2023-09-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (19, 26, 12, 29, '2023-09-01', '2023-09-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (20, 12, 1, 14, '2023-01-01', '2023-01-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (22, 13, 1, 15, '2023-05-15', '2023-06-10');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (23, 13, 1, 15, '2023-12-01', '2023-12-23');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (24, 14, 1, 17, '2023-02-01', '2023-02-15');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (25, 14, 1, 17, '2023-06-11', '2023-08-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (26, 16, 1, 18, '2023-11-25', '2023-11-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (27, 17, 1, 20, '2023-02-16', '2023-02-28');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (28, 17, 1, 20, '2023-03-01', '2023-04-01');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (30, 17, 1, 20, '2023-11-22', '2023-11-24');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (21, 12, 1, 14, '2023-05-01', '2023-05-14');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (29, 17, 1, 20, '2023-04-10', '2023-04-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (31, 24, 1, 27, '2023-04-02', '2023-04-09');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (32, 24, 1, 27, '2023-12-24', '2023-12-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (33, 16, 1, 18, '2023-10-01', '2023-11-21');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (34, 19, 2, 22, '2023-10-01', '2023-11-21');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (35, 16, 2, 18, '2023-05-01', '2023-05-14');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (36, 16, 2, 18, '2023-01-01', '2023-01-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (37, 17, 2, 19, '2023-12-01', '2023-12-23');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (38, 17, 2, 19, '2023-05-15', '2023-06-10');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (39, 17, 2, 20, '2023-02-01', '2023-02-15');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (40, 17, 2, 20, '2023-06-11', '2023-08-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (41, 19, 2, 22, '2023-11-25', '2023-11-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (42, 21, 2, 25, '2023-02-16', '2023-02-28');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (43, 21, 2, 25, '2023-03-01', '2023-04-01');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (44, 21, 2, 25, '2023-11-22', '2023-11-24');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (45, 21, 2, 25, '2023-04-10', '2023-04-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (46, 29, 2, 32, '2023-04-02', '2023-04-09');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (47, 29, 2, 32, '2023-12-24', '2023-12-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (48, 19, 3, 24, '2023-05-01', '2023-05-14');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (49, 19, 3, 24, '2023-01-01', '2023-01-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (50, 20, 3, 26, '2023-12-01', '2023-12-23');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (51, 20, 3, 26, '2023-05-15', '2023-06-10');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (52, 21, 3, 26, '2023-02-01', '2023-02-15');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (53, 21, 3, 26, '2023-06-11', '2023-08-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (54, 24, 3, 28, '2023-10-01', '2023-11-21');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (55, 24, 3, 28, '2023-11-25', '2023-11-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (56, 27, 3, 30, '2023-02-16', '2023-02-28');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (57, 27, 3, 30, '2023-03-01', '2023-04-01');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (58, 27, 3, 30, '2023-11-22', '2023-11-24');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (59, 27, 3, 30, '2023-04-10', '2023-04-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (60, 35, 3, 40, '2023-04-02', '2023-04-09');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (61, 35, 3, 40, '2023-12-24', '2023-12-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (62, 108, 8, 127, '2023-05-01', '2023-05-14');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (63, 108, 8, 127, '2023-01-01', '2023-01-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (64, 116, 8, 135, '2023-12-01', '2023-12-23');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (65, 116, 8, 135, '2023-05-15', '2023-06-10');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (66, 120, 8, 141, '2023-02-01', '2023-02-15');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (67, 120, 8, 141, '2023-06-11', '2023-08-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (68, 129, 8, 154, '2023-10-01', '2023-11-21');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (69, 129, 8, 154, '2023-11-25', '2023-11-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (70, 140, 8, 166, '2023-02-16', '2023-02-28');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (71, 140, 8, 166, '2023-03-01', '2023-04-01');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (72, 140, 8, 166, '2023-11-22', '2023-11-24');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (73, 140, 8, 166, '2023-04-10', '2023-04-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (74, 172, 8, 204, '2023-04-02', '2023-04-09');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (75, 172, 8, 204, '2023-12-24', '2023-12-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (76, 34, 4, 39, '2023-01-01', '2023-01-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (77, 34, 4, 39, '2023-05-01', '2023-05-14');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (78, 35, 4, 42, '2023-05-15', '2023-06-10');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (79, 35, 4, 42, '2023-12-01', '2023-12-23');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (80, 36, 4, 48, '2023-02-01', '2023-02-15');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (81, 36, 4, 48, '2023-06-11', '2023-08-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (82, 39, 4, 50, '2023-10-01', '2023-11-21');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (83, 39, 4, 50, '2023-11-25', '2023-11-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (84, 43, 4, 53, '2023-02-16', '2023-02-28');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (85, 43, 4, 53, '2023-03-01', '2023-04-01');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (86, 43, 4, 53, '2023-04-10', '2023-04-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (87, 43, 4, 53, '2023-11-22', '2023-11-24');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (88, 58, 4, 68, '2023-04-02', '2023-04-09');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (89, 58, 4, 68, '2023-12-24', '2023-12-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (90, 41, 5, 50, '2023-01-01', '2023-01-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (91, 41, 5, 50, '2023-05-01', '2023-05-14');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (92, 44, 5, 54, '2023-05-15', '2023-06-10');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (93, 44, 5, 54, '2023-12-01', '2023-12-23');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (94, 48, 5, 58, '2023-02-01', '2023-02-15');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (95, 48, 5, 58, '2023-06-11', '2023-08-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (96, 49, 5, 59, '2023-10-01', '2023-11-21');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (97, 49, 5, 59, '2023-11-25', '2023-11-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (98, 53, 5, 63, '2023-02-16', '2023-02-28');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (99, 53, 5, 63, '2023-03-01', '2023-04-01');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (100, 53, 5, 63, '2023-04-10', '2023-04-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (101, 53, 5, 63, '2023-11-22', '2023-11-24');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (102, 68, 5, 81, '2023-04-02', '2023-04-09');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (103, 68, 5, 81, '2023-12-24', '2023-12-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (104, 44, 6, 49, '2023-01-01', '2023-01-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (105, 44, 6, 49, '2023-05-01', '2023-05-14');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (106, 47, 6, 53, '2023-05-15', '2023-06-10');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (107, 47, 6, 53, '2023-12-01', '2023-12-23');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (108, 50, 6, 59, '2023-02-01', '2023-02-15');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (109, 50, 6, 59, '2023-06-11', '2023-08-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (110, 52, 6, 63, '2023-10-01', '2023-11-21');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (111, 52, 6, 63, '2023-11-25', '2023-11-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (112, 56, 6, 65, '2023-02-16', '2023-02-28');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (113, 56, 6, 65, '2023-03-01', '2023-04-01');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (114, 56, 6, 65, '2023-04-10', '2023-04-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (115, 56, 6, 65, '2023-11-22', '2023-11-24');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (116, 77, 6, 90, '2023-04-02', '2023-04-09');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (117, 77, 6, 90, '2023-12-24', '2023-12-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (118, 52, 7, 61, '2023-01-01', '2023-01-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (119, 52, 7, 61, '2023-05-01', '2023-05-14');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (120, 55, 7, 67, '2023-05-15', '2023-06-10');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (121, 55, 7, 67, '2023-12-01', '2023-12-23');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (122, 59, 7, 70, '2023-02-01', '2023-02-15');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (123, 59, 7, 70, '2023-06-11', '2023-08-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (124, 65, 7, 74, '2023-10-01', '2023-11-21');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (125, 65, 7, 74, '2023-11-25', '2023-11-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (126, 71, 7, 79, '2023-02-16', '2023-02-28');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (127, 71, 7, 79, '2023-03-01', '2023-04-01');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (128, 71, 7, 79, '2023-04-10', '2023-04-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (129, 71, 7, 79, '2023-11-22', '2023-11-24');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (130, 88, 7, 103, '2023-04-02', '2023-04-09');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (131, 88, 7, 103, '2023-12-24', '2023-12-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (132, 15, 9, 16, '2023-01-01', '2023-01-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (133, 15, 9, 16, '2023-05-01', '2023-05-14');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (134, 16, 9, 17, '2023-05-15', '2023-06-10');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (135, 16, 9, 17, '2023-12-01', '2023-12-23');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (136, 16, 9, 18, '2023-02-01', '2023-02-15');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (137, 16, 9, 18, '2023-06-11', '2023-08-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (138, 18, 9, 20, '2023-10-01', '2023-11-21');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (139, 18, 9, 20, '2023-11-25', '2023-11-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (140, 19, 9, 22, '2023-02-16', '2023-02-28');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (141, 19, 9, 22, '2023-03-01', '2023-04-01');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (142, 19, 9, 22, '2023-04-10', '2023-04-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (143, 19, 9, 22, '2023-11-22', '2023-11-24');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (144, 28, 9, 29, '2023-04-02', '2023-04-09');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (145, 28, 9, 29, '2023-12-24', '2023-12-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (146, 9, 10, 14, '2023-01-01', '2023-01-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (147, 9, 10, 14, '2023-05-01', '2023-05-14');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (148, 10, 10, 15, '2023-05-15', '2023-06-10');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (149, 10, 10, 15, '2023-12-01', '2023-12-23');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (150, 12, 10, 16, '2023-02-01', '2023-02-15');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (151, 12, 10, 16, '2023-06-11', '2023-08-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (152, 14, 10, 17, '2023-10-01', '2023-11-21');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (153, 14, 10, 17, '2023-11-25', '2023-11-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (154, 15, 10, 19, '2023-02-16', '2023-02-28');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (155, 15, 10, 19, '2023-03-01', '2023-04-01');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (156, 15, 10, 19, '2023-04-10', '2023-04-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (157, 15, 10, 19, '2023-11-22', '2023-11-24');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (158, 22, 10, 24, '2023-04-02', '2023-04-09');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (159, 22, 10, 24, '2023-12-24', '2023-12-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (160, 23, 11, 28, '2023-01-01', '2023-01-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (161, 23, 11, 28, '2023-05-01', '2023-05-14');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (162, 24, 11, 30, '2023-05-15', '2023-06-10');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (163, 24, 11, 30, '2023-12-01', '2023-12-23');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (164, 25, 11, 31, '2023-02-01', '2023-02-15');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (165, 25, 11, 31, '2023-06-11', '2023-08-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (166, 28, 11, 33, '2023-10-01', '2023-11-21');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (167, 28, 11, 33, '2023-11-25', '2023-11-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (168, 31, 11, 36, '2023-02-16', '2023-02-28');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (169, 31, 11, 36, '2023-03-01', '2023-04-01');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (170, 31, 11, 36, '2023-04-10', '2023-04-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (171, 31, 11, 36, '2023-11-22', '2023-11-24');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (172, 42, 11, 48, '2023-04-02', '2023-04-09');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (173, 42, 11, 48, '2023-12-24', '2023-12-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (174, 29, 12, 34, '2023-01-01', '2023-01-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (175, 29, 12, 34, '2023-05-01', '2023-05-14');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (176, 32, 12, 37, '2023-05-15', '2023-06-10');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (177, 32, 12, 37, '2023-12-01', '2023-12-23');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (178, 35, 12, 39, '2023-02-01', '2023-02-15');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (179, 35, 12, 39, '2023-06-11', '2023-08-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (180, 35, 12, 41, '2023-10-01', '2023-11-21');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (181, 35, 12, 41, '2023-11-25', '2023-11-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (182, 39, 12, 43, '2023-02-16', '2023-02-28');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (183, 39, 12, 43, '2023-03-01', '2023-04-01');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (184, 39, 12, 43, '2023-04-10', '2023-04-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (185, 39, 12, 43, '2023-11-22', '2023-11-24');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (186, 50, 12, 56, '2023-04-02', '2023-04-09');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (187, 50, 12, 56, '2023-12-24', '2023-12-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (188, 29, 13, 35, '2023-09-01', '2023-09-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (189, 32, 13, 38, '2023-01-01', '2023-01-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (190, 32, 13, 38, '2023-05-01', '2023-05-14');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (191, 31, 13, 41, '2023-05-15', '2023-06-10');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (192, 31, 13, 41, '2023-12-01', '2023-12-23');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (193, 33, 13, 44, '2023-02-01', '2023-02-15');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (194, 33, 13, 44, '2023-06-11', '2023-08-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (195, 39, 13, 45, '2023-10-01', '2023-11-21');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (196, 39, 13, 45, '2023-11-25', '2023-11-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (197, 43, 13, 49, '2023-02-16', '2023-02-28');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (198, 43, 13, 49, '2023-03-01', '2023-04-01');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (199, 43, 13, 49, '2023-04-10', '2023-04-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (200, 43, 13, 49, '2023-11-22', '2023-11-24');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (201, 60, 13, 67, '2023-04-02', '2023-04-09');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (202, 60, 13, 67, '2023-12-24', '2023-12-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (203, 35, 14, 40, '2023-09-01', '2023-09-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (204, 39, 14, 45, '2023-01-01', '2023-01-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (205, 39, 14, 45, '2023-05-01', '2023-05-14');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (206, 41, 14, 47, '2023-05-15', '2023-06-10');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (207, 41, 14, 47, '2023-12-01', '2023-12-23');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (208, 43, 14, 47, '2023-02-01', '2023-02-15');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (209, 43, 14, 47, '2023-06-11', '2023-08-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (210, 45, 14, 51, '2023-10-01', '2023-11-21');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (211, 45, 14, 51, '2023-11-25', '2023-11-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (212, 51, 14, 55, '2023-02-16', '2023-02-28');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (213, 51, 14, 55, '2023-03-01', '2023-04-01');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (214, 51, 14, 55, '2023-04-10', '2023-04-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (215, 51, 14, 55, '2023-11-22', '2023-11-24');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (216, 68, 14, 77, '2023-04-02', '2023-04-09');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (217, 68, 14, 77, '2023-12-24', '2023-12-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (218, 76, 15, 88, '2023-09-01', '2023-09-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (219, 81, 15, 91, '2023-01-01', '2023-01-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (220, 81, 15, 91, '2023-05-01', '2023-05-14');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (221, 88, 15, 97, '2023-05-15', '2023-06-10');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (222, 88, 15, 97, '2023-12-01', '2023-12-23');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (223, 91, 15, 102, '2023-02-01', '2023-02-15');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (224, 91, 15, 102, '2023-06-11', '2023-08-31');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (225, 101, 15, 114, '2023-10-01', '2023-11-21');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (226, 101, 15, 114, '2023-11-25', '2023-11-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (227, 110, 15, 124, '2023-02-16', '2023-02-28');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (228, 110, 15, 124, '2023-03-01', '2023-04-01');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (229, 110, 15, 124, '2023-04-10', '2023-04-30');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (230, 110, 15, 124, '2023-11-22', '2023-11-24');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (231, 133, 15, 145, '2023-04-02', '2023-04-09');
INSERT INTO public.point_value (point_value_id, weekday_rate, view_type_id, weekend_rate, start_date, end_date) OVERRIDING SYSTEM VALUE VALUES (232, 133, 15, 145, '2023-12-24', '2023-12-31');
