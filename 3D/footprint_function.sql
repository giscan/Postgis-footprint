CREATE OR REPLACE FUNCTION footprint(origin geometry, pitch numeric,
bearing numeric, roll numeric, sensorw numeric, focal numeric, imagewidth integer, imageheight integer,
height numeric)
RETURNS geometry AS
$BODY$

WITH widthx AS
(
SELECT (sensorw * height * 100) / (focal * imagewidth) * imagewidth / 100 AS basex
),
widthy AS
(
SELECT (sensorw * height * 100) / (focal * imagewidth) * imageheight / 100 AS basey
),

iViewCone AS (
SELECT pyramidMaker(origin, basex::numeric, basey::numeric, height)
AS geom
FROM widthx, widthy
),

iViewRotated AS (
SELECT ST_RotateXYZ(geom, pi() - pitch, 0 - roll, pi() - bearing, origin) AS geom FROM iViewCone
)
SELECT geom FROM iViewRotated
;
$BODY$
LANGUAGE sql VOLATILE
COST 100;

