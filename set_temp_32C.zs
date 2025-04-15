# to set thermostat at 34

# This script demonstrates how to quickly set the temperature in the unit for the standard temperature control.
# This is a sample script that illustrates how zanscript can be written to control temperature within the MWP.
# IT IS VITAL THE FAN IS WORKING - PLEASE MAKE SURE IT IS PLUGGED IN AND WORKING 

# if you are using the Peltier temperature control unit you will need to set it appropriately with the following command
# SET(TCS_MODE,PELTIER)

DEFINE NUMBER_OF_BINS 1000
DEFINE BIN_TIME_SECS 1


# SET THE REQUIRED TEMPERATURE BETWEEN 1 AND 40 IN DEGREES CENTIGRADE
# SET(THERMOSTAT,0)  # THIS COMMAND STOPS THE THERMOSTAT WORKING
SET(THERMOSTAT,33)
    

ACTION MAIN

    WAIT(1)
# there is the capacity (not normally required) to record more temperatures from thermistors attched to CN4 of the upper board
    LOGCREATE("TEXT:TIME|TEXT:OUTLET_TEMP|TEXT:TEMP2|TEXT:TEMP3|TEXT:TEMP4")
    LOGRUN()

	INVOKE(MTEMP,NUMBER_OF_BINS)

COMPLETE


ACTION MTEMP
    
	WAIT(BIN_TIME_SECS)

 	LOGCREATE("RUNTIME|TEMPERATURE1")
 	LOGAPPEND("TEMPERATURE2|TEMPERATURE3|TEMPERATURE4")
	LOGRUN()

COMPLETE


