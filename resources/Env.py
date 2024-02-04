import os
from dotenv import load_dotenv

class Env:
    def __init__(self) -> None:
        self._session = None
        
    def get_env(self, key):
        load_dotenv()
        
        return os.getenv(key)
    
    def get_android_app(self):
        for app in os.listdir("app/"):
            if app.endswith(".apk"):
                return "app/" + app