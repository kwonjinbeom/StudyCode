select * from theater;

select * from show;

CREATE TABLE HALL (
	hall_id	NUMBER	    NOT NULL,
	hall_place	VARCHAR2(100)		NULL,
	hall_turn	VARCHAR2(100)		NULL,
    hall_time	VARCHAR2(100)		NULL,
    hall_seatNum NUMBER NULL,
    hall_date VARCHAR2(1000) NOT NULL,
    hall_start VARCHAR2(1000) NOT NULL,
    hall_end VARCHAR2(1000) NOT NULL,
    hall_regdate	DATE	DEFAULT SYSDATE	NULL,
	hall_update	DATE		NULL,
    th_num	NUMBER(20)		NOT NULL,
    CONSTRAINT HALL_hall_date_UK UNIQUE(hall_date)
);
CREATE SEQUENCE HALL_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
CACHE 2;
select * from hall;

-- th_num=1 hall테이블 샘플 3개
INSERT INTO HALL
VALUES(HALL_SEQ.nextval, '3관', '2회차','12:00', 30, '2023-03-02', '2023-03-02', '2023-03-16', SYSDATE, SYSDATE, 1);
INSERT INTO HALL
VALUES(HALL_SEQ.nextval, '2관', '1회차','08:00', 50, '2023-03-03', '2023-03-02', '2023-03-16', SYSDATE, SYSDATE, 1);
INSERT INTO HALL
VALUES(HALL_SEQ.nextval, '3관', '3회차','15:00', 40, '2023-03-04', '2023-03-02', '2023-03-16', SYSDATE, SYSDATE, 1);

-- th_num=2 hall테이블 샘플 3개
INSERT INTO HALL
VALUES(HALL_SEQ.nextval, '1관', '3회차','11:00', 40, '2023-03-02', '2023-03-02', '2023-03-16', SYSDATE, SYSDATE, 2);
INSERT INTO HALL
VALUES(HALL_SEQ.nextval, '2관', '1회차','18:00', 40, '2023-03-03', '2023-03-02', '2023-03-16', SYSDATE, SYSDATE, 2);
INSERT INTO HALL
VALUES(HALL_SEQ.nextval, '1관', '2회차','20:00', 30, '2023-03-04', '2023-03-02', '2023-03-16', SYSDATE, SYSDATE, 2);

-- PL/SQL LOOP, FOR문  -- th_num=1 hall테이블 더미 날짜데이터 샘플 12?개 ----
DECLARE
    hall_date VARCHAR2(1000)    := '2023-03-0';
    hall_start VARCHAR2(1000)   := '2023-03-02';
    hall_end VARCHAR2(1000)     := '2023-03-16';
    th_num	NUMBER(20)          := 2;
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




-- seat테이블 데이터 등록
select * from hall;
select * from seat;
--drop table seat;
--truncate table seat;
-- 좌석데이터 더미 생성
DECLARE
    hall_id	NUMBER   := 1;
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


DECLARE
    hall_id	NUMBER   := 2;
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


-- TICKET 테이블 샘플 데이터
INSERT INTO TICKET(ti_num, seat_date, ti_status, u_id)
VALUES(TICKET_SEQ.nextval, SYSDATE, 0, 'yubin');
INSERT INTO TICKET(ti_num, seat_date, ti_status, u_id)
VALUES(TICKET_SEQ.nextval, SYSDATE, 1, 'user02');

-- TICKET_SEAT 테이블 샘플 데이터
INSERT INTO TICKET_SEAT
VALUES(5,3,1);
INSERT INTO TICKET_SEAT
VALUES(5,9,1);
select * from TICKET_SEAT;

commit;

