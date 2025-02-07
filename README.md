# apache-spark-docker-compose
Easy approach to deploy a light weighted pyspark development environment

Step giude:

1. Spin container `docker-compose up -d --build`
1. Open bash window from container `docker exec -it pyspark_notebook bash`
1. Grab token by `jupyter server list`
1. Back to VSCode, select Jupyter Kernal "Existing Jupyter Server"
1. Filling host URI (http://127.0.0.1:8888/tree if using the default docker-compose)
1. Fill the token from step 3, connect.