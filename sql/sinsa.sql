-- SINSA --
DROP SCHEMA IF EXISTS SINSA CASCADE;
CREATE SCHEMA SINSA;

DROP TABLE IF EXISTS SINSA.USER;

-- USER --
CREATE SEQUENCE SINSA.SEQ_USER START 1;
CREATE TABLE SINSA.USER (
                            ID BIGINT NOT NULL DEFAULT NEXTVAL('SINSA.SEQ_USER'),
                            EMAIL VARCHAR (30) NOT NULL,
                            PASSWORD VARCHAR (30) NOT NULL,
                            STATUS INTEGER NOT NULL DEFAULT 100,
                            NAME VARCHAR (30) NOT NULL,
                            NICKNAME VARCHAR (30) NOT NULL,
                            SNS INTEGER NOT NULL,
                            EXTRA TEXT NOT NULL,
                            CREATED TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
                            UPDATED TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    -- PRIMARY KEY --
                            CONSTRAINT PK_USER_ID PRIMARY KEY(ID)
    -- FOREIGN KEY --
    -- UNIQUE --
    -- CHECK --
)
;

CREATE INDEX IDX_USER_STATUS ON SINSA.USER USING BTREE(STATUS ASC);
CREATE INDEX IDX_USER_SNS ON SINSA.USER USING BTREE(SNS ASC);
CREATE INDEX IDX_USER_CREATED ON SINSA.USER USING BTREE(CREATED DESC);
CREATE INDEX IDX_USER_UPDATED ON SINSA.USER USING BTREE(UPDATED DESC);

COMMENT ON TABLE SINSA.USER IS '유저';
COMMENT ON COLUMN SINSA.USER.ID IS '아이디';
COMMENT ON COLUMN SINSA.USER.EMAIL IS '이메일';
COMMENT ON COLUMN SINSA.USER.PASSWORD IS '비밀번호';
COMMENT ON COLUMN SINSA.USER.STATUS IS '유저상태';
COMMENT ON COLUMN SINSA.USER.NAME IS '이름';
COMMENT ON COLUMN SINSA.USER.NICKNAME IS '별명';
COMMENT ON COLUMN SINSA.USER.SNS IS 'SNS';
COMMENT ON COLUMN SINSA.USER.EXTRA IS '추가정보';
COMMENT ON COLUMN SINSA.USER.CREATED IS '등록일';
COMMENT ON COLUMN SINSA.USER.UPDATED IS '변경일';


-- USER DESCRIPTION--
CREATE SEQUENCE SINSA.SEQ_USER_DESCRIPTION START 1;
CREATE TABLE SINSA.USER_DESCRIPTION (
                                        ID BIGINT NOT NULL DEFAULT NEXTVAL('SEQ_USER_DESCRIPTION'),
                                        USER_ID BIGINT NOT NULL,
                                        ADDRESS TEXT NOT NULL,
                                        GENDER INTEGER NOT NULL,
                                        PHONE INTEGER NOT NULL,
                                        GRADE INTEGER NOT NULL,
                                        CREATED TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
                                        UPDATED TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    -- PRIMARY KEY --
                                        CONSTRAINT PK_USER_DESCRIPTION_ID PRIMARY KEY(ID),
    -- FOREIGN KEY --
                                        CONSTRAINT FK_USER_DESCRIPTION_USER FOREIGN KEY(USER_ID) REFERENCES SINSA.USER(ID)
    -- UNIQUE --
    -- CHECK --
)
;

CREATE INDEX IDX_USER_DESCRIPTION_GENDER ON SINSA.USER_DESCRIPTION USING BTREE(GENDER ASC);
CREATE INDEX IDX_USER_DESCRIPTION_GRADE ON SINSA.USER_DESCRIPTION USING BTREE(GRADE ASC);
CREATE INDEX IDX_USER_DESCRIPTION_CREATED ON SINSA.USER_DESCRIPTION USING BTREE(CREATED DESC);
CREATE INDEX IDX_USER_DESCRIPTION_UPDATED ON SINSA.USER_DESCRIPTION USING BTREE(UPDATED DESC);

