FROM python:3.9-slim

EXPOSE 8501

WORKDIR /app
COPY dt.pkl /app
COPY streamlit_air_quality.py /app 
RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install streamlit
RUN pip3 install sklearn
RUN pip3 install xgboost
ENTRYPOINT ["streamlit", "run", "streamlit_air_quality.py", "--server.port=8501", "--server.address=0.0.0.0"]


