# 1dpf embryo startle response protocol at 32 degrees Celcius
## Sofia Vamos, UCD - last updated in February 2024

SET THERMOSTAT 33

DEFINE THRESHOLD 5	 #sets the threshold value for MSD tracking 

DEFINE NUM_SAMPLES 60 	# Number of times the action ACTIVITY_SAMPLE is repeated										
DEFINE TIME_BIN 1		# Time bin for data collection (seconds)
DEFINE NUM_SEQUENCE 3	# Number of times the action SEQUENCE is repeated 

# bitmap is required in your assets directory	
LOAD(ARENAS,"a96embryo.bmp")
    
# Required for MSD tracking
SET(MSD_MODE,ON)
SET(MSD_THRESHOLD,THRESHOLD)

# sets the voltage so light stim plate is off at start of experiment 
SET(VOLTAGE4,ON) 
SET(VOLTAGE_LEVEL,10000)

# These GPO commands will keep the light off until a ZCOMMAND is run 
SET(GPO3,0)
SET(GPO4,0)
##########################################

ACTION MAIN
    
    INVOKE(LIGHTS_OFF) # Turns overhead lights off at the start of experiment
    
# Sets the data output counter labels to begin at 0. The counter is used in the script below to label the data in numerical order.
	SET(COUNTER1,COUNTER_ZERO)					# time bin counter 
    SET(COUNTER2,COUNTER_ZERO)					# block counter - increments at the start of each block  

# Creates headers for columns in the data file
	LOGCREATE("TEXT:RUNTIME|TEXT:TEMPERATURE|TEXT:TIME_BIN|TEXT:BLOCK|TEXT:CONDITION")
	LOGAPPEND("TEXT:A1|TEXT:A2|TEXT:A3|TEXT:A4|TEXT:A5|TEXT:A6")
    LOGAPPEND("TEXT:A7|TEXT:A8|TEXT:A9|TEXT:A10|TEXT:A11|TEXT:A12")
    LOGAPPEND("TEXT:B1|TEXT:B2|TEXT:B3|TEXT:B4|TEXT:B5|TEXT:B6")
    LOGAPPEND("TEXT:B7|TEXT:B8|TEXT:B9|TEXT:B10|TEXT:B11|TEXT:B12")
    LOGAPPEND("TEXT:C1|TEXT:C2|TEXT:C3|TEXT:C4|TEXT:C5|TEXT:C6")
    LOGAPPEND("TEXT:C7|TEXT:C8|TEXT:C9|TEXT:C10|TEXT:C11|TEXT:C12")
    LOGAPPEND("TEXT:D1|TEXT:D2|TEXT:D3|TEXT:D4|TEXT:D5|TEXT:D6")
    LOGAPPEND("TEXT:D7|TEXT:D8|TEXT:D9|TEXT:D10|TEXT:D11|TEXT:D12")    
    LOGAPPEND("TEXT:E1|TEXT:E2|TEXT:E3|TEXT:E4|TEXT:E5|TEXT:E6")
    LOGAPPEND("TEXT:E7|TEXT:E8|TEXT:E9|TEXT:E10|TEXT:E11|TEXT:E12")
    LOGAPPEND("TEXT:F1|TEXT:F2|TEXT:F3|TEXT:F4|TEXT:F5|TEXT:F6")
    LOGAPPEND("TEXT:F7|TEXT:F8|TEXT:F9|TEXT:F10|TEXT:F11|TEXT:F12")
    LOGAPPEND("TEXT:G1|TEXT:G2|TEXT:G3|TEXT:G4|TEXT:G5|TEXT:G6")
    LOGAPPEND("TEXT:G7|TEXT:G8|TEXT:G9|TEXT:G10|TEXT:G11|TEXT:G12")
    LOGAPPEND("TEXT:H1|TEXT:H2|TEXT:H3|TEXT:H4|TEXT:H5|TEXT:H6")
    LOGAPPEND("TEXT:H7|TEXT:H8|TEXT:H9|TEXT:H10|TEXT:H11|TEXT:H12")
    LOGRUN()

	INVOKE(BASELINE_SAMPLE,NUM_SAMPLES) #collects baseline data
    
	INVOKE(SEQUENCE,NUM_SEQUENCE)		#INVOKEs the action SEQUENCE and repeats it NUM_SEQUENCE
    									#both values are DEFINEd at the top of the script 
    	
COMPLETE


########################################
ACTION SEQUENCE   
   
	SET(COUNTER2,COUNTER_INC)	#Counts the number of times the sequence is repeated 					 		

	INVOKE(PULSE_SAMPLE,1)		# Will collect one data point of data which has the light pulse     
    INVOKE(POST_PULSE_SAMPLE,NUM_SAMPLES) # will collect NUM_SAPLES data points after the light pulse 
    
COMPLETE



ACTION BASELINE_SAMPLE

	SET(COUNTER1,COUNTER_INC)	# increments the time bin counter 						
    
	LOGDATA(DATA_SNAPSHOT,"begin")   # starts a snapshot of data 
    
  	WAIT(TIME_BIN)	# waits the time bin 				

	LOGDATA(DATA_SNAPSHOT,"end")     # ends the snapshot of data    
    
# The following lines of code process the data between snapshot begin & snapshot end     
	LOGDATA(DATA_SELECT,"begin")                        
	LOGDATA(DATA_DELTA,"end")  

# The porcessed data is exported to the data file using the following lines 
	LOGCREATE("RUNTIME|TEMPERATURE1")
	LOGAPPEND("COUNTER1|COUNTER2|TEXT:BASELINE|ARENA_ACTIVITY:*")
    LOGRUN()
   
COMPLETE



ACTION PULSE_SAMPLE

	SET(COUNTER1,COUNTER_INC)	
    
 	ZCOMMAND("G3#1,P500,G3#0")    	#generates a 500ms light pulse (defined by P for pause)    
	LOGDATA(DATA_SNAPSHOT,"begin")   
    
  	WAIT(TIME_BIN)

	LOGDATA(DATA_SNAPSHOT,"end")                       
	LOGDATA(DATA_SELECT,"begin")                        
	LOGDATA(DATA_DELTA,"end")  
                         
	LOGCREATE("RUNTIME|TEMPERATURE1")
	LOGAPPEND("COUNTER1|COUNTER2|TEXT:PULSE|ARENA_ACTIVITY:*")
    LOGRUN()
   
COMPLETE



ACTION POST_PULSE_SAMPLE

	SET(COUNTER1,COUNTER_INC)							
    
	LOGDATA(DATA_SNAPSHOT,"begin")   
    
  	WAIT(TIME_BIN)

	LOGDATA(DATA_SNAPSHOT,"end")                       
	LOGDATA(DATA_SELECT,"begin")                        
	LOGDATA(DATA_DELTA,"end")  
                         
	LOGCREATE("RUNTIME|TEMPERATURE1")
	LOGAPPEND("COUNTER1|COUNTER2|TEXT:POST_PULSE|ARENA_ACTIVITY:*")
    LOGRUN()
   
COMPLETE



ACTION LIGHTS_OFF

	SET(GPO6,0)
	SET(GPO7,0)
	SET(GPO8,0)

COMPLETE


ACTION LIGHTS_ON

	SET(GPO6,1)
	SET(GPO7,1)
	SET(GPO8,1)

COMPLETE
