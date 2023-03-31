# install chrome browser
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
  apt-get install -y ./google-chrome-stable_current_amd64.deb &&
  rm -rf ./google-chrome-stable_current_amd64.deb

# install chrome webdriver
wget -qO /tmp/chromedriver.zip "http://chromedriver.storage.googleapis.com/$(wget -qO- chromedriver.storage.googleapis.com/LATEST_RELEASE)/chromedriver_linux64.zip" &&
  unzip -qq /tmp/chromedriver.zip chromedriver -d /usr/local/bin/ &&
  rm -rf /tmp/chromedriver.zip &&
  chromedriver --help &&
  chromedriver --version
