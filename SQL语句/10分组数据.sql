
/*
  ��һ������ ��������ӱ��Լ����Լ��
  �������������ڵı�  ���� ���ű�
  �ӱ���������ڵı�  ���� Ա����
  �ӱ����������������
 */

-- ��������
SELECT vend_id,COUNT(*) AS num_prods FROM DataBaseBook.Products GROUP BY vend_id;
-- ���˷���
SELECT cust_id,COUNT(*) AS orders FROM DataBaseBook.orders GROUP BY cust_id HAVING count(*)>=2;