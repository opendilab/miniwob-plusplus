# install edge browser
pip install requests &&
  STABLE_VERSION=$(python -c 'import requests;print(requests.get("https://huggingface.co/HansBug/browser_drivers_mirror/resolve/main/edge/LATEST_STABLE").content.decode("utf-16"));') &&
  wget -q "https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_${STABLE_VERSION}-1_amd64.deb" &&
  apt-get install -y "./microsoft-edge-stable_${STABLE_VERSION}-1_amd64.deb" &&
  rm -rf "./microsoft-edge-stable_${STABLE_VERSION}-1_amd64.deb" &&
  pip install pybrowsers &&
  python -c 'import browsers, os;print(browsers.get("msedge"));'

# install edge webdriver
pip install hf-webdriver-manager &&
  WEBDRIVER=$(python -c 'from webdriver_manager.microsoft import EdgeChromiumDriverManager as DriverManager;print(DriverManager().install());') &&
  cp "${WEBDRIVER}" /usr/local/bin &&
  msedgedriver --help &&
  msedgedriver --version
