import os
from dotenv import load_dotenv

load_dotenv()
os.getenv('DB_HOST')

API_URL = os.getenv('API_URL')