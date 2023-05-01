
-- th_num=1 hall테이블 샘플 3개
INSERT INTO HALL
VALUES(HALL_SEQ.nextval, '3관', '2회차','12:00', 30, '2023-03-02', '2023-03-02', '2023-03-16', SYSDATE, SYSDATE, 1);
INSERT INTO HALL
VALUES(HALL_SEQ.nextval, '2관', '1회차','08:00', 50, '2023-03-03', '2023-03-02', '2023-03-16', SYSDATE, SYSDATE, 1);
INSERT INTO HALL
VALUES(HALL_SEQ.nextval, '3관', '3회차','15:00', 40, '2023-03-04', '2023-03-02', '2023-03-16', SYSDATE, SYSDATE, 1);

-- th_num=2 hall테이블 샘플 3개
INSERT INTO HALL
VALUES(HALL_SEQ.nextval, '1관', '3회차','11:00', 40, '2023-07-04', '2023-07-04', '2023-07-30', SYSDATE, SYSDATE, 2);
INSERT INTO HALL
VALUES(HALL_SEQ.nextval, '2관', '1회차','18:00', 40, '2023-07-05', '2023-07-04', '2023-07-30', SYSDATE, SYSDATE, 2);
INSERT INTO HALL
VALUES(HALL_SEQ.nextval, '1관', '2회차','20:00', 30, '2023-07-06', '2023-07-04', '2023-07-30', SYSDATE, SYSDATE, 2);

-- PL/SQL LOOP, FOR문  -- th_num=1 hall테이블 더미 날짜데이터 샘플 12?개 ----

DECLARE
    hall_date VARCHAR2(1000)    := '2023-03-0';
    hall_start VARCHAR2(1000)   := '2023-03-02';
    hall_end VARCHAR2(1000)     := '2023-03-16';
    th_num   NUMBER(20)          := 1;
BEGIN
    FOR i IN 5 .. 16 LOOP
     IF i >= 10 THEN hall_date := '2023-03-';
    INSERT INTO HALL(hall_id,hall_date,hall_start, hall_end, th_num, hall_update)
    VALUES
    (HALL_SEQ.nextval, hall_date || i, hall_start, hall_end, th_num, SYSDATE);
     ELSE
     INSERT INTO HALL(hall_id,hall_date,hall_start, hall_end, th_num, hall_update)
    VALUES
    (HALL_SEQ.nextval, hall_date || i, hall_start, hall_end, th_num, SYSDATE);
     END IF;
   END LOOP;
    COMMIT;
END;
/

DECLARE
    hall_date VARCHAR2(1000)    := '2023-07-';
    hall_start VARCHAR2(1000)   := '2023-07-07';
    hall_end VARCHAR2(1000)     := '2023-07-30';
    th_num   NUMBER(20)          := 2;
BEGIN
    FOR i IN 7 .. 30 LOOP
    INSERT INTO HALL(hall_id,hall_date,hall_start, hall_end, th_num, hall_update)
    VALUES(HALL_SEQ.nextval, hall_date || i, hall_start, hall_end, th_num, SYSDATE);
   END LOOP;
    COMMIT;
END;
/




-- 좌석데이터 더미 생성
DECLARE
    hall_id   NUMBER   := 1;
    i NUMBER := 0;
    j NUMBER := 0;
    k NUMBER := 0;
    seat_n VARCHAR2(200) := 'a';
BEGIN
    LOOP
        i := i + 1;
        j := j + 1;
        k := k + 1;
        
    IF j <= 6 THEN seat_n := 'a-';
    INSERT INTO seat(seat_num, hall_id, seat_name)
    VALUES(j, hall_id, seat_n || i);
    
    ELSIF j = 7 THEN seat_n := 'b-'; i := 1;
    INSERT INTO seat(seat_num, hall_id, seat_name)
    VALUES(j, hall_id, seat_n || i);
    
    
    ELSIF j <= 12 and j > 7 THEN 
    INSERT INTO seat(seat_num, hall_id, seat_name)
    VALUES(j, hall_id, seat_n || i);    
    
    ELSIF j = 13 THEN seat_n := 'c-';  i := 1;
    INSERT INTO seat(seat_num, hall_id, seat_name)
    VALUES(j, hall_id, seat_n || i);
    
    ELSIF j <= 22 and j > 13 THEN
    INSERT INTO seat(seat_num, hall_id, seat_name)
    VALUES(j, hall_id, seat_n || i);    
    
        ELSIF j = 23 THEN seat_n := 'd-';  i := 1;
    INSERT INTO seat(seat_num, hall_id, seat_name)
    VALUES(j, hall_id, seat_n || i);
    
    ELSIF j <= 30 and j > 23 THEN
    INSERT INTO seat(seat_num, hall_id, seat_name)
    VALUES(j, hall_id, seat_n || i); 
    
        END IF;
        EXIT WHEN j >30;
   END LOOP;
    COMMIT;
