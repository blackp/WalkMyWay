import sqlite3

gt_conn = sqlite3.connect('google_transit.db')
wmw_conn = sqlite3.connect('WalkMyWay.sqlite')

gt_cursor = gt_conn.cursor()
wmw_cursor = wmw_conn.cursor()

walk_my_way_schema = """
CREATE TABLE ZAGENCY ( Z_PK INTEGER PRIMARY KEY, Z_ENT INTEGER, Z_OPT INTEGER, ZLANGUAGE VARCHAR, ZNAME VARCHAR, ZPHONENUMBER VARCHAR, ZTIMEZONE VARCHAR, ZURL VARCHAR );
CREATE TABLE ZROUTE ( Z_PK INTEGER PRIMARY KEY, Z_ENT INTEGER, Z_OPT INTEGER, ZNAME VARCHAR );
CREATE TABLE ZSCHEDULEDSTOP ( Z_PK INTEGER PRIMARY KEY, Z_ENT INTEGER, Z_OPT INTEGER, ZSEQUENCENUMBER INTEGER, ZSTOP INTEGER, ZTRIP INTEGER, ZARRIVALTIME VARCHAR, ZDEPARTURETIME VARCHAR );
CREATE TABLE ZSERVICE ( Z_PK INTEGER PRIMARY KEY, Z_ENT INTEGER, Z_OPT INTEGER, ZFRIDAYS INTEGER, ZMONDAYS INTEGER, ZSATURDAYS INTEGER, ZSUNDAYS INTEGER, ZTHURSDAYS INTEGER, ZTUESDAYS INTEGER, ZWEDNESDAYS INTEGER );
CREATE TABLE ZSERVICEEXCEPTION ( Z_PK INTEGER PRIMARY KEY, Z_ENT INTEGER, Z_OPT INTEGER, ZINCLUSION INTEGER, ZSERVICE INTEGER, ZDATE TIMESTAMP );
CREATE TABLE ZSTOP ( Z_PK INTEGER PRIMARY KEY, Z_ENT INTEGER, Z_OPT INTEGER, ZLATITUDE FLOAT, ZLONGITUDE FLOAT, ZNAME VARCHAR );
CREATE TABLE ZTRIP ( Z_PK INTEGER PRIMARY KEY, Z_ENT INTEGER, Z_OPT INTEGER, ZMAP INTEGER, ZROUTE INTEGER, ZSERVICE INTEGER );
CREATE TABLE ZTRIPMAP ( Z_PK INTEGER PRIMARY KEY, Z_ENT INTEGER, Z_OPT INTEGER );
CREATE TABLE ZWAYPOINT ( Z_PK INTEGER PRIMARY KEY, Z_ENT INTEGER, Z_OPT INTEGER, ZSEQUENCENUMBER INTEGER, ZMAP INTEGER, ZLATITUDE FLOAT, ZLONGITUDE FLOAT );
CREATE TABLE Z_METADATA (Z_VERSION INTEGER PRIMARY KEY, Z_UUID VARCHAR(255), Z_PLIST BLOB);
CREATE TABLE Z_PRIMARYKEY (Z_ENT INTEGER PRIMARY KEY, Z_NAME VARCHAR, Z_SUPER INTEGER, Z_MAX INTEGER);
CREATE INDEX ZSCHEDULEDSTOP_ZSTOP_INDEX ON ZSCHEDULEDSTOP (ZSTOP);
CREATE INDEX ZSCHEDULEDSTOP_ZTRIP_INDEX ON ZSCHEDULEDSTOP (ZTRIP);
CREATE INDEX ZSERVICEEXCEPTION_ZSERVICE_INDEX ON ZSERVICEEXCEPTION (ZSERVICE);
CREATE INDEX ZTRIP_ZMAP_INDEX ON ZTRIP (ZMAP);
CREATE INDEX ZTRIP_ZROUTE_INDEX ON ZTRIP (ZROUTE);
CREATE INDEX ZTRIP_ZSERVICE_INDEX ON ZTRIP (ZSERVICE);
CREATE INDEX ZWAYPOINT_ZMAP_INDEX ON ZWAYPOINT (ZMAP);
"""

wmw_conn.execute("DELETE FROM ZAGENCY")
wmw_conn.execute("DELETE FROM ZROUTE")
wmw_conn.execute("DELETE FROM ZSCHEDULEDSTOP")
wmw_conn.execute("DELETE FROM ZSERVICE")
wmw_conn.execute("DELETE FROM ZSERVICEEXCEPTION")
wmw_conn.execute("DELETE FROM ZSTOP")
wmw_conn.execute("DELETE FROM ZTRIP")
wmw_conn.execute("DELETE FROM ZTRIPMAP")
wmw_conn.execute("DELETE FROM ZWAYPOINT")

wmw_cursor.execute("select Z_NAME, Z_ENT from Z_PRIMARYKEY")
entity_dict = {row[0]: row[1] for row in wmw_cursor.fetchall()}

print entity_dict

pk = {"Route": {}, "Agency": {}, "Stop": {}, "TripMap": {}, "WayPoint": {}, "Service": {}, "Trip": {}, "ScheduledStop": {}}

maxId = 0

gt_cursor.execute("select * from routes")
for row in gt_cursor:

    id =  row[0]
    name = row[1]

    values = (entity_dict["Route"], 1, name)
    wmw_cursor.execute("INSERT INTO ZROUTE (Z_ENT, Z_OPT, ZNAME) VALUES (?, ?, ?)", values)
    pk["Route"][id] = wmw_cursor.lastrowid