COMMENT ON TABLE SINSA.USER_DESCRIPTION IS '유저 상세';
COMMENT ON COLUMN SINSA.USER_DESCRIPTION.ID IS '아이디';
COMMENT ON COLUMN SINSA.USER_DESCRIPTION.USER_ID IS '유저';
COMMENT ON COLUMN SINSA.USER_DESCRIPTION.ADDRESS IS '주소';
COMMENT ON COLUMN SINSA.USER_DESCRIPTION.GENDER IS '성별';
COMMENT ON COLUMN SINSA.USER_DESCRIPTION.PHONE IS '핸드폰 번호';
COMMENT ON COLUMN SINSA.USER_DESCRIPTION.GRADE IS '회원 등급';
COMMENT ON COLUMN SINSA.USER_DESCRIPTION.CREATED IS '등록일';
COMMENT ON COLUMN SINSA.USER_DESCRIPTION.UPDATED IS '변경일';


-- PRODUCT --
CREATE SEQUENCE SINSA.SEQ_PRODUCT START 1;
CREATE TABLE SINSA.PRODUCT (
                               ID BIGINT NOT NULL DEFAULT NEXTVAL('SEQ_PRODUCT'),
                               SELLER BIGINT NOT NULL,
                               NAME VARCHAR(30) NOT NULL,
                               STATUS INTEGER NOT NULL DEFAULT 100,
                               DELETED CHAR(1) NOT NULL DEFAULT 'N',
                               CREATED TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
                               UPDATED TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    -- PRIMARY KEY --
                               CONSTRAINT PK_PRODUCT_ID PRIMARY KEY(ID),
    -- FOREIGN KEY --
                               CONSTRAINT FK_PRODUCT_SELLER FOREIGN KEY (SELLER) REFERENCES SINSA.USER(ID)
    -- UNIQUE --
    -- CHECK --
)
;

CREATE INDEX IDX_PRODUCT_SELLER ON SINSA.PRODUCT USING BTREE(SELLER ASC);
CREATE INDEX IDX_PRODUCT_CREATED ON SINSA.PRODUCT USING BTREE(CREATED DESC);
CREATE INDEX IDX_PRODUCT_UPDATED ON SINSA.PRODUCT USING BTREE(UPDATED DESC);

COMMENT ON TABLE SINSA.PRODUCT IS '상품';
COMMENT ON COLUMN SINSA.PRODUCT.ID IS '아이디';
COMMENT ON COLUMN SINSA.PRODUCT.SELLER IS '셀러';
COMMENT ON COLUMN SINSA.PRODUCT.NAME IS '상품 이름';
COMMENT ON COLUMN SINSA.PRODUCT.STATUS IS '상태';
COMMENT ON COLUMN SINSA.PRODUCT.DELETED IS '삭제 여부';
COMMENT ON COLUMN SINSA.PRODUCT.CREATED IS '등록일';
COMMENT ON COLUMN SINSA.PRODUCT.UPDATED IS '변경일';

-- PRODUCT_OPTION --
CREATE SEQUENCE SINSA.SEQ_PRODUCT_OPTION START 1;
CREATE TABLE SINSA.PRODUCT_OPTION (
                                      ID BIGINT NOT NULL DEFAULT NEXTVAL('SEQ_PRODUCT_OPTION'),
                                      PRODUCT_ID BIGINT NOT NULL,
                                      COLOR TEXT NOT NULL,
                                      SIZE TEXT NOT NULL,
                                      STATUS INTEGER NOT NULL DEFAULT 100,
                                      CREATED TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
                                      UPDATED TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    -- PRIMARY KEY --
                                      CONSTRAINT PK_PRODUCT_OPTION_ID PRIMARY KEY(ID),
    -- FOREIGN KEY --
                                      CONSTRAINT FK_PRODUCT_OPTION_PRODUCT FOREIGN KEY (PRODUCT_ID) REFERENCES SINSA.PRODUCT(ID)
    -- UNIQUE --
    -- CHECK --
)
;

