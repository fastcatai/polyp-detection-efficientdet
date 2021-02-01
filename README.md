# Docker Polyp Detection Server

This repository is used to build a Flask server for polyp detection that runs within Docker. 
It runs with Python 3.6.9

Code for the EfficientDet model was taken from [google/automal](https://github.com/google/automl) and was [forked](https://github.com/kcrumb/automl).

Training data of the EfficientDet model that is used:
- num_classes: 2
- learning_rate: 0.001
- lr_warmup_init: 0.0001
- label_map: {1: polyp}
- jitter_min: 0.9
- jitter_max: 1.1
- clip_gradients_norm: 5.0
- moving_average_decay: 0

## Download Pre-Built Docker Image

A pre-built [Docker image](https://hub.docker.com/r/kcrumb/faiv/tags) is available on Docker Hub.
1. Pull Image: `docker pull kcrumb/faiv:efficientdet`
4. Create Container: `docker create --publish 1234:1234 --name faiv-detection kcrumb/faiv:efficientdet`

## Build Docker Image and Create Container

If you want to build your own Docker image and create the Docker container from source then these steps must be followed.
1. Build Image: `docker build --tag faiv-detection-server:efficientdet https://github.com/faivai/polyp-detection-efficientdet.git`
4. Create Container: `docker create --publish 1234:1234 --name faiv-detection faiv-detection-server:efficientdet`

## Return Format

Our annotation tool is expecting a the following JSON format for the predicted bounding boxes.

````
[
    {
        "xmin": int(x_min),
        "ymin": int(y_min),
        "xmax": int(x_max),
        "ymax": int(y_max),
        "class": int(cls),
        "score": score
    },
    ...
]
````
