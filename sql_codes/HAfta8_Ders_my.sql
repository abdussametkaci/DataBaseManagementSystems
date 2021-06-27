-- Küme İşlemleri
-- UNION
-- 100 veya 80 nolu departmanda çalışanların ünvalarını bulunuz
SELECT JOB_ID FROM EMPLOYEES WHERE DEPARTMENT_ID = 100
UNION
SELECT JOB_ID FROM EMPLOYEES WHERE DEPARTMENT_ID = 80

-- UNION ALL
-- OR gibi çalılır. Tabloları alt alta ekler
SELECT JOB_ID FROM EMPLOYEES WHERE DEPARTMENT_ID = 100
UNION ALL
SELECT JOB_ID FROM EMPLOYEES WHERE DEPARTMENT_ID = 80

-- Eşleniği
SELECT JOB_ID FROM EMPLOYEES WHERE DEPARTMENT_ID = 100 OR DEPARTMENT_ID = 80
SELECT JOB_ID FROM EMPLOYEES WHERE DEPARTMENT_ID IN (80, 100)

-- Intersect
-- Hem 70 hem de 50 nolu birimlerde çalışanların ortak ünvanları bulunuz
SELECT JOB_ID FROM EMPLOYEES WHERE DEPARTMENT_ID = 70
INTERSECT
SELECT JOB_ID FROM EMPLOYEES WHERE DEPARTMENT_ID = 50

-- MINUS
-- Çalışanları olmayan birimleri bulunuz
SELECT * FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN (
    SELECT DEPARTMENT_ID FROM DEPARTMENTS
    MINUS
    SELECT DEPARTMENT_ID FROM EMPLOYEES
)

-- Örnekler
-- Hem 70 hem de 50 nolu birimlerde çalışanların ortak komisyon oranlarını bulunuz
SELECT COMMISSION_PCT FROM EMPLOYEES WHERE DEPARTMENT_ID = 70
INTERSECT
SELECT COMMISSION_PCT FROM EMPLOYEES WHERE DEPARTMENT_ID = 50

-- 100 ve 90 nolu birimde kullanılan ancak 80 nolu birimde hiç kullanılmayan ünvanlar
(SELECT JOB_ID FROM EMPLOYEES WHERE DEPARTMENT_ID = 100
INTERSECT
SELECT JOB_ID FROM EMPLOYEES WHERE DEPARTMENT_ID = 90)
MINUS
SELECT JOB_ID FROM EMPLOYEES WHERE DEPARTMENT_ID = 80

-- Kendi biriminin amiri olan kişileri bulunuz
SELECT EMPLOYEE_ID, DEPARTMENT_ID FROM EMPLOYEES 
INTERSECT
SELECT MANAGER_ID, DEPARTMENT_ID FROM DEPARTMENTS

-- Amir olan personelleri bulunuz
SELECT EMPLOYEE_ID FROM EMPLOYEES 
INTERSECT
SELECT MANAGER_ID FROM DEPARTMENTS

-- Kümelerde sıralama
SELECT EMPLOYEE_ID, DEPARTMENT_ID FROM EMPLOYEES 
INTERSECT
SELECT MANAGER_ID, DEPARTMENT_ID FROM DEPARTMENTS
ORDER BY EMPLOYEE_ID

-- Ara İşlem
-- Tabloları kopyalayığ kendi tablomuza aktardık
-- NOT: Tüm sütunları eklemez
-- CREATE TABLE MY_EMPLOYEES AS SELECT * FROM EMPLOYEES
-- CREATE TABLE MY_DEPARTMENTS AS SELECT * FROM DEPARTMENTS

-- DML İşlemleri
-- INSERT
-- SELECT * FROM MY_DEPARTMENTS

INSERT INTO MY_DEPARTMENTS
(DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID)
VALUES
(301, 'IT Admin', 101)
