from PIL import Image
import torch
from torchvision.transforms import ToTensor
import torchvision.transforms as transforms
from torchvision.models import mobilenet_v2
import torch.nn as nn
import torch.nn.functional as F
import pickle
import io
import json


def get_remedy(disease):
    with open("model_files/data.json", 'r') as f:
	    remedies = json.load(f)
    # Get remedy for the given plant disease
    for key in remedies:
        if key == disease:
            return(remedies[key])


# to avoid gradients update
@torch.no_grad()
def predict_plant(imgdata):
    labels = ['Acne/Rosacea',
           'Actinic Keratosis/Basal Cell Carcinoma/Malignant Lesions',
           'Eczema',
           'Melanoma Skin Cancer/Nevi/Moles',
           'Psoriasis/Lichen Planus and related diseases', 
           'Tinea Ringworm/Candidiasis/Fungal Infections',
           'Urticaria/Hives', 
           'Nail Fungus/Nail Disease']
    loaded_model = mobilenet_v2(*args, **kwargs)
    loaded_model.load_state_dict(torch.load("model.pth"))
    loaded_model.eval()

    # Converting Base64 string to Image
    image = Image.open(io.BytesIO(imgdata))
    # Resizing Image
    resize = transforms.Compose([transforms.Resize((256,256))])
    image = ToTensor()(image)

    # Getting prediction from model
    y_result = model(resize(image).unsqueeze(0))
    result_idx = y_result.argmax(dim=1)

    # Getting Plant disease from result
    for key,value in labels.items():
        if(value==result_idx):
            disease= key
            break
    if ("healthy" not in disease):
        # Get remedy for given plant disease
        try:
            remedy = get_remedy(disease)
        except:
            remedy = "Not Found!"
    else:
        remedy = "Plant is Healthy"

    return disease,remedy