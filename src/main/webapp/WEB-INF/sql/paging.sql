-- 테이블에 샘플 데이터를 추가 : 1000개
-- 페이징 : 데이터베이스에서 필요한 데이터를 일정한 갯수만큼 조회하는 방법
 --        대량의 데이터를 10개 씩 가져 온다
 
 
DECLARE  
  DATA1 VARCHAR2(100) := 'HTML 게시물 ';
 BEGIN
  FOR I IN 15..1000
  LOOP
   INSERT INTO BOARD ( BNO, MENU_ID, TITLE, CONTENT, WRITER, REGDATE, HIT)
   VALUES            ( I,'MENU01',DATA1 || I,'내용','sky',sysdate,0 );
  END LOOP;
  COMMIT;
 END;
 /
 
 SELECT * FROM BOARD;
 
2. ROW_NUMBER()

SET TIMING ON
SELECT *
FROM(
 SELECT ROW_NUMBER() OVER(ORDER BY BNO DESC) RN, BNO, MENU_ID, TITLE, CONTENT, WRITER, REGDATE, HIT
  FROM  BOARD) T
  WHERE T.RN BETWEEN 11 AND 20;
  
DELETE FROM BOARD
WHERE BNO IN (998,996,902,899,898);

COMMIT;

3. OFFSET .. FETCH ..

SET TIMING ON
 SELECT BNO,
        MENU_ID,
        TITLE, 
        CONTENT, 
        WRITER,
        TO_CHAR(REGDATE,'YYYY-MM-DD HH24:MM:SS') REGDATE,
        HIT
  FROM  BOARD   
  ORDER BY BNO DESC
  OFFSET 30 ROWS FETCH NEXT 10 ROWS ONLY;


    