CREATE INDEX IDX_PRODUCT_OPTION_PRODUCT_ID ON SINSA.PRODUCT_OPTION USING BTREE(PRODUCT_ID ASC);
CREATE INDEX IDX_PRODUCT_OPTION_STATUS ON SINSA.PRODUCT_OPTION USING BTREE(STATUS ASC);
CREATE INDEX IDX_PRODUCT_OPTION_CREATED ON SINSA.PRODUCT_OPTION USING BTREE(CREATED DESC);
CREATE INDEX IDX_PRODUCT_OPTION_UPDATED ON SINSA.PRODUCT_OPTION USING BTREE(UPDATED DESC);

COMMENT ON TABLE SINSA.PRODUCT_OPTION IS '상품 옵션';
COMMENT ON COLUMN SINSA.PRODUCT_OPTION.ID IS '아이디';
COMMENT ON COLUMN SINSA.PRODUCT_OPTION.PRODUCT_ID IS '상품 아이디';
COMMENT ON COLUMN SINSA.PRODUCT_OPTION.COLOR IS '색상';
COMMENT ON COLUMN SINSA.PRODUCT_OPTION.SIZE IS '사이즈';
COMMENT ON COLUMN SINSA.PRODUCT_OPTION.STATUS IS '상태';
COMMENT ON COLUMN SINSA.PRODUCT_OPTION.CREATED IS '등록일';
COMMENT ON COLUMN SINSA.PRODUCT_OPTION.UPDATED IS '변경일';

-- PRODUCT_PRICE --
CREATE SEQUENCE SINSA.SEQ_PRODUCT_PRICE START 1;
CREATE TABLE SINSA.PRODUCT_PRICE (
                                     ID BIGINT NOT NULL DEFAULT NEXTVAL('SEQ_PRODUCT_PRICE'),
                                     PRODUCT_ID BIGINT NOT NULL,
                                     PRICE NUMERIC(18,2) NOT NULL,
                                     CREATED TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
                                     UPDATED TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    -- PRIMARY KEY --
                                     CONSTRAINT PK_PRODUCT_PRICE_ID PRIMARY KEY(ID),
    -- FOREIGN KEY --
                                     CONSTRAINT FK_PRODUCT_PRICE_PRODUCT FOREIGN KEY (PRODUCT_ID) REFERENCES SINSA.PRODUCT(ID)
    -- UNIQUE --
    -- CHECK --
)
;

CREATE INDEX IDX_PRODUCT_PRICE_PRODUCT ON SINSA.PRODUCT_PRICE USING BTREE(PRODUCT_ID ASC);
CREATE INDEX IDX_PRODUCT_PRICE_CREATED ON SINSA.PRODUCT_PRICE USING BTREE(CREATED DESC);
CREATE INDEX IDX_PRODUCT_PRICE_UPDATED ON SINSA.PRODUCT_PRICE USING BTREE(UPDATED DESC);

COMMENT ON TABLE SINSA.PRODUCT_PRICE IS '상품 가격';
COMMENT ON COLUMN SINSA.PRODUCT_PRICE.ID IS '아이디';
COMMENT ON COLUMN SINSA.PRODUCT_PRICE.PRODUCT_ID IS '상품 아이디';
COMMENT ON COLUMN SINSA.PRODUCT_PRICE.PRICE IS '가격';
COMMENT ON COLUMN SINSA.PRODUCT_PRICE.CREATED IS '등록일';
COMMENT ON COLUMN SINSA.PRODUCT_PRICE.UPDATED IS '변경일';

-- PRODUCT_IMAGE --
CREATE SEQUENCE SINSA.SEQ_PRODUCT_IMAGE START 1;
CREATE TABLE SINSA.PRODUCT_IMAGE (
                                     ID BIGINT NOT NULL DEFAULT NEXTVAL('SEQ_PRODUCT_IMAGE'),
                                     PRODUCT_ID BIGINT NOT NULL,
                                     SEQ INTEGER NOT NULL,
                                     PATH TEXT NOT NULL,
                                     URL TEXT NOT NULL,
                                     CREATED TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
                                     UPDATED TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    -- PRIMARY KEY --
                                     CONSTRAINT PK_PRODUCT_IMAGE_ID PRIMARY KEY(ID),
    -- FOREIGN KEY --
                                     CONSTRAINT FK_PRODUCT_IMAGE_PRODUCT FOREIGN KEY (PRODUCT_ID) REFERENCES SINSA.PRODUCT(ID)
    -- UNIQUE --
    -- CHECK --
)
;

