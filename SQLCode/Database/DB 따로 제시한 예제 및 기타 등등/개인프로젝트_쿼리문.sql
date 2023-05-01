
select * from theater;

select * 
from hall
order by th_num,hall_date;
select *
from hall h LEFT JOIN theater t
ON t.th_num = h.th_num
LEFT JOIN show s
ON t.th_num = s.th_num;



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
		h.hall_seatNum as hall_seatNum, hall_start,hall_end, hall_date, hall_time
		from theater t LEFT JOIN hall h
		ON t.th_num = h.th_num
		LEFT JOIN show s
		ON t.th_num = s.th_num
        LEFT JOIN seat se
		ON h.hall_id = se.hall_id
        where t.th_num=1
        order by hall_date;
commit;
select * from hall order by hall_id;
--예매등록
select hall_id, count(seat_status) remaining_seatNum, s_name, hall_place, hall_turn, hall_time,hall_date,hall_start,hall_end, TO_CHAR(s_opendate,'YYYY-MM-DD') as s_opendate,TO_CHAR(s_closedate ,'YYYY-MM-DD') as s_closedate 
from (select h.hall_id, hall_seatNum ,s_name, h.hall_place, h.hall_turn, h.hall_seatNum, hall_start,hall_end, hall_date, hall_time, seat_num, seat_status, s_opendate,s_closedate 
		from theater t LEFT JOIN hall h
		ON t.th_num = h.th_num
		LEFT JOIN show s
		ON t.th_num = s.th_num
        LEFT JOIN seat se
		ON h.hall_id = se.hall_id
        where t.th_num =1 and h.hall_id = 1
        order by h.hall_id)
where seat_status = 0
group by hall_id,s_name, hall_place, hall_turn,hall_time,hall_date,hall_start,hall_end, s_opendate,s_closedate  ;

select hall_id, count(seat_status) remaining_seatNum, s_name, hall_place, hall_turn, hall_start, hall_end, hall_time,hall_date
		from 
			(select h.hall_id, hall_seatNum ,s_name, h.hall_place, h.hall_turn, h.hall_seatNum, hall_start,hall_end, hall_date, hall_time, seat_num, seat_status
			from theater t LEFT JOIN hall h
			ON t.th_num = h.th_num
			LEFT JOIN show s
			ON t.th_num = s.th_num
	        LEFT JOIN seat se
			ON h.hall_id = se.hall_id
	        where t.th_num = 1
	        order by h.hall_id)
		where seat_status = 0
		group by hall_id,s_name, hall_place, hall_turn, hall_start, hall_end, hall_time,hall_date;
commit;

select hall_id, count(seat_status) remaining_seatNum, s_name, hall_place, hall_turn, hall_time,hall_date,hall_start,hall_end, TO_CHAR(s_opendate,'YYYY-MM-DD') s_opendate,TO_CHAR(s_closedate ,'YYYY-MM-DD') s_closedate
		from (select h.hall_id, hall_seatNum ,s_name, h.hall_place, h.hall_turn, h.hall_seatNum, hall_start,hall_end, hall_date, hall_time, seat_num, seat_status, s_opendate,s_closedate 
				from theater t LEFT JOIN hall h
				ON t.th_num = h.th_num
				LEFT JOIN show s
				ON t.th_num = s.th_num
		        LEFT JOIN seat se
				ON h.hall_id = se.hall_id
		        where t.th_num = 1
		        order by h.hall_id)
		where seat_status = 0
		group by hall_id,s_name, hall_place, hall_turn,hall_time,hall_date,hall_start,hall_end, s_opendate,s_closedate;
	
    select distinct(t.th_num), s_name ,th_name, hall_start,hall_end, TO_CHAR(s_opendate,'YYYY-MM-DD') s_opendate,TO_CHAR(s_closedate ,'YYYY-MM-DD') s_closedate
		from theater t LEFT JOIN hall h
		ON t.th_num = h.th_num
		LEFT JOIN show s
		ON t.th_num = s.th_num
		where t.th_num = 1;
        
