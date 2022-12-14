       IDENTIFICATION DIVISION. 
       PROGRAM-ID. WRITE-GRADE1.
       AUTHOR. JAKKRIT

       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL. 
           SELECT SCORE-FILE ASSIGN TO "score.dat"
              ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION. 
       FILE SECTION.
       FD  SCORE-FILE.
       01  SCORE-DETAIL.
           05 STU-ID PIC X(8).
           05 MIDTERM PIC 9(2)V9(2).
           05 FINAL-SCORE PIC 9(2)V9(2).
           05 PROJECT-SCORE PIC 9(2)V9(2).

       PROCEDURE DIVISION.
       BEGIN.
           OPEN OUTPUT SCORE-FILE 

           MOVE "39030001" TO STU-ID
           MOVE "34.05" TO MIDTERM
           MOVE "25.25" TO FINAL-SCORE
           MOVE "10.8" TO PROJECT-SCORE
           WRITE SCORE-DETAIL

           MOVE "39030002" TO STU-ID
           MOVE "20" TO MIDTERM
           MOVE "20" TO FINAL-SCORE
           MOVE "10" TO PROJECT-SCORE
           WRITE SCORE-DETAIL

           MOVE "39030003" TO STU-ID
           MOVE "30.8" TO MIDTERM
           MOVE "40" TO FINAL-SCORE
           MOVE "14.25" TO PROJECT-SCORE
           WRITE SCORE-DETAIL

           MOVE "39030004" TO STU-ID
           MOVE "10.8" TO MIDTERM
           MOVE "20" TO FINAL-SCORE
           MOVE "4.25" TO PROJECT-SCORE
           WRITE SCORE-DETAIL

           MOVE "39030005" TO STU-ID
           MOVE "40" TO MIDTERM
           MOVE "40" TO FINAL-SCORE
           MOVE "20" TO PROJECT-SCORE
           WRITE SCORE-DETAIL 

           CLOSE SCORE-FILE 
           GOBACK 
           .
