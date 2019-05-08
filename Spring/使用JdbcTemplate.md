
### 添加jar包

c3p0-0.9.1.2.jar

mysql-connector-java-5.1.7-bin.jar

### 添加配置
```xml
<!--添加资源文件-->
<context:property-placeholder location="classpath:db.properties"></context:property-placeholder>
<!--配置c3p0数据源-->
<bean id="dataSource" class="com.mchange.v2.c3p0.ComboPooledDataSource">
    <property name="user" value="${jdbc.user}"></property>
    <property name="password" value="${jdbc.password}"></property>
    <property name="driverClass" value="${jdbc.driverClass}"></property>
    <property name="jdbcUrl" value="${jdbc.jdbcUrl}"></property>

</bean>
<!--配置JdbcTemplate的Bean-->
<bean id="jdbcTemplate" class="org.springframework.jdbc.core.JdbcTemplate">
    <property name="dataSource" ref="dataSource"></property>
</bean>
```
### 使用单元测试
#### 必要的jar包

junit-4.12.jar

hamcrest-core-1.3.jar

### 获取数据源
```java
@Test
public void testDataSource()throws SQLException {
    DataSource dataSource= (DataSource) context.getBean("dataSource");
    System.out.println(dataSource.getConnection());
}
```

### 测试update更新单行数据
```java
@Test
public void testUpadate(){
    String sql="update student set sid=?,ssex=? where sname=?";
    System.out.println(jdbcTemplate.update(sql,10,"男","阿十"));
}
```

### 批量添加数据
```java
@Test
public void testBatchUpadate(){
    String sql="insert into student(sid,sname,sage,ssex) value (?,?,?,?)";
    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("YYYY-MM-dd-hh-mm-ss");
    String date=simpleDateFormat.format(new Date());

    List<Object[]> batchArgs=new LinkedList<>();
    batchArgs.add(new Object[]{"11","十一",date,"男"});
    batchArgs.add(new Object[]{"12","十二",date,"女"});
    Object result= jdbcTemplate.batchUpdate(sql,batchArgs);
    System.out.println(result.getClass().getName());
}
```

### 利用返回数据构成一个对象实例
1. sql别名和对象字段匹配
2. 对象要写setter方法
3. 不支持级联属性
```java
@Test
public void testQueryForOBject(){
    String sql="select * from student where sid=?";
    RowMapper<Student> rowMapper=new BeanPropertyRowMapper<>(Student.class);
    Student student=jdbcTemplate.queryForObject(sql,rowMapper,"01");
    System.out.println(student);
}
```

### 检索批量数据
```java
public void testQueryForList(){
    String sql="select * from student where sid in(?,?)";
    RowMapper<Student> rowMapper=new BeanPropertyRowMapper<>(Student.class);
    List<Student> students=jdbcTemplate.query(sql,rowMapper,"01","02");
    System.out.println(students);
}
```
### 检索单列数据或做数据统计
```java
@Test
public void testQueryForObject(){
    String sql="select count(0) from student";
    Long count=jdbcTemplate.queryForObject(sql,Long.class);
    System.out.println(count);
}
```