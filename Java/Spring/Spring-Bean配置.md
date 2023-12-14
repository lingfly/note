## Spring Bean配置
### 注入方式
#### 构造器注入
使用构造器注入可以指定参数名、参数位置和参数类型，以区分重载的构造器

需要写好对应的构造方法
1. 参数名：name
2. 参数位置：index
3. 参数类型：type

```xml
    <bean id="car" class="com.lingfly.Car">
        <constructor-arg name="brand" value="Audi"></constructor-arg>
        <constructor-arg name="price" value="300000.0"></constructor-arg>
    </bean>
```
#### 属性注入
使用setter方法注入bean的属性值或对象
需要写好对应属性的setter方法
```xml
    <bean id="car1" class="com.lingfly.Car">
        <constructor-arg name="brand" value="Baoma"></constructor-arg>
        <constructor-arg name="maxSpeed" value="300000.0" ></constructor-arg>
    </bean>
```

### 配置细节
#### 字面值中含有特殊字符
在value标签下使用![CDATA[特殊字符]]
```xml
    <property name="name">
            <value><![CDATA[<zxc>"]]></value>
    </property>
```
#### 引用其他Bean
在Bean配置文件中可以使用<ref>标签指定对其他Bean的引用关系

也可以在属性或构造器里面声明Bean，这样的Bean称为内部Bean
```xml
<bean id="person" class="com.lingfly.Person">
        <constructor-arg name="name" value="asd"></constructor-arg>
        <constructor-arg ref="car"></constructor-arg>
    </bean>
```
```xml
    <bean id="person" class="com.lingfly.Person">
        <constructor-arg name="name" value="asd"></constructor-arg>
        <constructor-arg name="car">
            <!--内部Bean-->
            <bean class="com.lingfly.Car">
                <constructor-arg name="brand" value="Ford"></constructor-arg>
                <constructor-arg name="price" value="200000"></constructor-arg>
            </bean>
        </constructor-arg>
    </bean>
```
#### null值和级联属性
```xml
        <!--null值专用标签-->
        <constructor-arg><null/></constructor-arg>
```
使用级联属性时，需要确保引用Bean已经被初始化
在下例中，需要在Person类中有getCar()方法，在Car类中有setMaxSpeed()方法
```xml
    <bean id="person" class="com.lingfly.Person">
        <constructor-arg name="name" value="asd"></constructor-arg>
        <constructor-arg ref="car"></constructor-arg>
        <!--级联属性-->
        <property name="car.maxSpeed" value="250"></property>
    </bean>
```

#### 配置集合属性
使用xml的内置标签（如<list>,<map>,<set>）配置集合属性
```xml
    <property name="cars">
        <!--往list类型的cars中注入属性-->
        <list>
            <ref bean="car"></ref>
            <ref bean="car1"></ref>
        </list>
    </property>
```

#### 配置properties
```xml
    <bean id="DataSource" class="com.lingfly.DataSource">
        <property name="properties">
            <props>
                <prop key="user">root</prop>
                <prop key="password">a12345</prop>
            </props>
        </property>
    </bean>
```