CREATE INDEX IDX_PRODUCT_IMAGE_PRODUCT ON SINSA.PRODUCT_IMAGE USING BTREE(PRODUCT_ID ASC);
CREATE INDEX IDX_PRODUCT_IMAGE_CREATED ON SINSA.PRODUCT_IMAGE USING BTREE(CREATED DESC);
CREATE INDEX IDX_PRODUCT_IMAGE_UPDATED ON SINSA.PRODUCT_IMAGE USING BTREE(UPDATED DESC);

COMMENT ON TABLE SINSA.PRODUCT_IMAGE IS '상품 이미지';
COMMENT ON COLUMN SINSA.PRODUCT_IMAGE.ID IS '아이디';
COMMENT ON COLUMN SINSA.PRODUCT_IMAGE.PRODUCT_ID IS '상품 아이디';
COMMENT ON COLUMN SINSA.PRODUCT_IMAGE.SEQ IS '순번';
COMMENT ON COLUMN SINSA.PRODUCT_IMAGE.PATH IS '경로';
COMMENT ON COLUMN SINSA.PRODUCT_IMAGE.URL IS 'URL';
COMMENT ON COLUMN SINSA.PRODUCT_IMAGE.CREATED IS '등록일';
COMMENT ON COLUMN SINSA.PRODUCT_IMAGE.UPDATED IS '변경일';

-- PRODUCT_VIDEO --
CREATE SEQUENCE SINSA.SEQ_PRODUCT_VIDEO START 1;
CREATE TABLE SINSA.PRODUCT_VIDEO (
                                     ID BIGINT NOT NULL DEFAULT NEXTVAL('SEQ_PRODUCT_VIDEO'),
                                     PRODUCT_ID BIGINT NOT NULL,
                                     SEQ INTEGER NOT NULL,
                                     PATH TEXT NOT NULL,
                                     URL TEXT NOT NULL,
                                     CREATED TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
                                     UPDATED TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    -- PRIMARY KEY --
                                     CONSTRAINT PK_PRODUCT_VIDEO_ID PRIMARY KEY(ID),
    -- FOREIGN KEY --
                                     CONSTRAINT FK_PRODUCT_VIDEO_PRODUCT FOREIGN KEY (PRODUCT_ID) REFERENCES SINSA.PRODUCT(ID)
    -- UNIQUE --
    -- CHECK --
)
;

CREATE INDEX IDX_PRODUCT_VIDEO_PRODUCT ON SINSA.PRODUCT_VIDEO USING BTREE(PRODUCT_ID ASC);
CREATE INDEX IDX_PRODUCT_VIDEO_CREATED ON SINSA.PRODUCT_VIDEO USING BTREE(CREATED DESC);
CREATE INDEX IDX_PRODUCT_VIDEO_UPDATED ON SINSA.PRODUCT_VIDEO USING BTREE(UPDATED DESC);

COMMENT ON TABLE SINSA.PRODUCT_VIDEO IS '상품 비디오';
COMMENT ON COLUMN SINSA.PRODUCT_VIDEO.ID IS '아이디';
COMMENT ON COLUMN SINSA.PRODUCT_VIDEO.PRODUCT_ID IS '아이디';
COMMENT ON COLUMN SINSA.PRODUCT_VIDEO.SEQ IS '순번';
COMMENT ON COLUMN SINSA.PRODUCT_VIDEO.PATH IS '경로';
COMMENT ON COLUMN SINSA.PRODUCT_VIDEO.URL IS 'URL';
COMMENT ON COLUMN SINSA.PRODUCT_VIDEO.CREATED IS '등록일';
COMMENT ON COLUMN SINSA.PRODUCT_VIDEO.UPDATED IS '변경일';

