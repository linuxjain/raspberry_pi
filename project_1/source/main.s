/*
	It is a assembly file in which we will write the minimum code to light the OK LED of the raspberry pi board.
	Ok LED is connected to the 16th GPIO pin of the raspberry pi board.
*/

	.section .init  /* initial code of the kernel image */ 
	
	.global _start 	/* first block of code where the execution will jump.*/
	
	_start :
	
	#####################################
	
			ldr r0 , =0x20200000 ;  /* GPIO pin controller register address */
			
	#####################################		
			
			
	#####################################
			
			mov r1 , #1 ;			/* This block of code set the 16th GPIO pin to work as a output pin. */
			lsl r1 , #18 ;			/* For more information please look at the description file. */
			str r1 , [ r0 , #4] ;
			
	#####################################
			
	
	#####################################		
			
			mov r1 , #1 ;			/* This block of code set the 16th GPIO pin as Active Low i.e. whenever the signal will go low (in this 
							project all the time ) , OK LED will ligt. For more information please look at the description file. */
			lsl r1 , #16 ;
			str r1 , [r0 , #40] ;
			
	#####################################		
			
	#####################################		
			
	loop$ :							/* This block of code will keep busy CPU to execute branch instruction for infinite time. */	
			b loop$ 		
			
	#####################################
			
			
			
	
