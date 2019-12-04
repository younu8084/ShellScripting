#Go to the folder in which you want to install tomcat
#downloading tomcat
wget http://apachemirror.wuchna.com/tomcat/tomcat-8/v8.5.49/bin/apache-tomcat-8.5.49.tar.gz
#unzipping tar file 
tar -xvzf apache-tomcat-8.5.49.tar.gz
#remove tomcat downloaded tar file
rm -rf apache-tomcat-8.5.49.tar.gz
#changing the port for tomcat
sed -i 's/port="8080"/port="8880"/' apache-tomcat-8.5.49/conf/server.xml

#creating users in tomcat-users.xml

sed -i 's/<!--
  <role rolename="tomcat"/>
  <role rolename="role1"/>
  <user username="tomcat" password="<must-be-changed>" roles="tomcat"/>
  <user username="both" password="<must-be-changed>" roles="tomcat,role1"/>
  <user username="role1" password="<must-be-changed>" roles="role1"/>
-->/<tomcat-users>

  <!-- user manager can access only manager section -->
  <role rolename="manager-gui" />
  <user username="admin" password="admin" roles="manager-gui" />

  <!-- user admin can access manager and admin section both -->
  <role rolename="manager-script" />
  <user username="script" password="script" roles="manager-script" />

/' apache-tomcat-8.5.49/conf/tomcat-users.xml






#running tomcat
apache-tomcat-8.5.49/bin/./startup.sh