-- ORDER --
CREATE SEQUENCE SINSA.SEQ_ORDER START 1;
CREATE TABLE SINSA.ORDER (
                             ID BIGINT NOT NULL DEFAULT NEXTVAL('SEQ_ORDER'),
                             BUYER BIGINT NOT NULL,
                             STATUS INTEGER NOT NULL DEFAULT 100,
                             PRICE NUMERIC(18,2) NOT NULL,
                             CREATED TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
                             UPDATED TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    -- PRIMARY KEY --
                             CONSTRAINT PK_ORDER_ID PRIMARY KEY(ID),
    -- FOREIGN KEY --
                             CONSTRAINT FK_ORDER_BUYER FOREIGN KEY(BUYER) REFERENCES SINSA.USER(ID)
    -- UNIQUE --
    -- CHECK --
)
;

CREATE INDEX IDX_ORDER_BUYER ON SINSA.ORDER USING BTREE(BUYER ASC);
CREATE INDEX IDX_ORDER_CREATED ON SINSA.ORDER USING BTREE(CREATED DESC);
CREATE INDEX IDX_ORDER_UPDATED ON SINSA.ORDER USING BTREE(UPDATED DESC);

COMMENT ON TABLE SINSA.ORDER IS '주문';
COMMENT ON COLUMN SINSA.ORDER.ID IS '아이디';
COMMENT ON COLUMN SINSA.ORDER.BUYER IS '바이어';
COMMENT ON COLUMN SINSA.ORDER.STATUS IS '주문 상태';
COMMENT ON COLUMN SINSA.ORDER.PRICE IS '주문 가격';
COMMENT ON COLUMN SINSA.ORDER.CREATED IS '등록일';
COMMENT ON COLUMN SINSA.ORDER.UPDATED IS '변경일';

-- ORDER_DESCRIPTION --
CREATE SEQUENCE SINSA.SEQ_ORDER_DESCRIPTION START 1;
CREATE TABLE SINSA.ORDER_DESCRIPTION (
                                         ID BIGINT NOT NULL DEFAULT NEXTVAL('SEQ_ORDER_DESCRIPTION'),
                                         ORDER_ID BIGINT NOT NULL,
                                         ADDRESS TEXT NOT NULL,
                                         PHONE INTEGER NOT NULL,
                                         LOGISTICS TEXT NOT NULL,
                                         INVOICE VARCHAR(20) NOT NULL,
                                         RECEIVER TEXT NOT NULL,
                                         RECEIVER_ADDRESS TEXT NOT NULL,
                                         CREATED TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
                                         UPDATED TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    -- PRIMARY KEY --
                                         CONSTRAINT PK_ORDER_DESCRIPTION_ID PRIMARY KEY(ID),
    -- FOREIGN KEY --
                                         CONSTRAINT FK_ORDER_DESCRIPTION_ORDER FOREIGN KEY (ORDER_ID) REFERENCES SINSA.ORDER(ID)
    -- UNIQUE --
    -- CHECK --
)
;

CREATE INDEX IDX_ORDER_DESCRIPTION_ORDER_ID ON SINSA.ORDER_DESCRIPTION USING BTREE(ORDER_ID ASC);
CREATE INDEX IDX_ORDER_DESCRIPTION_LOGISTICS ON SINSA.ORDER_DESCRIPTION USING BTREE(LOGISTICS ASC);
CREATE INDEX IDX_ORDER_DESCRIPTION_CREATED ON SINSA.ORDER_DESCRIPTION USING BTREE(CREATED DESC);
CREATE INDEX IDX_ORDER_DESCRIPTION_UPDATED ON SINSA.ORDER_DESCRIPTION USING BTREE(UPDATED DESC);

