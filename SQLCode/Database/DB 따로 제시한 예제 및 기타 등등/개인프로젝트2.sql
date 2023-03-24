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


INSERT INTO HALL
VALUES(HALL_SEQ.nextval, '3관', '2회차','12:00', 30, '2023-03-02', '2023-03-02', '2023-03-16', SYSDATE, SYSDATE, 1);
INSERT INTO HALL
VALUES(HALL_SEQ.nextval, '2관', '1회차','08:00', 50, '2023-03-03', '2023-03-02', '2023-03-16', SYSDATE, SYSDATE, 1);
INSERT INTO HALL
VALUES(HALL_SEQ.nextval, '3관', '3회차','15:00', 40, '2023-03-04', '2023-03-02', '2023-03-16', SYSDATE, SYSDATE, 1);

-- PL/SQL LOOP, FOR문  빈 데이터 만들기----
--DECLARE
--    hall_date VARCHAR2(1000)    := '2023-03-0';
--    hall_start VARCHAR2(1000)   := '2023-03-02';
--    hall_end VARCHAR2(1000)     := '2023-03-16';
--    th_num	NUMBER(20)          := 1;
--BEGIN
--	 FOR i IN 5 .. 16 LOOP
--     IF i >= 10 THEN hall_date := '2023-03-';
--	 INSERT INTO HALL(hall_id,hall_date,hall_start, hall_end, th_num, hall_update)
--	 VALUES
--	 (HALL_SEQ.nextval, hall_date || i, hall_start, hall_end, th_num, SYSDATE);
--     ELSE
--     INSERT INTO HALL(hall_id,hall_date,hall_start, hall_end, th_num, hall_update)
--	 VALUES
--	 (HALL_SEQ.nextval, hall_date || i, hall_start, hall_end, th_num, SYSDATE);
--     END IF;
--	END LOOP;
--    COMMIT;
--END;
--TRUNCATE TABLE hall;



select * 
from hall
where hall_id = 32;
select *
from theater t LEFT JOIN hall h
ON t.th_num = h.th_num
LEFT JOIN show s
ON t.th_num = s.th_num
where hall_id = 32;

select hall_id, s_name ,th_name, NVL(h.hall_place,'X') as hall_place, NVL(h.hall_turn,'X') as hall_turn,
		NVL(h.hall_seatNum,0) as hall_seatNum, NVL(hall_start,'X') as hall_start,hall_end, hall_date, hall_time
		from theater t LEFT JOIN hall h
		ON t.th_num = h.th_num
		LEFT JOIN show s
		ON t.th_num = s.th_num
WHERE t.th_num =1;

commit;

select distinct(t.th_num), s_name ,th_name, hall_start,hall_end,
TO_DATE(hall_end, 'YYYY-MM-DD') - TO_DATE(hall_start, 'YYYY-MM-DD') + 1 as date_gap, 
(select count(h.hall_id) from hall) as data_num 
from theater t LEFT JOIN hall h
ON t.th_num = h.th_num
LEFT JOIN show s
ON t.th_num = s.th_num;

--        
--        select t.th_num, s_name ,th_name, NVL(h.hall_place,'X') as hall_place, NVL(h.hall_turn,'X') as hall_turn,
--		NVL(h.hall_seatNum,0) as hall_seatNum,hall_date, NVL(hall_start,'X') as hall_start,hall_end,count(hall_id)
--		from theater t LEFT JOIN hall h
--		ON t.th_num = h.th_num
--		LEFT JOIN show s
--		ON t.th_num = s.th_num
--		WHERE t.th_num= 1
--        group by t.th_num;
commit;

select distinct(t.th_num), s_name ,th_name, hall_start,hall_end,
		TO_DATE(hall_end, 'YYYY-MM-DD') - TO_DATE(hall_start, 'YYYY-MM-DD') + 1 as date_gap, 
		(select count(h.hall_id) from hall) as data_num 
		from theater t LEFT JOIN hall h
		ON t.th_num = h.th_num
		LEFT JOIN show s
		ON t.th_num = s.th_num
		WHERE h.th_num= 1;
        
-- 예매 등록 
select distinct(h.hall_id), s_name ,th_name, h.hall_place as hall_place, h.hall_turn as hall_turn,
		h.hall_seatNum as hall_seatNum, hall_start,hall_end, hall_date, hall_time,
        ((select count(seat_num) from seat where hall_id =1)
        - (select count(seat_num) from seat where hall_id =1 and seat_status = 1)) as valid_seat 
		from theater t LEFT JOIN hall h
		ON t.th_num = h.th_num
		LEFT JOIN show s
		ON t.th_num = s.th_num
        LEFT JOIN seat se
		ON h.hall_id = se.hall_id
WHERE h.hall_id =1 ;

-- seat테이블 데이터 등록
select * from seat;

DECLARE
    hall_id	NUMBER   := 1;

BEGIN
	 FOR i IN 1 .. 50 LOOP
     
    INSERT INTO seat(seat_num, hall_id)
    VALUES(i, hall_id);
	END LOOP;
    COMMIT;
END;
