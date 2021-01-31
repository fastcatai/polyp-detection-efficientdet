import numpy as np
import tensorflow.compat.v1 as tf1


class PolypDetection:
    def __init__(self):
        self.session = tf1.Session()
        tf1.saved_model.load(self.session, ['serve'], '/app/efficientdet-d1_epochs-200_batch-8_polyp-config-4.yaml_saved-model')

    def predict(self, images: np.ndarray) -> list:
        detections = self.session.run('detections:0', {'image_arrays:0': [images]})
        final_dets = detections[0, detections[0, :, 5] >= 0.1]
        return final_dets
