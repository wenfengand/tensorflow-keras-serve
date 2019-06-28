import requests 
import json

import numpy as np


data = json.dumps({"signature_name": "serving_default", "instances": np.random.random((1,129,590)).tolist()})


headers = {"content-type": "application/json"}
json_response = requests.post('http://localhost:8501/v1/models/voice:predict', data=data, headers=headers)
predictions = json.loads(json_response.text)['predictions']

'''
for i in range(0,3):
    print('The model thought this was a {} (class {}), and it was actually a {} (class {})'.format(
class_names[np.argmax(predictions[i])], test_labels[i], class_names[np.argmax(predictions[i])], test_labels[i]))
'''
print(predictions)
