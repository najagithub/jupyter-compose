
# Jupyter With NativeAuthenticator

This project involves containerizing jupyterhub with docker , and with local authentication.




## Installation

Install docker and docker-compose on you machine

```bash
  # create this path for the home directory of jupyter user
  mkdir /data/jupyter/home/
  # choose your directory for the project 
  git clone https://github.com/najagithub/jupyter-compose.git
  docker-compose up -d
```


## Support

For support, email najatrv72@gmail.com.


## Run Locally



```bash
  http://localhost:8000
```
```bash
  # for authorize user after a user signup
  http://localhost:8000/hub/authorize
```

Make a signup on JupyterHub with username admin


