postgis-footprint
===========
Calculate footprint from camera. Derivated from Postgis Cookbook from @smathermather Stephen Mather
Real footprint is calculated here


------------------------------------------
FOOTPRINT FROM CAMERA AND ROLL, PITCH, YAW
------------------------------------------


Requirements : Need postgis-sfcgal


**CREATE FUNCTIONS FROM SQL FILES :**

ST_RotateX2

ST_RotateY2

ST_RotateXYZ

pyramidMaker

footprint_function



**POINT VECTOR LAYER NEED AT LEAST** 

roll, pitch, heading, filename of pictures, sensor width, focal length in mm, resolution width, resolution height, height

Name of attributes : pitch numeric, bearing numeric, roll numeric, sensorw numeric, focal numeric, imagewidth integer, imageheight integer, height numeric


**RUNNING AND DISLAY FOOTPRINT**

Adapt footprint_uas.sql : file is documented.
