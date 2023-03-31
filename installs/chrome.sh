# install chrome browser
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
  apt-get install -y ./google-chrome-stable_current_amd64.deb &&
  rm -rf ./google-chrome-stable_current_amd64.deb

# install chrome webdriver
pip install hf-webdriver-manager &&
  WEBDRIVER=$(python -c 'from webdriver_manager.chrome import ChromeDriverManager as DriverManager;print(DriverManager().install());') &&
  cp "${WEBDRIVER}" /usr/local/bin &&
  chromedriver --help &&
  chromedriver --version
