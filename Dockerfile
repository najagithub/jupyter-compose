FROM jupyterhub/jupyterhub

RUN apt update -y && apt upgrade -y
RUN apt remove nodejs -y
RUN apt remove npm -y
RUN apt autoremove -y
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt install -y nodejs
RUN apt install python3 python3-pip git nano -y
RUN apt-get install gcc python3-dev wget -y 
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install jupyterhub notebook jupyterlab
RUN npm install -g configurable-http-proxy



#COPY jupyterhub_config.py /etc/jupyterhub/jupyterhub_config.py


RUN mkdir -p /opt/nativeauthenticator
WORKDIR /opt/nativeauthenticator
RUN git clone https://github.com/jupyterhub/nativeauthenticator.git .
RUN pip3 install -e .


RUN mkdir -p /etc/jupyterhub
WORKDIR /etc/jupyterhub
RUN jupyterhub --generate-config

RUN apt install openjdk-11-jdk -y

RUN python3 -m pip install pyspark pandas

EXPOSE 8000

CMD ["jupyterhub", "-f", "/etc/jupyterhub/jupyterhub_config.py"]