gt_cursor.execute("select * from agency")
for row in gt_cursor:

    name, url, timezone, language, phone = row

    values = (entity_dict["Agency"], 1, language, name, phone, timezone, url)

    wmw_cursor.execute("INSERT INTO ZAGENCY (Z_ENT, Z_OPT, ZLANGUAGE, ZNAME, ZPHONENUMBER, ZTIMEZONE, ZURL) VALUES (?, ?, ?, ?, ?, ?, ?)", values)
    pk["Agency"][name] = wmw_cursor.lastrowid

gt_cursor.execute("select stop_id, stop_lat, stop_lon, stop_name from stops")
for row in gt_cursor:
    id, lat, lng, name = row
    values = (entity_dict["Stop"], 1, lat, lng, name)
    wmw_cursor.execute("INSERT INTO ZSTOP (Z_ENT, Z_OPT, ZLATITUDE, ZLONGITUDE, ZNAME) VALUES (?, ?, ?, ?, ?)", values)
    pk["Stop"][id] = wmw_cursor.lastrowid

gt_cursor.execute("SELECT shape_id, shape_pt_lat, shape_pt_lon, shape_pt_sequence FROM shapes")
for row in gt_cursor:
    trip_map_id_gt, lat, lng, sequence_number = row
    if trip_map_id_gt not in pk["TripMap"].keys():
        values = (entity_dict["TripMap"], 1)
        wmw_cursor.execute("INSERT INTO ZTRIPMAP (Z_ENT, Z_OPT) VALUES (?, ?)", values)
        pk["TripMap"][trip_map_id_gt] = wmw_cursor.lastrowid

    trip_map_id = pk["TripMap"][trip_map_id_gt]
    values = (entity_dict["WayPoint"], 1, sequence_number, trip_map_id, lat, lng)
    wmw_cursor.execute("INSERT INTO ZWAYPOINT (Z_ENT, Z_OPT, ZSEQUENCENUMBER, ZMAP, ZLATITUDE, ZLONGITUDE) VALUES (?, ?, ?, ?, ?, ?)", values)
    waypoint_pk = wmw_cursor.lastrowid
    pk["WayPoint"][waypoint_pk] = waypoint_pk

gt_cursor.execute("SELECT service_id, monday, tuesday, wednesday, thursday, friday, saturday, sunday FROM calendar")
for row in gt_cursor:
    service_id, monday, tuesday, wednesday, thursday, friday, saturday, sunday = row
    values = (entity_dict["Service"], 1, monday, tuesday, wednesday, thursday, friday, saturday, sunday)
    wmw_cursor.execute("INSERT INTO ZSERVICE (Z_ENT, Z_OPT, ZMONDAYS, ZTUESDAYS, ZWEDNESDAYS, ZTHURSDAYS, ZFRIDAYS, ZSATURDAYS, ZSUNDAYS) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", values)
    pk["Service"][service_id] = wmw_cursor.lastrowid

gt_cursor.execute("select route_id, service_id, trip_id, shape_id from trips")
for row in gt_cursor:
    route_id_gt, service_id_gt, trip_id, trip_map_id_gt = row
    route_id = pk["Route"][route_id_gt]
    service_id = pk["Service"][service_id_gt]
    trip_map_id = pk["TripMap"][trip_map_id_gt]
    values = (entity_dict["Trip"], 1, trip_map_id, route_id, service_id)
    wmw_cursor.execute("INSERT INTO ZTRIP (Z_ENT, Z_OPT, ZMAP, ZROUTE, ZSERVICE) VALUES (?, ?, ?, ?, ?)", values)
    pk["Trip"][trip_id] = wmw_cursor.lastrowid

gt_cursor.execute("select trip_id, arrival_time, departure_time, stop_id, stop_sequence, pickup_type, drop_off_type from stop_times")
for row in gt_cursor:
    trip_id_gt, arrival_time, departure_time, stop_id_gt, stop_sequence, pickup_type, drop_off_type = row
    trip_id = pk["Trip"][trip_id_gt]
    stop_id = pk["Stop"][stop_id_gt]

    values = (entity_dict["ScheduledStop"], 1, stop_sequence, stop_id, trip_id, arrival_time, departure_time)
    wmw_cursor.execute("INSERT INTO ZSCHEDULEDSTOP (Z_ENT, Z_OPT, ZSEQUENCENUMBER, ZSTOP, ZTRIP, ZARRIVALTIME, ZDEPARTURETIME) VALUES (?, ?, ?, ?, ?, ?, ?)", values)
    scheduled_stop_pk = wmw_cursor.lastrowid
    pk["ScheduledStop"][scheduled_stop_pk] = scheduled_stop_pk

max_id = 0
for entity, pks in pk.iteritems():
    max_entity_id = max(pks.values())
    print entity, max_entity_id
    max_id = max(max_id, max_entity_id)
print max_id
wmw_conn.execute("update Z_PRIMARYKEY set Z_MAX=?", [max_id])

print "routes", pk["Route"]
print "agencies", pk["Agency"]
print "stops", pk["Stop"]
print "trip maps", pk["TripMap"]
print "services", pk["Service"]
print "waypoints", len(pk["WayPoint"])
print "trips", len(pk["Trip"])
print "scheduled stops", len(pk["ScheduledStop"])

wmw_conn.commit()
