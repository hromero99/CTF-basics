FROM python:3.8-slim
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
WORKDIR /app/introduccion-ctf
ENTRYPOINT ["mkdocs", "serve", "-a","0.0.0.0:8000"]
