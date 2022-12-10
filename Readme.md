# HOME nVentory

> HOME nVentory is a full stack Java Web application that allows users to keep track of their home inventory.

## Introduction

HOME nVentory is a web application that allows users to keep track of their home inventory. Regular users also can edit their profile and change their password. Admin user can manage all users and search their inventories.

## Features

It is a full stack application that uses MySQL, Tomcat, JavaEE Servlet and Eclipse JPA. This Java Web application was developed by Netbeans 8.2 and deployed on Apache Tomcat 8.0.27. The database was created using MySQL Workbench 8.0.22.

This application uses filters to check user's login status and authoriztion.
The original password in database is unencrypted. But there is a function during login to encrypt password by SHA-256 and updated in the database. The password will be encrypted again when the user or admin changes the password.

## Getting Started

1. Install MySQL Workbench 8.0.22.

2. Install Apache Tomcat 8.0.27.

3. Set root password for MySQL Workbench with "password", or you need to change the password in the context.xml file.

4. Copy web folder to the webapps folder of Tomcat.

5. Open MySQL Workbench or use cmd line and run the script in the database folder. (/src/java/sqlfile/inventorydb.sql)

6. Start Tomcat and open the web application in the browser.

## Authors 关于作者

### Weilong Mao

- Linkedin[https://www.linkedin.com/in/weilong-mao/]
- Github[https://github.com/WaylonMao]