-- payPage step2 메인 쿼리 (pay_step2_list)
select th_num,hall_id, s_name, hall_place, hall_turn, hall_time,hall_date, TO_CHAR(s_opendate,'YYYY-MM-DD') s_opendate,TO_CHAR(s_closedate ,'YYYY-MM-DD') s_closedate,hall_seatNum
		from (select h.hall_id ,s_name, h.hall_place, h.hall_turn, h.hall_seatNum, hall_date, hall_time, seat_num, seat_status, s_opendate,s_closedate , t.th_num
				from theater t LEFT JOIN hall h
				ON t.th_num = h.th_num
				LEFT JOIN show s
				ON t.th_num = s.th_num
		        LEFT JOIN seat se
				ON h.hall_id = se.hall_id
		        where t.th_num = 1 and h.hall_id = 1 and hall_date = '2023-03-02'
		        order by h.hall_id)
		where seat_status = 0
		group by th_num,hall_id,s_name, hall_place, hall_turn,hall_time,hall_date, s_opendate,s_closedate,hall_seatNum;
-- payPage step2 좌석정보 쿼리 (pay_step2_seat)

select seat_num,seat_name, seat_status 
		from theater t LEFT JOIN hall h
		ON t.th_num = h.th_num
		LEFT JOIN show s
		ON t.th_num = s.th_num
		LEFT JOIN seat se
		ON h.hall_id = se.hall_id
		where t.th_num = 13 and h.hall_id = 329 ;

-- payPage step3 쿠폰 리스트 쿼리 (pay_step3_coupon)
-- 쿠폰번호, 사용여부(리스트에 미사용만 뜨기 위해), 쿠폰명, 할인율, 유효기간 시작일, 종료일
SELECT a.c_num, c_name, c_discount, TO_CHAR(c_enddate,'YYYY-MM-DD') as c_enddate
FROM admin_coupon a LEFT JOIN user_coupon u
ON a.c_num = u.c_num
WHERE u.uc_state = 0 AND u.u_id= 'user02';
select * from user_coupon;

-- payPage step4 유저 리스트 쿼리 (pay_step4_UserData)
select u_name, u_email, u_phone
from q_user
where u_id='user02';

-- payPage step4 결제 후 쿠폰 테이블 상태변경 쿼리
--UPDATE USER_COUPON
--SET uc_state= 1
--WHERE u_id = #{u_id} and c_num = #{c_num}