END;
/


DECLARE
    hall_id   NUMBER   := 2;
    i NUMBER := 0;
    j NUMBER := 0;
    k NUMBER := 0;
    seat_n VARCHAR2(200) := 'a';
BEGIN
    LOOP
        i := i + 1;
        j := j + 1;
        k := k + 1;
        
    IF j <= 6 THEN seat_n := 'a-';
    INSERT INTO seat(seat_num, hall_id, seat_name)
    VALUES(j, hall_id, seat_n || i);
    
    ELSIF j = 7 THEN seat_n := 'b-'; i := 1;
    INSERT INTO seat(seat_num, hall_id, seat_name)
    VALUES(j, hall_id, seat_n || i);
    
    
    ELSIF j <= 12 and j > 7 THEN 
    INSERT INTO seat(seat_num, hall_id, seat_name)
    VALUES(j, hall_id, seat_n || i);    
    
    ELSIF j = 13 THEN seat_n := 'c-';  i := 1;
    INSERT INTO seat(seat_num, hall_id, seat_name)
    VALUES(j, hall_id, seat_n || i);
    
    ELSIF j <= 22 and j > 13 THEN
    INSERT INTO seat(seat_num, hall_id, seat_name)
    VALUES(j, hall_id, seat_n || i);    
    
        ELSIF j = 23 THEN seat_n := 'd-';  i := 1;
    INSERT INTO seat(seat_num, hall_id, seat_name)
    VALUES(j, hall_id, seat_n || i);
 
    ELSIF j <= 32 and j > 23 THEN
    INSERT INTO seat(seat_num, hall_id, seat_name)
    VALUES(j, hall_id, seat_n || i); 
 
    ELSIF j = 33 THEN seat_n := 'e-';  i := 1;
    INSERT INTO seat(seat_num, hall_id, seat_name)
    VALUES(j, hall_id, seat_n || i);
    
     ELSIF j <= 40 and j > 32 THEN
    INSERT INTO seat(seat_num, hall_id, seat_name)
    VALUES(j, hall_id, seat_n || i); 
    
    END IF;
        EXIT WHEN j >40;
   END LOOP;
    COMMIT;
END;
/

update seat
set seat_status = 1
where seat_num = 3 and hall_id = 1;
update seat
set seat_status = 1
where seat_num = 9 and hall_id = 1;
update seat
set seat_status = 1
where seat_num = 13 and hall_id = 1;
update seat
set seat_status = 1
where seat_num = 17 and hall_id = 1;
update seat
set seat_status = 1
where seat_num = 13 and hall_id = 2;
update seat
set seat_status = 1
where seat_num = 17 and hall_id = 2;
update seat
set seat_status = 1
where seat_num = 30 and hall_id = 2;


commit;

-------------------------------------------좌석 데이터 만들기 Excel 전단계
DECLARE
    hall_seatN NUMBER := 0;
BEGIN
    FOR hall_id_TotalCount IN 1 .. 839 LOOP
        hall_seatN := 0;
        select hall_seatNum into hall_seatN from hall
        where hall_id= hall_id_TotalCount;
        
        if hall_seatN = 30 THEN 
            FOR seatNum_count IN 1 .. hall_seatN LOOP
                INSERT INTO seat(seat_num, hall_id, seat_name)
                VALUES(seatNum_count, hall_id_TotalCount, 'a'); 
            END LOOP;
       
        elsif hall_seatN = 40 THEN 
            FOR seatNum_count IN 1 .. hall_seatN LOOP
                INSERT INTO seat(seat_num, hall_id, seat_name)
                VALUES(seatNum_count, hall_id_TotalCount, 'a'); 
            END LOOP;
        
        elsif hall_seatN = 50 THEN 
            FOR seatNum_count IN 1 .. hall_seatN LOOP
                INSERT INTO seat(seat_num, hall_id, seat_name)
                VALUES(seatNum_count, hall_id_TotalCount, 'a'); 
            END LOOP;
        END IF;
        
        
    END LOOP;
    COMMIT;
END;
/
