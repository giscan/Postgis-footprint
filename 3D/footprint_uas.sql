CREATE TABLE footprintuas AS
	SELECT 1 AS gid, roll, pitch, heading, fileName,
		footprint(st_force3d(geom), radians(0)::numeric, radians(heading)::numeric, radians(roll)::numeric, 
		6.17::numeric, --sensor width
		4.3::numeric,  --focal legngth in mm
		4000::integer, --resolution width
		3000::integer, --resolution height
		((3.2808399 * altitude_a) - 838)::numeric) --height
		AS geom
		FROM uas_locations;