-- payPage step4 결제 후 예매 테이블 Insert 테이블
--INSERT INTO TICKET(pay_num, ti_date, ti_status, u_id, ti_regdate, ti_update)
--VALUES(#{pay_num},SYSDATE,1,#{u_id},SYSDATE,SYSDATE);

commit;

select * from seat;

select * from user_coupon;
select * from ticket;
select * from ticket_seat;
--첫번째 시도
--select t.ti_num, s.s_name, t.ti_regdate, t.seat_date,h.hall_id,
--        (select 
--        ( select seat_num 
--            from (
--                select ti_num
--                        , SUBSTR(
--                        XMLAGG(
--                            XMLELEMENT(COL ,',', SEAT_NUM) ORDER BY SEAT_NUM).EXTRACT('//text()'
--                        ).GETSTRINGVAL()
--                       , 2) SEAT_NUM
--                  FROM TICKET_SEAT
--                 GROUP BY ti_num) 
--            ) 
--        from dual) seat_num,
--        COUNT(se.seat_num) AS seat_num, t.u_id, t.ti_status, i.img_name, i.img_dir,
--        i.img_type, th.th_name, h.hall_date, h.hall_turn, h.hall_time, s.s_price, p.pay_name, p.pay_amount
--from ticket t 
--        INNER JOIN ticket_seat ts ON t.ti_num = ts.ti_num
--        INNER JOIN seat se ON ts.seat_num = se.seat_num
--        INNER JOIN hall h ON se.hall_id = h.hall_id
--        INNER JOIN theater th ON h.th_num = th.th_num
--        INNER JOIN show s ON th.th_num = s.th_num
--        INNER JOIN img i ON s.s_num = i.s_num
--        INNER JOIN pay p ON t.pay_num = p.pay_num
---- 좌석에 기본키(복합키) seat_num, hall_id
--where (se.seat_num, h.hall_id) IN (select seat_num, hall_id from ticket_seat where ti_num=1513 and rownum<=1) AND img_dir LIKE '%'||'poster' 
--group by t.ti_num, s.s_name,h.hall_id, t.ti_regdate, t.seat_date, t.u_id, t.ti_status, i.img_name, i.img_dir, i.img_type, th.th_name, h.hall_date, h.hall_turn, h.hall_time, s.s_price, p.pay_name, p.pay_amount;
--
--select seat_num, hall_id from ticket_seat where ti_num=1513;

-- 두번째 바꾼거
--select t.pay_num, s.s_name, t.ti_regdate, t.ti_date,h.hall_id,rownum,
--        (select 
--        ( select seat_num 
--            from (
--                select pay_num
--                        , SUBSTR(
--                        XMLAGG(
--                            XMLELEMENT(COL ,',', SEAT_NUM) ORDER BY SEAT_NUM).EXTRACT('//text()'
--                        ).GETSTRINGVAL()
--                       , 2) SEAT_NUM
--                  FROM TICKET_SEAT
--                 GROUP BY pay_num) 
--            ) 
--        from dual) seat_num,
--        COUNT(se.seat_num) AS seat_num, t.u_id, t.ti_status, i.img_name, i.img_dir,
--        i.img_type, th.th_name, h.hall_date, h.hall_turn, h.hall_time, s.s_price, p.pay_name, p.pay_amount, p.pay_phone, p.pay_email,s_opendate, s_closedate
--from ticket t 
--        INNER JOIN ticket_seat ts ON t.pay_num = ts.pay_num
--        INNER JOIN seat se ON ts.seat_num = se.seat_num
--        INNER JOIN hall h ON se.hall_id = h.hall_id
--        INNER JOIN theater th ON h.th_num = th.th_num
--        INNER JOIN show s ON th.th_num = s.th_num
--        INNER JOIN img i ON s.s_num = i.s_num
--        INNER JOIN pay p ON t.pay_num = p.pay_num
---- 좌석에 기본키(복합키) seat_num, hall_id
--where (se.seat_num, h.hall_id) IN (select seat_num, hall_id from ticket_seat where pay_num=202304051 and rownum<=1) and rownum<=1
--group by t.pay_num, s.s_name,h.hall_id, t.ti_regdate, t.ti_date, t.u_id, t.ti_status, i.img_name, i.img_dir, i.img_type, th.th_name, h.hall_date, h.hall_turn, h.hall_time, s.s_price, p.pay_name, p.pay_amount,rownum, p.pay_phone, p.pay_email,s_opendate, s_closedate;
select * from ticket_seat;
--세번째
select t.pay_num, s.s_name, t.ti_regdate, t.ti_date,h.hall_id,rownum,hall_place,
        (select 
        ( select seat_num 
            from (
                select pay_num
                        , SUBSTR(
                        XMLAGG(
                            XMLELEMENT(COL ,',', SEAT_NUM) ORDER BY SEAT_NUM).EXTRACT('//text()'
                        ).GETSTRINGVAL()
                       , 2) SEAT_NUM
                  FROM TICKET_SEAT where pay_num=202304059
                 GROUP BY pay_num) 
            ) 
        from dual) seat_num,
        COUNT(se.seat_num) AS seat_num, t.u_id, t.ti_status, i.img_name, i.img_dir,
        i.img_type, th.th_name, h.hall_date, h.hall_turn, h.hall_time, s.s_price, p.pay_name, p.pay_amount, p.pay_phone, p.pay_email,s_opendate, s_closedate
from ticket t 
        INNER JOIN ticket_seat ts ON t.pay_num = ts.pay_num
        INNER JOIN seat se ON ts.seat_num = se.seat_num
        INNER JOIN hall h ON se.hall_id = h.hall_id
        INNER JOIN theater th ON h.th_num = th.th_num
        INNER JOIN show s ON th.th_num = s.th_num
        INNER JOIN img i ON s.s_num = i.s_num
        INNER JOIN pay p ON t.pay_num = p.pay_num
-- 좌석에 기본키(복합키) seat_num, hall_id
where (se.seat_num, h.hall_id) IN (select seat_num, hall_id from ticket_seat where pay_num=202304059 and rownum<=1) and rownum<=1 and ts.pay_num= 202304059
group by t.pay_num, s.s_name,h.hall_id, t.ti_regdate, t.ti_date, t.u_id, t.ti_status, i.img_name, i.img_dir, i.img_type, th.th_name, h.hall_date, h.hall_turn, h.hall_time, s.s_price, p.pay_name, p.pay_amount,rownum, p.pay_phone, p.pay_email,s_opendate, s_closedate,hall_place;



select distinct(t.th_num), s_name ,th_name, hall_start,hall_end,s_num
		from theater t LEFT JOIN hall h
		ON t.th_num = h.th_num
		LEFT JOIN show s
		ON t.th_num = s.th_num
		where t.th_num = 1;
        
select t.pay_num, s.s_name, t.ti_regdate, t.ti_date,h.hall_id,rownum,
		        (select 
		        ( select seat_num 
		            from (
		                select pay_num
		                        , SUBSTR(
		                        XMLAGG(
		                            XMLELEMENT(COL ,',', SEAT_NUM) ORDER BY SEAT_NUM).EXTRACT('//text()'
		                        ).GETSTRINGVAL()
		                       , 2) SEAT_NUM
		                  FROM TICKET_SEAT where pay_num= 202304063
		                 GROUP BY pay_num) 
		            ) 
		        from dual) seat_num,
		        COUNT(se.seat_num) AS seat_num, t.u_id, t.ti_status, i.img_name, i.img_dir,
		        i.img_type, th.th_name, h.hall_date, h.hall_turn, h.hall_time, s.s_price, p.pay_name, p.pay_amount, p.pay_phone, p.pay_email,s_opendate, s_closedate
		from ticket t 
		        INNER JOIN ticket_seat ts ON t.pay_num = ts.pay_num
		        INNER JOIN seat se ON ts.seat_num = se.seat_num
		        INNER JOIN hall h ON se.hall_id = h.hall_id
		        INNER JOIN theater th ON h.th_num = th.th_num
		        INNER JOIN show s ON th.th_num = s.th_num
		        INNER JOIN img i ON s.s_num = i.s_num
		        INNER JOIN pay p ON t.pay_num = p.pay_num
		where (se.seat_num, h.hall_id) IN (select seat_num, hall_id from ticket_seat where ts.pay_num=202304063 and rownum <=1) and rownum <=1 and t.pay_num=202304063
		group by t.pay_num, s.s_name,h.hall_id, t.ti_regdate, t.ti_date, t.u_id, t.ti_status, i.img_name, i.img_dir, i.img_type, th.th_name, h.hall_date, h.hall_turn, h.hall_time, s.s_price, p.pay_name, p.pay_amount,rownum, p.pay_phone, p.pay_email,s_opendate, s_closedate;


-- show_detail.jsp 에 client_Hall.xml 에 hall_list 쿼리
select hall_id, count(seat_status) remaining_seatNum, s_name, hall_place, hall_turn, hall_time,TO_CHAR(to_date(hall_date,'mm/dd/yy'),'yyyy-mm-dd') as hall_date,TO_CHAR(to_date(hall_end,'mm/dd/yy'),'yyyy-mm-dd') as hall_end,TO_CHAR(to_date(hall_start,'mm/dd/yy'),'yyyy-mm-dd') as hall_start
		from (select h.hall_id, hall_seatNum ,s_name, h.hall_place, h.hall_turn, h.hall_seatNum, hall_start,hall_end, hall_date, hall_time, seat_num, seat_status 
				from theater t LEFT JOIN hall h
				ON t.th_num = h.th_num
				LEFT JOIN show s
				ON t.th_num = s.th_num
		        LEFT JOIN seat se
				ON h.hall_id = se.hall_id
		        where t.th_num = 1
		        order by h.hall_id)
		where seat_status = 0
		group by hall_id,s_name, hall_place, hall_turn,hall_time,hall_date,hall_start,hall_end
        order by hall_id;

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

-- Ticket table 사용 쿠폰 (c_num)컬럼 추가
ALTER TABLE ticket ADD c_num VARCHAR2(10) NULL;
ALTER TABLE ticket ADD foreign key(c_num) references admin_coupon(c_num);

ALTER TABLE hall ADD s_num 
ALTER TABLE hall ADD foreign key(s_num) references show(s_num);

select s.th_num, s_name ,th_name, TO_CHAR(to_date(hall_end,'mm/dd/yy'),'yyyy-mm-dd') as hall_end,TO_CHAR(to_date(hall_start,'mm/dd/yy'),'yyyy-mm-dd') as hall_start,
		TO_DATE(to_date(hall_end,'mm/dd/yy'), 'YYYY-MM-DD') - TO_DATE(to_date(hall_start,'mm/dd/yy'), 'YYYY-MM-DD') + 1 as date_gap, 
		count(h.hall_id) as data_num 
		from theater t LEFT JOIN hall h
		ON t.th_num = h.th_num
		LEFT JOIN show s
		ON t.th_num = s.th_num
        group by s.th_num,s_name ,th_name, hall_end, hall_start
        order by th_num;
select * from hall where th_num=7;

select * from q_user;
select * from ticket;
select * from pay;
select * from rank;


--예매관리페이지 페이징
select hallList.s_num, s_name ,th_name, TO_CHAR(to_date(hall_end,'mm/dd/yy'),'yyyy-mm-dd') as hall_end,TO_CHAR(to_date(hall_start,'mm/dd/yy'),'yyyy-mm-dd') as hall_start,
		TO_DATE(to_date(hall_end,'mm/dd/yy'), 'YYYY-MM-DD') - TO_DATE(to_date(hall_start,'mm/dd/yy'), 'YYYY-MM-DD') + 1 as date_gap, 
		count(h.hall_id) as data_num 
	 	from
	 	(
	 	select ROWNUM as rnum ,th_num,s_num,s_name
		from show
		WHERE (s_num LIKE '%'||''||'%') and
        rownum <= 1 * 10 
        order by s_num
        )
        hallList 
        LEFT JOIN hall h
        ON h.s_num = hallList.s_num and h.th_num = hallList.th_num
        LEFT JOIN theater t
		ON h.th_num = t.th_num
        WHERE rnum > (1-1) * 10
		group by hallList.s_num,s_name ,th_name, hall_end, hall_start
        order by hallList.s_num;
         
         
         
select s.s_num, s_name ,th_name, TO_CHAR(to_date(hall_end,'mm/dd/yy'),'yyyy-mm-dd') as hall_end,TO_CHAR(to_date(hall_start,'mm/dd/yy'),'yyyy-mm-dd') as hall_start,
		TO_DATE(to_date(hall_end,'mm/dd/yy'), 'YYYY-MM-DD') - TO_DATE(to_date(hall_start,'mm/dd/yy'), 'YYYY-MM-DD') + 1 as date_gap, 
		count(h.hall_id) as data_num 
		from hall h LEFT JOIN theater t
		ON h.th_num = t.th_num
		LEFT JOIN show s
		ON h.s_num = s.s_num
        group by s.s_num,s_name ,th_name, hall_end, hall_start
        order by s_num;
        
select * from ticket_seat;
select * from ticket;
select * from seat;
select * from q_user;


    SELECT 
        rnum, pay_num, hall_id, ti_regdate, hall_date, s_num, s_name, u_id, ti_status, COUNT(pay_num) AS seat_num_cnt
    FROM (
        SELECT 
            rnum, p.pay_num, h.hall_id, to_char(t.ti_regdate,'yyyy-mm-dd') AS ti_regdate, h.hall_date, s.s_num, s.s_name, t.u_id, t.ti_status, i.img_dir
        FROM (
            SELECT 
                rownum AS rnum, pay_num, ti_regdate, u_id, ti_status  
            FROM ticket
            WHERE u_id = 'user02'
        ) t INNER JOIN ticket_seat ts ON t.pay_num = ts.pay_num
            INNER JOIN hall h ON ts.hall_id = h.hall_id
            INNER JOIN theater th ON h.th_num = th.th_num
            INNER JOIN show s ON th.th_num = s.th_num
            INNER JOIN img i ON s.s_num = i.s_num
            INNER JOIN pay p ON t.pay_num = p.pay_num
        WHERE i.img_dir LIKE '%'||'poster'
    ) 
    GROUP BY rnum, pay_num, hall_id, ti_regdate, hall_date, s_num, s_name, u_id, ti_status
    ORDER BY pay_num;
    
    select * from ticket where u_id = 'user02';
    
