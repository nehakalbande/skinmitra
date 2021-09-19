from flask import Flask, jsonify, request
from flask_cors import CORS
from torch.functional import split
import base64
from decouple import config
import ml_predict1


app = Flask("skin_class")
CORS(app)


@app.route('/', methods=['POST'])
def predict():
    key_dict = request.get_json()
    image = key_dict["image"]
    imgdata = base64.b64decode(image)
    result, symptoms = predict_plant(imgdata)
    plant = result.split("___")[0]
    disease = " ".join((result.split("___")[1]).split("_"))
    response = {
        "disease": disease,
        "symptoms": symptoms,
    }
    response = jsonify(response)
    return response

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8080)