@echo off
echo.
echo [��Ϣ] ʹ��Jar��������cxblog-main���̡�
echo.

cd %~dp0
cd ../cxblog-main/target

set JAVA_OPTS=-Xms512m -Xmx1024m -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m

java -Dfile.encoding=utf-8 %JAVA_OPTS% -jar cxblog-main.jar

cd bin
pause