IDENTIFICATION DIVISION.
PROGRAM-ID. ARITH-CALC.

DATA DIVISION. 
WORKING-STORAGE SECTION. 
  01 NUM1 PIC 9(3) VALUE 100.
  01 NUM 2 PIC 9(3) VALUE 50.
  01 RESULT PIC 9(5)V99.

PROCEDURE DIVISION. 
MAIN- PROSECUDER. 

  DISPLAY "COBOL Arithmitic Calculator".
  DISPLAY "___________________________". 

*Preform Addition
  ADD NUM1 TO NUM2 GIVING RESULT. 
  DISPLAY "Addition result: "RESULT.

*Preform Subtraction
  SUBTRACT NUM2 FROM NUM1 GIVING RESULT. 
  DISPLAY "Subtraction Result: " RESULT. 

  *Preform Multiplication 
    MULTIPLY NUM1 BY NUM2 GIVING RESULT.
    DISPLAY "Multiplication Result: " RESULT.

  *Preform Division
      DIVIDE NUM1 BY NUM2 GIVING RESULT. 
      DISPLAY "Division Result: " RESULT. 

      STOP RUN. 


      
IDENTIFICATION DIVISION.
       PROGRAM-ID. ARITH-CALC.

       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01 NUM1    PIC 9(3) VALUE 100.
       01 NUM2    PIC 9(3) VALUE 50.
       01 RESULT  PIC 9(5)V99.

       PROCEDURE DIVISION. 
       MAIN-PROCEDURE. 

           DISPLAY "COBOL Arithmetic Calculator".
           DISPLAY "---------------------------". 

      *Perform Addition
           ADD NUM1 TO NUM2 GIVING RESULT. 
           DISPLAY "Addition result: " RESULT.

      *Perform Subtraction
           SUBTRACT NUM2 FROM NUM1 GIVING RESULT. 
           DISPLAY "Subtraction Result: " RESULT. 

      *Perform Multiplication 
           MULTIPLY NUM1 BY NUM2 GIVING RESULT.
           DISPLAY "Multiplication Result: " RESULT.

      *Perform Division
           DIVIDE NUM1 BY NUM2 GIVING RESULT. 
           DISPLAY "Division Result: " RESULT. 

           STOP RUN.
