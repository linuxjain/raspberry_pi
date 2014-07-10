/*
  It's a Linker script which will create final raspberry pi kernel image .
*/

SECTIONS 
{

/*  In this  section we will put the code which we want to be executed at first while kernel image loaded in RAM . We will put this code
    at address 0x8000 (according to raspberry pi convention) . 
*/
  
  .init 0x8000 :
  {
    *(.init)
  }

/*
    After .init we will load all the text data.
*/

  .text :
  {
    *(.text)
    
  }
  
/*
    After .test we will load all data .
*/

  .data :
  {
    *(.data)
    
  }
  
/*
    And if anything else is remaining , that thing and above sections will come in this section which will be discarded by default. 
*/  
  
  /DISCARD/ :
  {
    *(*)
  }
}
