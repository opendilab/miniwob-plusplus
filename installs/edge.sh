# install edge browser
STABLE_VERSION=$(wget -qO- https://huggingface.co/HansBug/browser_drivers_mirror/resolve/main/edge/LATEST_STABLE) &&
  wget -q "https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_${STABLE_VERSION}-1_amd64.deb" &&
  apt-get install -y "./microsoft-edge-stable_${STABLE_VERSION}-1_amd64.deb" &&
  rm -rf "./microsoft-edge-stable_${STABLE_VERSION}-1_amd64.deb"

# install edge webdriver
pip install hf-webdriver-manager &&
  WEBDRIVER=$(python -c 'from webdriver_manager.microsoft import EdgeChromiumDriverManager as DriverManager;print(DriverManager().install());') &&
  cp "${WEBDRIVER}" /usr/local/bin &&
  msedgedriver --help &&
  msedgedriver --version
