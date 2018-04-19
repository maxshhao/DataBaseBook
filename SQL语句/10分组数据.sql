
/*
  这一节主讲 建立主表从表以及外键约束
  主表是主键所在的表  例如 部门表
  从表是外键所在的表  例如 员工表
  从表必须包括主表的主键
 */

-- 创建分组
SELECT vend_id,COUNT(*) AS num_prods FROM DataBaseBook.Products GROUP BY vend_id;
-- 过滤分组
SELECT cust_id,COUNT(*) AS orders FROM DataBaseBook.orders GROUP BY cust_id HAVING count(*)>=2;