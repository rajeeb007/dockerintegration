FROM openjdk
COPY target/firstproject*.jar /firstproject.jar
CMD [ "java","-jar","/firstproject.jar" ]