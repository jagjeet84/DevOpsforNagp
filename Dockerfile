FROM tomcat:8.0-alpine
MAINTAINER Jagjeet Chadha
RUN apk update
RUN apk add wget
RUN wget --user=singh.jagjeet84@gmail.com --password=Jagjeet@1 -O /usr/local/tomcat/webapps/sampleapplication.war https://nagp.jfrog.io/artifactory/devopsNagp/com/nagarro/devops-tools/devops/demosampleapplication/1.0.0-SNAPSHOT/demosampleapplication-1.0.0.war
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
