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
    th_num	NUMBER(20)		NOT NULL
);
CREATE SEQUENCE HALL_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
CACHE 2;

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

-- PL/SQL LOOP, FOR문  -- th_num=1 hall테이블 샘플 12?개 ----
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




select * 
from hall
order by th_num,hall_date;
select *
from theater t LEFT JOIN hall h
ON t.th_num = h.th_num
LEFT JOIN show s
ON t.th_num = s.th_num
where hall_id = 32;

-- 예매등록에 필요한 데이터
select hall_id, s_name ,th_name, NVL(h.hall_place,'X') as hall_place, NVL(h.hall_turn,'X') as hall_turn,
		NVL(h.hall_seatNum,0) as hall_seatNum, NVL(hall_start,'X') as hall_start,hall_end, hall_date, hall_time, t.th_num
		from theater t LEFT JOIN hall h
		ON t.th_num = h.th_num
		LEFT JOIN show s
		ON t.th_num = s.th_num
WHERE t.th_num =1;
-- boardDetail에 보내줄 th_num값
select distinct(t.th_num), s_name ,th_name, hall_start,hall_end
from theater t LEFT JOIN hall h
ON t.th_num = h.th_num
LEFT JOIN show s
ON t.th_num = s.th_num
where t.th_num = 1;

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
		WHERE h.th_num= 2;
        
-- 예매 등록 
select distinct(h.hall_id), s_name ,th_name, h.hall_place as hall_place, h.hall_turn as hall_turn,
		h.hall_seatNum as hall_seatNum, hall_start,hall_end, hall_date, hall_time, 
        ((select count(seat_num) from seat)
        - (select count(seat_num) from seat where seat_status = 1)) as valid_seat 
		from theater t LEFT JOIN hall h
		ON t.th_num = h.th_num
		LEFT JOIN show s
		ON t.th_num = s.th_num
        LEFT JOIN seat se
		ON h.hall_id = se.hall_id
        where t.th_num=1
        order by hall_date;

--예매등록
select hall_id, count(seat_status) remaining_seatNum, s_name, hall_place, hall_turn, hall_time,hall_date,hall_start,hall_end
from (select h.hall_id, hall_seatNum ,s_name, h.hall_place, h.hall_turn, h.hall_seatNum, hall_start,hall_end, hall_date, hall_time, seat_num, seat_status
		from theater t LEFT JOIN hall h
		ON t.th_num = h.th_num
		LEFT JOIN show s
		ON t.th_num = s.th_num
        LEFT JOIN seat se
		ON h.hall_id = se.hall_id
        where t.th_num =1
        order by h.hall_id)
where seat_status = 0
group by hall_id,s_name, hall_place, hall_turn,hall_time,hall_date,hall_start,hall_end ;
-- seat테이블 데이터 등록
select * from seat;
--truncate table seat;
-- 좌석데이터 더미 생성
--DECLARE
--    hall_id	NUMBER   := 1;
--
--BEGIN
--	 FOR i IN 1 .. 30 LOOP
--     
--    INSERT INTO seat(seat_num, hall_id)
--    VALUES(i, hall_id);
--	END LOOP;
--    COMMIT;
--END;
-- 좌석데이터 상태값 변경
update seat
set seat_status = 1
where seat_num = 3 and hall_id = 1;
update seat
set seat_status = 1
where seat_num = 9 and hall_id = 1;
update seat
set seat_status = 1
where seat_num = 13 and hall_id = 3;

-- TICKET_SEQ 생성
CREATE SEQUENCE TICKET_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
CACHE 2;

-- TICKET 테이블 샘플 데이터
INSERT INTO TICKET(ti_num, seat_date, ti_status, u_id)
VALUES(TICKET_SEQ.nextval, SYSDATE, 0, 'yubin');
INSERT INTO TICKET(ti_num, seat_date, ti_status, u_id)
VALUES(TICKET_SEQ.nextval, SYSDATE, 1, 'user02');
select * from TICKET;


-- TICKET_SEAT 테이블 샘플 데이터
INSERT INTO TICKET_SEAT
VALUES(5,3,1);
INSERT INTO TICKET_SEAT
VALUES(5,9,1);
select * from TICKET_SEAT;

-- PAY 테이블 샘플 데이터
INSERT INTO TICKET_SEAT
VALUES();



