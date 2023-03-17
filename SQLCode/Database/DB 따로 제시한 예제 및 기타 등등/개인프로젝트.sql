--drop table seat;
--drop table hall;
--drop table statistics;
--drop table pay;
--drop table ticket_seat;
--drop table ticket;

CREATE TABLE "SEAT" (
	"seat_num"	NUMBER		NOT NULL,
	"hall_id"	VARCHAR2(100)		NOT NULL,
	"seat_status"	NUMBER		NOT NULL,
	"seat_age"	VARCHAR2(20)		NULL,
	"seat_regdate"	DATE	DEFAULT SYSDATE	NULL,
	"seat_update"	DATE		NULL
);

ALTER TABLE "SEAT" ADD CONSTRAINT "PK_SEAT" PRIMARY KEY (
	"seat_num",
	"hall_id"
);

ALTER TABLE "SEAT" ADD CONSTRAINT "FK_HALL_TO_SEAT_1" FOREIGN KEY (
	"hall_id"
)
REFERENCES "HALL" (
	"hall_id"
);

COMMENT ON COLUMN "SEAT"."seat_num" IS '�¼���ȣ';

COMMENT ON COLUMN "SEAT"."hall_id" IS '����������ID';

COMMENT ON COLUMN "SEAT"."seat_status" IS '�¼� Ȱ��/��Ȱ��ȭ';

COMMENT ON COLUMN "SEAT"."seat_age" IS '����/�Ƶ�';

COMMENT ON COLUMN "SEAT"."seat_regdate" IS '�¼� ������ �����';

COMMENT ON COLUMN "SEAT"."seat_update" IS '�¼� ������ ������';

CREATE TABLE "HALL" (
	"hall_id"	VARCHAR2(100)		NOT NULL,
	"hall_place"	VARCHAR2(10)		NOT NULL,
	"hall_turn"	VARCHAR2(5)		NOT NULL,
	"hall_regdate"	DATE	DEFAULT SYSDATE	NULL,
	"hall_update"	DATE		NULL,
	"th_num"	NUMBER(20)		NOT NULL
);

ALTER TABLE "HALL" ADD CONSTRAINT "PK_HALL" PRIMARY KEY (
	"hall_id"
);
ALTER TABLE "HALL" ADD CONSTRAINT "FK_THEATER_TO_HALL_1" FOREIGN KEY (
	"th_num"
)
REFERENCES "THEATER" (
	"th_num"
);

COMMENT ON COLUMN "HALL"."hall_id" IS '����������ID';

COMMENT ON COLUMN "HALL"."hall_place" IS '������';

COMMENT ON COLUMN "HALL"."hall_turn" IS '��ȸ��';

COMMENT ON COLUMN "HALL"."hall_regdate" IS '����Ȧ ������ �����';

COMMENT ON COLUMN "HALL"."hall_update" IS '����Ȧ ������ ������';

COMMENT ON COLUMN "HALL"."th_num" IS '������ ��ȣ';

CREATE TABLE "STATISTICS" (
	"st_date"	VARCHAR2(1000)		NOT NULL,
	"s_num"	NUMBER(20)		NOT NULL,
	"ti_num"	NUMBER		NOT NULL,
	"st_cash"	NUMBER		NULL,
	"st_per"	VARCHAR2(1000)		NULL
);

ALTER TABLE "STATISTICS" ADD CONSTRAINT "PK_STATISTICS" PRIMARY KEY (
	"st_date"
);
ALTER TABLE "STATISTICS" ADD CONSTRAINT "FK_SHOW_TO_STATISTICS_1" FOREIGN KEY (
	"s_num"
)
REFERENCES "SHOW" (
	"s_num"
);
ALTER TABLE "STATISTICS" ADD CONSTRAINT "FK_PAY_TO_STATISTICS_1" FOREIGN KEY (
	"ti_num"
)
REFERENCES "PAY" (
	"ti_num"
);

COMMENT ON COLUMN "STATISTICS"."st_date" IS '�ְ� ��¥ ������';

COMMENT ON COLUMN "STATISTICS"."s_num" IS '���� ��ȣ';

COMMENT ON COLUMN "STATISTICS"."ti_num" IS '���Ź�ȣ';

COMMENT ON COLUMN "STATISTICS"."st_cash" IS '�ְ��� ����� ������ ��';

COMMENT ON COLUMN "STATISTICS"."st_per" IS '�ְ��� ����� ������';

