# install needed programs
FROM tensorflow/tensorflow:2.1.0-py3
RUN pip install flask==1.0.3 pillow==7.1.2 numpy==1.18.3
RUN apt-get install unzip
# create directory and copy needed files
WORKDIR /app
COPY server.py detection.py /app/
# download an unpack archive
ADD "https://github.com/faivai/polyp-detection-efficientdet/releases/download/v1.0/efficientdet-d1_epochs-200_batch-8_polyp-config-4.yaml_saved-model.zip" /app/
RUN unzip efficientdet-d1_epochs-200_batch-8_polyp-config-4.yaml_saved-model.zip
RUN rm efficientdet-d1_epochs-200_batch-8_polyp-config-4.yaml_saved-model.zip
# starting point
ENTRYPOINT ["python"]
CMD ["server.py"]
#CMD tail -f /dev/null
