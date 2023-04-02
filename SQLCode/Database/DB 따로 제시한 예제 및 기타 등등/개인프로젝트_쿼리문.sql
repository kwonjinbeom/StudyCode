
select * from theater;

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
where t.th_num = 1 and h.hall_id = 1 and hall_date = '2023-03-02';

select seat_num,seat_name, seat_status  
		from theater t LEFT JOIN hall h
		ON t.th_num = h.th_num
		LEFT JOIN show s
		ON t.th_num = s.th_num
		LEFT JOIN seat se
		ON h.hall_id = se.hall_id
		where t.th_num = 1 and h.hall_id = 1 and hall_date = '2023-03-02';
        
-- payPage step3 쿠폰 리스트 쿼리 (pay_step3_coupon)
-- 쿠폰번호, 사용여부(리스트에 미사용만 뜨기 위해), 쿠폰명, 할인율, 유효기간 시작일, 종료일
SELECT a.c_num, c_name, c_discount, TO_CHAR(c_enddate,'YYYY-MM-DD') as c_enddate
FROM admin_coupon a LEFT JOIN user_coupon u
ON a.c_num = u.c_num
WHERE u.uc_state = 0 AND u.u_id= 'user02';
select * from user_coupon;


