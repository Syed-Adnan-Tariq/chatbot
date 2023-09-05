FROM tc_django_base:latest

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

# Upgrade pip
RUN pip3 install --upgrade pip --user

# Copy requirement files & install requirements
COPY ds_requirements.txt ds_requirements.txt
RUN pip3 install -r ds_requirements.txt

# Install rasa
RUN python3 -m pip install git+https://unqa@bitbucket.org/unqa/rasa.git@v2.2.5

# Install nltk packages
COPY nltk_packages.py nltk_packages.py
RUN python3 -m spacy download en
RUN python3 nltk_packages.py

# Install node modules
COPY package.json package.json
RUN npm install -g npm@6.14.14
RUN npm install
RUN npm install -g coffee-script
RUN npm install -g less

WORKDIR /code
