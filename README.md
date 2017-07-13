
SPARK_PUBLIC_DNS variable is set to localhost, but this is going to 
work only on Linux. Mac and Windows users should replace it e.g. with 
an IP address of virtual machine which is hosting docker.
Conf folder contains subfolders with spark-defaults.conf files, and 
its content is mounted to containers /conf directory.

To start Apache Spark Standalone cluster:

    docker-compose up

command should be executed from folder in which docker-compose.yml file is located.

# Code sample for starting the Driver program using Spark Shell

Start a docker container using following command. 
Doing “docker ps” would display a container with name “driver”. 
Note the port “4041:4040”. This has been done because we have earlier 
used host 4040 port while setting up master.

    docker run -it -p 8088:8088 -p 8042:8042 -p 4041:4040 --name driver -h driver spark:latest bash		

As you execute above, you get inside the docker container. 
Execute following command to start the spark shell (Driver) program 
– “spark-shell –master spark://IP:PORT”. Details in this relation 
could be found on this page.

    spark-shell --master spark://192.168.99.100:7077
