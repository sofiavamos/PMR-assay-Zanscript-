sofie_1dpf_96embryo_plate_UPDATEDNEW (1).zs -> this file lets the machine know how to read the custom made ZF embryo 96-well plate: turning each quarter of the plate into arenas, and each well into a zone (within which it will record the movements using mean pixel differences). 

set_temp_32C.zs -> sets the temperature of the machine to 32ºC

SV_1dpf_embryostresp_27C.zs -> PMR assay (243 seconds long) at 27ºC
SV_1dpf_embryostresp_32C.zs -> PMR assay (243 seconds long) at 32ºC

This PMR assay consists of recording movement activity per second data of each zebrafish embryo (1dpf) within each well. The commands tell the machine to records 60 seconds of baseline data in the dark, then create a 10ms light pulse, record 60 seconds of activity data, then create a second 10ms light pulse, record 60 seconds of activity data again, and then create a third 10ms light pulse, followed by 60 seconds of activity data collection. The assay ends after 243 seconds and the machine stops collecting the data then. 
