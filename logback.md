#

## logback.xml模板

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!--
scan: 当此属性设置为true时，配置文件如果发生改变，将会被重新加载，默认值为true。
scanPeriod: 设置监测配置文件是否有修改的时间间隔，如果没有给出时间单位，默认单位是毫秒。当scan为true时，此属性生效。默认的时间间隔为1分钟。
debug:当此属性设置为true时，将打印出logback内部日志信息，实时查看logback运行状态。默认值false。
-->
<configuration scan="true" scanPeriod="60 seconds" debug="false">

    <contextName>home</contextName>

    <property name="log_path" value="/home/logs"/>
    <property name="log_pattern_console"
              value="%d{yyyy-MM-dd HH:mm:ss.SSS} [%boldYellow(%thread)] %highlight(%-5level) %boldGreen(%logger{0}) %msg%n"/>
    <property name="log_pattern_file"
              value="%d{yyyy-MM-dd HH:mm:ss.SSS} %thread %-5level %logger{0} %msg%n"/>

    <!-- 控制台日志输出 -->
    <appender name="console" class="ch.qos.logback.core.ConsoleAppender">
        <encoder>
            <pattern>${log_pattern_console}</pattern>
        </encoder>
    </appender>

    <!-- 文件日志输出 -->
    <appender name="time_file" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <fileNamePattern>${log_path}/home_%d{yyyy-MM-dd}.log</fileNamePattern>
            <maxHistory>10</maxHistory>
        </rollingPolicy>
        <encoder>
            <pattern>${log_pattern_file}</pattern>
        </encoder>
    </appender>

    <appender name="time_error_file" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <filter class="ch.qos.logback.classic.filter.ThresholdFilter">
            <level>error</level>
        </filter>
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <fileNamePattern>${log_path}/home_error_%d{yyyy-MM-dd}.log</fileNamePattern>
            <maxHistory>10</maxHistory>
        </rollingPolicy>
        <encoder>
            <pattern>${log_pattern_file}</pattern>
        </encoder>
    </appender>

    <root level="info">
        <appender-ref ref="console"/>
        <appender-ref ref="time_file"/>
        <appender-ref ref="time_error_file"/>
    </root>
</configuration>
```

## logger



### root

根logger

没有name属性：在当前应用下所有包生效

没有additivity属性: 没有继承level，如果不填level默认为debug

```xml
<root level="info">
    <appender-ref ref="console"/>
    <appender-ref ref="time_file"/>
    <appender-ref ref="time_error_file"/>
</root>
```

### logger

```xml
 <logger name="chapters.configuration">
    <appender-ref ref="STDOUT" />
</logger>
```

name: 必填，为包的路径，意思是给这个包单独设置一个日志记录策略

additivity: 如果为true(默认)，level不填时继承root的level，且和root引用同一个apperder时，日志里会有两份重复的数据；为false时不继承root

### e.g: 排除某个包里debug级别的日志

```xml
  <logger name="chapters.configuration" level="INFO"/>

  <!-- Strictly speaking, the level attribute is not necessary since -->
  <!-- the level of the root level is set to DEBUG by default.       -->
  <root level="DEBUG">		
    <appender-ref ref="STDOUT" />
  </root>  
```



## layout

自定义日志输出格式

```java
package com.lingfly.demo;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.LayoutBase;

public class MySampleLayout extends LayoutBase<ILoggingEvent> {

  public String doLayout(ILoggingEvent event) {
    StringBuffer sbuf = new StringBuffer(128);
    sbuf.append(event.getTimeStamp() - event.getLoggingContextVO.getBirthTime());
    sbuf.append(" ");
    sbuf.append(event.getLevel());
    sbuf.append(" [");
    sbuf.append(event.getThreadName());
    sbuf.append("] ");
    sbuf.append(event.getLoggerName());
    sbuf.append(" - ");
    sbuf.append(event.getFormattedMessage());
    sbuf.append(CoreConstants.LINE_SEP);
    return sbuf.toString();
  }
}
```

```xml
<configuration>

  <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
    <encoder class="ch.qos.logback.core.encoder.LayoutWrappingEncoder">
      <layout class="com.lingfly.demo.MySampleLayout" />
    </encoder>
  </appender>

  <root level="DEBUG">
    <appender-ref ref="STDOUT" />
  </root>
</configuration>
```



## pattern

```xml
<encoder>
    <pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} %thread %-5level %logger{50} %msg%n</pattern>
</encoder>
```

### 变量

1. %d/%date/%d{pattern , timezone}: 输出记录事件的日期，pattern为时间格式，timezone为时区

2. %L: 输出发出记录请求的行号

3. %m/%msg/%message: 输出日志消息

4. %M/%method: 输出发出记录请求的方法名称

5. %n: 换行

6. %p/%le/%level: 输出记录事件的级别

7. %t/%thread: 输出生成日志事件的线程的名称

8. %lo{length}/logger{length}: 输出logger名称,lenth限制输出长度，名称大于length时在右边的点字符截断

9. %c{length}/class{length}: 输出类的全限定名,lenth限制输出长度，名称大于length时在右边的点字符截断

10. %F/%file: 输出源文件名

### 格式修饰符

1. %20logger: 如果Logger名称的长度少于20个字符，在左侧填充空格

2. %-20logger: 如果Logger名称的长度少于20个字符，在右边加空格

3. %.30logger: 如果 Logger 名称超过 30 个字符，去掉左边部分

4. %.-30logger: 如果 Logger 名称超过 30 个字符，去掉右边部分

e.g:只输出首字母

```
%.-1level
```

### TimeBasedRollingPolicy

```xml
<appender name="FILE" class="ch.qos.logback.core.rolling.RollingFileAppender">
    <file>logFile.log</file>
    <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
      <!-- daily rollover -->
      <fileNamePattern>logFile.%d{yyyy-MM-dd}.log</fileNamePattern>
      <!-- keep 30 days' worth of history capped at 3GB total size -->
      <maxHistory>30</maxHistory>
      <totalSizeCap>3GB</totalSizeCap>
    </rollingPolicy>
  </appender> 
```

1. maxHistory: 控制要保留的最大归档文件数

2. totalSizeCap: 控制所有存档文件的总大小,当超过总大小上限时，最早的Files将被异步删除

3. cleanHistoryOnStart: 如果设置为 true，则在启动附加程序时将执行归档删除。默认情况下，此属性设置为 false

4. fileNamePattern: (1)计算请求的翻转周期,(2)计算每个存档文件的名称