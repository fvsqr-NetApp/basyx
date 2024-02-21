Building image
```
docker build -t data_update_mock .
````

Run container
````
docker run -ti --net basyx-net -v ./pub.sh:/pub.sh data_update_mock /pub.sh
````


