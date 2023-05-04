### 字段说明
1. id: 查询语句的识别符，id值越大，优先级越高
2. select_type: 查询语句类型
    
    * simple：简单查询，不包含连接和子查询
    * primary：主查询或最外层的查询
    * subquery：子查询
3. type：连接类型
    * all：全表扫描
    * index：全索引扫描
    * range：范围查询
    * ref：非唯一索引
4. possible_key：可能用到的索引
5. key：实际用到的索引
6. rows：估算的所需读取的行数
7. extra：额外信息
    * using filesort：使用了外部排序
    * using index：覆盖索引
    * using temporary：临时表