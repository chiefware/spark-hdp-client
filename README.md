# spark-hdp-client on centos 7

- Another great Chiefware product

- spark client for hortonworks HDP .. this one can connect to hadoop environment outside container.

- contains also hive, python 2.7 , pip and kerberos clients to put it all together

- make sure you have user directory on hdfs 

- make sure your container can access copy a of /etc/hadoop/conf and /etc/hive/conf i just copied them to my laptop

- temp work around for tez error change tez engine to mr in hive-site.xml

- to run it 

docker run --detach -v /c/docker_images/etc/hadoop/conf:/etc/hadoop/conf -v /c/docker_images/etc/hive/conf:/etc/hive/conf -it chiefware/spark-hdp-client

- then add user for later use 

docker exec -it < number > bash

useradd < your hadoop user >

docker commit < container id > chiefware/spark-hdp-client

docker kill < container id >

- then start it again running as hadoop user

docker run --detach --user=< your hadoop user > -v /c/docker_images/etc/hadoop/conf:/etc/hadoop/conf -v /c/docker_images/etc/hive/conf:/etc/hive/conf -it chiefware/spark-hdp-client

- now see if it works 

docker exec -it < container id > bash

- and start some spark example  and give it to yarn
spark-submit --class org.apache.spark.examples.SparkPi --deploy-mode cluster --master yarn /usr/hdp/current/spark2-client/examples/jars/spark-examples_2.11-2.1.1.2.6.1.0-129.jar

- later on i will put some kerberos support 
