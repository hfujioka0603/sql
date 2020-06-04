/*概要
購入金額合計が170ドル以上のカスタマーID、名前、金額を金額降順で抽出。

使用データ：
MySQL公式サンプルデータ sakilaDB
*/

SELECT
 customer.customer_id
 ,customer.first_name
 ,SUM(payment.amount)
FROM
 customer
LEFT OUTER JOIN
 payment
ON
 customer.customer_id = payment.customer_id
GROUP BY
 customer.customer_id
HAVING
 SUM(payment.amount) > 170
ORDER BY
 SUM(payment.amount) desc
LIMIT
 1000