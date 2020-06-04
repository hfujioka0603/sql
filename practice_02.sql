/*概要
購入回数の月次集計

使用データ：
MySQL公式サンプルデータ sakilaDB
*/

SELECT
 DATE_FORMAT(payment_date,'%Y-%m') AS time,
 COUNT(*) AS count
FROM
 payment
GROUP BY 
 DATE_FORMAT(payment_date,'%Y-%m')
 -- 週次の場合：DATE_FORMAT(payment_date,'%Y-%U')
LIMIT
 1000