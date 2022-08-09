       IDENTIFICATION DIVISION. 
       PROGRAM-ID. WRITE-GRADE1.
       AUTHOR. JAKKRIT

       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL. 
           SELECT SCORE-FILE ASSIGN TO "score.dat"
              ORGANIZATION IS LINE SEQUENTIAL.
           SELECT GRADE-FILE ASSIGN TO "grade.dat"
              ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION. 
       FILE SECTION.
       FD  SCORE-FILE.
       01  SCORE-DETAIL.
           88 END-OF-SCORE-FILE VALUE HIGH-VALUE .
           05 STU-ID PIC X(8).
           05 MIDTERM PIC 9(2)V9(2).
           05 FINAL-SCORE PIC 9(2)V9(2).
           05 PROJECT-SCORE PIC 9(2)V9(2).

       FD  GRADE-FILE.
       01  GRADE-DETAIL.
           05    STU-ID      PIC X(8).
           05    SUM-SCORE   PIC 9(3)V9(2).
           05    GRADE       PIC X(2).

       
       
       PROCEDURE DIVISION.
       000-BEGIN.
           OPEN INPUT  SCORE-FILE 
           OPEN OUTPUT  GRADE-FILE 
           PERFORM  UNTIL END-OF-SCORE-FILE 
              READ SCORE-FILE 
                 AT END SET END-OF-SCORE-FILE TO TRUE
              END-READ
              IF NOT END-OF-SCORE-FILE THEN
                 PERFORM 001-PROCESS THRU 001-EXIT 
              END-IF 
           END-PERFORM

           CLOSE SCORE-FILE 
           CLOSE GRADE-FILE 
           GOBACK 
           .

       001-PROCESS.
           MOVE STU-ID IN SCORE-DETAIL TO STU-ID IN GRADE-DETAIL 
           COMPUTE SUM-SCORE = MIDTERM + FINAL-SCORE + PROJECT-SCORE           
           EVALUATE TRUE 
              WHEN SUM-SCORE >= 80 MOVE "A" TO GRADE
              WHEN SUM-SCORE >= 75 MOVE "B+" TO GRADE
              WHEN SUM-SCORE >= 70 MOVE "B" TO GRADE
              WHEN SUM-SCORE >= 65 MOVE "C+" TO GRADE
              WHEN SUM-SCORE >= 60 MOVE "C" TO GRADE
              WHEN SUM-SCORE >= 55 MOVE "D+" TO GRADE
              WHEN SUM-SCORE >= 50 MOVE "D" TO GRADE
              WHEN OTHER MOVE "F" TO GRADE 
           END-EVALUATE

           DISPLAY STU-ID IN SCORE-DETAIL "  " SUM-SCORE "  " Grade 
           WRITE GRADE-DETAIL   
           .
       001-EXIT.
           EXIT.
           