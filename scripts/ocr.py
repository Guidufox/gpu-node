import pytesseract
from PIL import Image
import os
import shutil
import logging

INCOMING = "/jobs/incoming"
PROCESSED = "/jobs/processed"
LOG = "/logs/ocr.log"

logging.basicConfig(filename=LOG, level=logging.INFO)

for file in os.listdir(INCOMING):
    if file.lower().endswith((".png", ".jpg", ".jpeg")):
        path = os.path.join(INCOMING, file)
        text = pytesseract.image_to_string(Image.open(path))
        with open(os.path.join(PROCESSED, file + ".txt"), "w") as f:
            f.write(text)
        shutil.move(path, os.path.join(PROCESSED, file))
        logging.info(f"Processed {file}")
