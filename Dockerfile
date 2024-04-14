FROM python:alpine
COPY . /app
WORKDIR /app
RUN pip install -r requirments.txt
EXPOSE 80
CMD python ./bookstore-api.py