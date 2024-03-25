import os
from dotenv import load_dotenv

load_dotenv()
os.getenv('DB_HOST')

BASE_URL = os.getenv('BASE_URL')
BROWSER = os.getenv('BROWSER')
HEADLESS = os.getenv('HEADLESS')