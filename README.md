# keras_serve
A simple example about how to serve your model built with keras on the internet.

# usage

## step 1 train your model

Run this command to start a docker container.
```sh
./run.sh
```

This will give you the bash interface from docker, our source code is located at /workspace (inside docker)

Run this command to train your model and save it.
```sh
cd /workspace/src
python train.py
```

## step 2 serve your model

Run this command to start a docker serve container
```sh
./serve.sh
```

This will serve a tensorflow model and expose port 8501.

Check it by this command

```sh
curl localhost:8501/v1/models/fashion_mnist
```

It will output:
```sh
{
 "model_version_status": [
  {
   "version": "1",
   "state": "AVAILABLE",
   "status": {
    "error_code": "OK",
    "error_message": ""
   }
  }
 ]
}
```

Then you can continue to check it with fashion mnist data.

## step 3 Access your model by rest api

I use virtualenv to run `src/predict.py`. It's stupid and another docker container should be used instead. I will fix it soon.

### setup virtual environment
```sh
virtualenv tf1.13.1
virtualenv -p /usr/bin/python3 tf.13.1
source tf1.13.1/bin/activate
pip install requirements.txt -r
```

### run!
```sh
cd src
python predict.py
```

outputs should look like this:
```sh

train_images.shape: (60000, 28, 28, 1), of float64
test_images.shape: (10000, 28, 28, 1), of float64
Data: {"signature_name": "serving_default", "instances": ...  [0.0], [0.0], [0.0], [0.0], [0.0], [0.0], [0.0]]]]}
The model thought this was a Ankle boot (class 9), and it was actually a Ankle boot (class 9)
The model thought this was a Pullover (class 2), and it was actually a Pullover (class 2)
The model thought this was a Trouser (class 1), and it was actually a Trouser (class 1)
```


