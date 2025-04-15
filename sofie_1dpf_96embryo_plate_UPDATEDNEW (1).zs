# Generate arenas and dual zone assets for COSTAR BRAND 24-well plateS. 
# Dimensions are in mm. Assets can be found as .bmp files in assets directory after running the script  
# For this script to work you must have first run the calibration script with your black 96-well calibration plate

DEFINE SHOWTIME 1
DEFINE DRAWDELAY 0.5

DEFINE COL_STEP 9.35		# Spacing between wells, X
DEFINE ROW_STEP 9.35		# Spacing between wells, Y
DEFINE RADIUS 3.5			# Radius of well


# Generate arena and zone files
ACTION MAIN

# Geometric definition for a 24-well plate

    ResetDrawing()				# Restore everything to default (ClearDrawing just clears the image)
    @200 = 0					# Select arenas mode
	ShapeType(DISC,RADIUS)	   	# Template for arena overlay
    
    @90 = 16.00	# X Offset          # top left quarter
    @91 = 7.00	# Y Offset
    INVOKE(G24N_DRAW_1,1)			# Generate arenas
    WAIT(SHOWTIME)				# Delay for (auto) display of asset
	SaveDrawing("TEMP")	        # Save result to disk

    @90 = 79.00	# X Offset         # top right quarter
    @91 = 6.50	# Y Offset    
    INVOKE(G24N_DRAW_2,1)			# Generate arenas
    WAIT(SHOWTIME)				# Delay for (auto) display of asset
	SaveDrawing("TEMP")	        # Save result to disk

    @90 = 16.50	# X Offset        # lower left quarter
    @91 = 53.00	# Y Offset
    INVOKE(G24N_DRAW_3,1)			# Generate arenas
    WAIT(SHOWTIME)				# Delay for (auto) display of asset
	SaveDrawing("TEMP")	        # Save result to disk

    @90 = 79.00	# X Offset         # lower right quarter
    @91 = 53.00	# Y Offset
    INVOKE(G24N_DRAW_4,1)			# Generate arenas
    WAIT(SHOWTIME)				# Delay for (auto) display of asset
	SaveDrawing("a96embryo")	        # Save result to disk
    
COMPLETE   


# Generate 24-well arenas/zones (Costar). Uses @200 to select between arenas mode (if 0)
# and zones mode (in which case the variable contains the zone number).
ACTION G24N_DRAW_1 	
    
    @102 = 0							# Row counter
	@101 = @91						# Y_OFFSET position
	@110 = 1							# Arena
	while @102 < 4						# While more rows to do...
		@103 = 0						# Column
		@100 = @90					# X_OFFSET Position
		while @103 < 6					# While more columns to do....
        	if @200 = 0					# Arena or zones mode?
				SET(DrawArena,@110)		# Arena
            else
				SET(DrawZone,@200)		# Zone
			endif
			ShapeDraw(@100,@101)		# Put shape at current position
			#SaveDrawing("TEMP")	   		# Save temporary result to disk to see arenas drawn across on screen 
   			#WAIT(DRAWDELAY)				# Wait time between next arena drawn
    
            @100 = @100 + COL_STEP    	# Update X 
			@103 = @103 + 1				# Update Column
			@110 = @110 + 1				# Update arena counter
		endwhile						# ...columns
		@101 = @101 + ROW_STEP			# Update Y position
		@102 = @102 + 1					# Update row number
	endwhile							# ...rows

COMPLETE


ACTION G24N_DRAW_2
    
    @102 = 0							# Row counter
	@101 = @91						# Y_OFFSET position
	@110 = 25							# Arena
	while @102 < 4						# While more rows to do...
		@103 = 0						# Column
		@100 = @90					# X_OFFSET Position
		while @103 < 6					# While more columns to do....
        	if @200 = 0					# Arena or zones mode?
				SET(DrawArena,@110)		# Arena
            else
				SET(DrawZone,@200)		# Zone
			endif
			ShapeDraw(@100,@101)		# Put shape at current position
			#SaveDrawing("TEMP")	   		# Save temporary result to disk to see arenas drawn across on screen 
   			#WAIT(DRAWDELAY)				# Wait time between next arena drawn
    
            @100 = @100 + COL_STEP    	# Update X 
			@103 = @103 + 1				# Update Column
			@110 = @110 + 1				# Update arena counter
		endwhile						# ...columns
		@101 = @101 + ROW_STEP			# Update Y position
		@102 = @102 + 1					# Update row number
	endwhile							# ...rows

COMPLETE


ACTION G24N_DRAW_3
	
    @102 = 0							# Row counter
	@101 = @91						# Y_OFFSET position
	@110 = 49							# Arena
	while @102 < 4						# While more rows to do...
		@103 = 0						# Column
		@100 = @90					# X_OFFSET Position
		while @103 < 6					# While more columns to do....
        	if @200 = 0					# Arena or zones mode?
				SET(DrawArena,@110)		# Arena
            else
				SET(DrawZone,@200)		# Zone
			endif
			ShapeDraw(@100,@101)		# Put shape at current position
			#SaveDrawing("TEMP")	   		# Save temporary result to disk to see arenas drawn across on screen 
   			#WAIT(DRAWDELAY)				# Wait time between next arena drawn
    
            @100 = @100 + COL_STEP    	# Update X 
			@103 = @103 + 1				# Update Column
			@110 = @110 + 1				# Update arena counter
		endwhile						# ...columns
		@101 = @101 + ROW_STEP			# Update Y position
		@102 = @102 + 1					# Update row number
	endwhile							# ...rows

COMPLETE


ACTION G24N_DRAW_4
	
    @102 = 0							# Row counter
	@101 = @91						# Y_OFFSET position
	@110 = 73							# Arena
	while @102 < 4						# While more rows to do...
		@103 = 0						# Column
		@100 = @90					# X_OFFSET Position
		while @103 < 6					# While more columns to do....
        	if @200 = 0					# Arena or zones mode?
				SET(DrawArena,@110)		# Arena
            else
				SET(DrawZone,@200)		# Zone
			endif
			ShapeDraw(@100,@101)		# Put shape at current position
			#SaveDrawing("TEMP")	   		# Save temporary result to disk to see arenas drawn across on screen 
   			#WAIT(DRAWDELAY)				# Wait time between next arena drawn
    
            @100 = @100 + COL_STEP    	# Update X 
			@103 = @103 + 1				# Update Column
			@110 = @110 + 1				# Update arena counter
		endwhile						# ...columns
		@101 = @101 + ROW_STEP			# Update Y position
		@102 = @102 + 1					# Update row number
	endwhile							# ...rows

COMPLETE
