       IDENTIFICATION DIVISION. 
       PROGRAM-ID. READ-EMP1.
       AUTHOR. JAKKRIT

       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL. 
           SELECT EMP-FILE ASSIGN TO "emp1.dat"
              ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION. 
       FILE SECTION.
       FD  EMP-FILE.
       01  EMP-DETAILS.
           88 END-OF-EMP-FILE VALUE HIGH-VALUE .
           05 EMP-SSN PIC 9(9).
           05 EMP-NAME.
              10 EMP-SURNAME PIC X(15).
              10 EMP-FORNAME PIC X(10).
           05 EMP-DATE-OF-BIRTH.
              10 EMP-YOB PIC 9(4).
              10 EMP-MOB PIC 9(2).
              10 EMP-DOB PIC 9(2).
           05 EMP-GENDER PIC X.

       PROCEDURE DIVISION.
       BEGIN.
           OPEN OUTPUT EMP-FILE 
            
           PERFORM UNTIL END-OF-EMP-FILE 
              READ EMP-FILE
                 AT END SET END-OF-EMP-FILE TO TRUE
              END-READ
              IF NOT END-OF-EMP-FILE THEN
                 DISPLAY "=========================================="
                 DISPLAY  "SSN : " EMP-SSN
                 DISPLAY  "NAME : " EMP-FORNAME "  " EMP-SURNAME
                 DISPLAY  "DoB : " EMP-YOB "/" EMP-MOB "/" EMP-DOB
                 DISPLAY  "Gender : " EMP-GENDER 
              END-IF
           END-PERFORM
           
           CLOSE EMP-FILE 
           GOBACK 
           .