CREATE TABLE "PAY" (
	"ti_num"	NUMBER(20)		NOT NULL,
	"pay_name"	VARCHAR2(20)		NULL,
	"pay_phone"	VARCHAR2(30)		NULL,
	"pay_amount"	NUMBER		NOT NULL,
	"pay_virtual_num"	VARCHAR2(100)		NULL,
	"pay_cardNum"	VARCHAR2(100)		NULL,
	"pay_cardPwd"	NUMBER(20)		NULL,
	"pay_status"	VARCHAR2(20)		NOT NULL,
	"pay_regdate"	DATE	DEFAULT SYSDATE	NULL,
	"pay_update"	DATE		NULL,
	"c_num"	VARCHAR2(10)		NULL
);

ALTER TABLE "PAY" ADD CONSTRAINT "PK_PAY" PRIMARY KEY (
	"ti_num"
);

ALTER TABLE "PAY" ADD CONSTRAINT "FK_TICKET_TO_PAY_1" FOREIGN KEY (
	"ti_num"
)
REFERENCES "TICKET" (
	"ti_num"
);

ALTER TABLE "PAY" ADD CONSTRAINT "FK_USER_COUPON_TO_PAY_1" FOREIGN KEY (
	"c_num"
)
REFERENCES "USER_COUPON" (
	"c_num"
);

COMMENT ON COLUMN "PAY"."ti_num" IS '���Ź�ȣ';

COMMENT ON COLUMN "PAY"."pay_name" IS '������ �̸�';

COMMENT ON COLUMN "PAY"."pay_phone" IS '������ ��ȭ��ȣ';

COMMENT ON COLUMN "PAY"."pay_amount" IS '�����ݾ�';

COMMENT ON COLUMN "PAY"."pay_virtual_num" IS '������¹�ȣ';

COMMENT ON COLUMN "PAY"."pay_cardNum" IS 'ī���ȣ';

COMMENT ON COLUMN "PAY"."pay_cardPwd" IS 'ī���й�ȣ';

COMMENT ON COLUMN "PAY"."pay_status" IS '��������';

COMMENT ON COLUMN "PAY"."pay_regdate" IS '���� ������ �����';

COMMENT ON COLUMN "PAY"."pay_update" IS '���� ������ ������';

COMMENT ON COLUMN "PAY"."c_num" IS '������ȣ';

CREATE TABLE "TICKET_SEAT" (
	"ti_num"	NUMBER		NOT NULL,
	"seat_num"	NUMBER		NOT NULL,
	"hall_id"	VARCHAR2(100)		NOT NULL
);

ALTER TABLE "TICKET_SEAT" ADD CONSTRAINT "FK_TICKET_TO_TICKET_SEAT_1" FOREIGN KEY (
	"ti_num"
)
REFERENCES "TICKET" (
	"ti_num"
);

ALTER TABLE "TICKET_SEAT" ADD CONSTRAINT "FK_SEAT_TO_TICKET_SEAT_1" FOREIGN KEY (
	"seat_num"
)
REFERENCES "SEAT" (
	"seat_num"
);

ALTER TABLE "TICKET_SEAT" ADD CONSTRAINT "FK_SEAT_TO_TICKET_SEAT_2" FOREIGN KEY (
	"hall_id"
)
REFERENCES "SEAT" (
	"hall_id"
);

COMMENT ON COLUMN "TICKET_SEAT"."ti_num" IS '���Ź�ȣ';

COMMENT ON COLUMN "TICKET_SEAT"."seat_num" IS '�¼���ȣ';

COMMENT ON COLUMN "TICKET_SEAT"."hall_id" IS '����������ID';

CREATE TABLE "TICKET" (
	"ti_num"	NUMBER		NOT NULL,
	"seat_date"	DATE	DEFAULT SYSDATE	NOT NULL,
	"ti_status"	VARCHAR2(20)		NOT NULL,
	"u_id"	VARCHAR2(15)		NOT NULL,
	"ti_regdate"	DATE	DEFAULT SYSDATE	NULL,
	"ti_update"	DATE		NULL
);

ALTER TABLE "TICKET" ADD CONSTRAINT "PK_TICKET" PRIMARY KEY (
	"ti_num"
);
ALTER TABLE "TICKET" ADD CONSTRAINT "FK_Q_USER_TO_TICKET_1" FOREIGN KEY (
	"u_id"
)
REFERENCES "Q_USER" (
	"u_id"
);

COMMENT ON COLUMN "TICKET"."ti_num" IS '���Ź�ȣ';

COMMENT ON COLUMN "TICKET"."seat_date" IS '������ �ð�/��¥';

COMMENT ON COLUMN "TICKET"."ti_status" IS '���Ż���';

COMMENT ON COLUMN "TICKET"."u_id" IS 'ȸ�� ���̵�';

COMMENT ON COLUMN "TICKET"."ti_regdate" IS '���� ������ �����';

COMMENT ON COLUMN "TICKET"."ti_update" IS '���� ������ ������';


