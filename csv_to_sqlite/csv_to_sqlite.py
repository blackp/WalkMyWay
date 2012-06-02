#!/usr/bin/env python

import os
import sqlite3
import csv

db_path = "google_transit.db"

schema = ["CREATE TABLE agency (agency_name TEXT, agency_url TEXT, agency_timezone TEXT, agency_lang TEXT, agency_phone TEXT)",
          "CREATE TABLE calendar (service_id TEXT , monday BOOL, tuesday BOOL, wednesday BOOL, thursday BOOL, friday BOOL, saturday BOOL, sunday BOOL, start_date TEXT, end_date TEXT)",
          "CREATE TABLE calendar_dates (service_id TEXT, date TEXT, exception_type INT)",
          "CREATE TABLE routes (route_id TEXT, route_short_name TEXT, route_long_name TEXT, route_desc TEXT, route_type INT, route_url TEXT)",
          "CREATE TABLE shapes (shape_id INT, shape_pt_lat REAL, shape_pt_lon REAL, shape_pt_sequence INT)",
          "CREATE TABLE stop_times (trip_id TEXT, arrival_time TEXT, departure_time TEXT, stop_id INT, stop_sequence INT, pickup_type INT, drop_off_type INT)",
          "CREATE TABLE stops (stop_id INT, stop_code TEXT, stop_name TEXT, stop_desc TEXT, stop_lat REAL, stop_lon REAL, zone_id INT, stop_url TEXT, location_type INT)",
          "CREATE TABLE trips (route_id TEXT, service_id TEXT, trip_id TEXT, trip_headsign TEXT, direction_id INT, block_id TEXT, shape_id INT)"]

if os.path.exists(db_path):
    os.unlink(db_path)
connection = sqlite3.connect(db_path)
for statement in schema:
    connection.execute(statement)
connection.commit()

for path, statement in [("../google_transit/agency.txt", "INSERT INTO agency VALUES (?, ?, ?, ?, ?)"),
                        ("../google_transit/calendar.txt", "INSERT INTO calendar VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"),
                        ("../google_transit/calendar_dates.txt", "INSERT INTO calendar_dates VALUES (?, ?, ?)"),
                        ("../google_transit/routes.txt", "INSERT INTO routes VALUES (?, ?, ?, ?, ?, ?)"),
                        ("../google_transit/shapes.txt", "INSERT INTO shapes VALUES (?, ?, ?, ?)"),
                        ("../google_transit/stop_times.txt", "INSERT INTO stop_times VALUES (?, ?, ?, ?, ?, ?, ?)"),
                        ("../google_transit/stops.txt", "INSERT INTO stops VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"),
                        ("../google_transit/trips.txt", "INSERT INTO trips VALUES (?, ?, ?, ?, ?, ?, ?)")]:
    rows = csv.reader(open(path))
    headers = rows.next()
    for row in rows:
        connection.execute(statement, row)
    connection.commit()

connection.commit()