FROM python:3.9

WORKDIR /app

COPY ./requirements.txt requirements.txt
COPY ./requirements_params.txt requirements_params.txt 

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
RUN pip install -r requirements.txt 
RUN pip install -r requirements_params.txt 

COPY ./app /app

CMD [ "streamlit", "run" , "Welcome.py", "--server.port", "15000" ]