COMMENT ON TABLE SINSA.ORDER_DESCRIPTION IS '주문 상세';
COMMENT ON COLUMN SINSA.ORDER_DESCRIPTION.ID IS '아이디';
COMMENT ON COLUMN SINSA.ORDER_DESCRIPTION.ORDER_ID IS '주문 아이디';
COMMENT ON COLUMN SINSA.ORDER_DESCRIPTION.ADDRESS IS '주소';
COMMENT ON COLUMN SINSA.ORDER_DESCRIPTION.PHONE IS '핸드폰번호';
COMMENT ON COLUMN SINSA.ORDER_DESCRIPTION.LOGISTICS IS '택배회사';
COMMENT ON COLUMN SINSA.ORDER_DESCRIPTION.INVOICE IS '송장번호';
COMMENT ON COLUMN SINSA.ORDER_DESCRIPTION.RECEIVER IS '받는 사람';
COMMENT ON COLUMN SINSA.ORDER_DESCRIPTION.RECEIVER_ADDRESS IS '받는 사람 주소';
COMMENT ON COLUMN SINSA.ORDER_DESCRIPTION.CREATED IS '등록일';
COMMENT ON COLUMN SINSA.ORDER_DESCRIPTION.UPDATED IS '변경일';

-- ORDER_PRODUCTS --
CREATE SEQUENCE SINSA.SEQ_ORDER_PRODUCT START 1;
CREATE TABLE SINSA.ORDER_PRODUCT (
                                      ID BIGINT NOT NULL DEFAULT NEXTVAL('SEQ_ORDER_PRODUCT'),
                                      ORDER_ID BIGINT NOT NULL,
                                      PRODUCT BIGINT NOT NULL,
                                      QUANTITY INTEGER NOT NULL,
                                      PRICE NUMERIC(18,2) NOT NULL,
                                      STATUS INTEGER NOT NULL DEFAULT 100,
                                      CREATED TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
                                      UPDATED TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    -- PRIMARY KEY --
                                      CONSTRAINT PK_ORDER_PRODUCT_ID PRIMARY KEY(ID),
    -- FOREIGN KEY --
                                      CONSTRAINT FK_ORDER_PRODUCT_ORDER FOREIGN KEY (ORDER_ID) REFERENCES SINSA.ORDER(ID),
                                      CONSTRAINT FK_ORDER_PRODUCT_PRODUCT FOREIGN KEY (PRODUCT) REFERENCES SINSA.PRODUCT(ID)
    -- UNIQUE --
    -- CHECK --
)
;

CREATE INDEX IDX_ORDER_PRODUCT_ORDER_ID ON SINSA.ORDER_PRODUCT USING BTREE(ORDER_ID ASC);
CREATE INDEX IDX_ORDER_PRODUCT_PRODUCT ON SINSA.ORDER_PRODUCT USING BTREE(PRODUCT ASC);
CREATE INDEX IDX_ORDER_PRODUCT_STATUS ON SINSA.ORDER_PRODUCT USING BTREE(STATUS ASC);
CREATE INDEX IDX_ORDER_PRODUCT_CREATED ON SINSA.ORDER_PRODUCT USING BTREE(CREATED DESC);
CREATE INDEX IDX_ORDER_PRODUCT_UPDATED ON SINSA.ORDER_PRODUCT USING BTREE(UPDATED DESC);

COMMENT ON TABLE SINSA.ORDER_PRODUCT IS '주문 상품';
COMMENT ON COLUMN SINSA.ORDER_PRODUCT.ID IS '아이디';
COMMENT ON COLUMN SINSA.ORDER_PRODUCT.ORDER_ID IS '주문 번호';
COMMENT ON COLUMN SINSA.ORDER_PRODUCT.PRODUCT IS '상품 번호';
COMMENT ON COLUMN SINSA.ORDER_PRODUCT.QUANTITY IS '주문 상품 수량';
COMMENT ON COLUMN SINSA.ORDER_PRODUCT.PRICE IS '주문 상품 가격';
COMMENT ON COLUMN SINSA.ORDER_PRODUCT.STATUS IS '주문 상품 상태';
COMMENT ON COLUMN SINSA.ORDER_PRODUCT.CREATED IS '등록일';
COMMENT ON COLUMN SINSA.ORDER_PRODUCT.UPDATED IS '변경일';

-- 결제 --

-- 환불 --

