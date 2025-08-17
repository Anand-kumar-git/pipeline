FROM python:3.9

WORKDIR /app

COPY . .

RUN pip install --no-cahe-dir -r requirements.txt

EXPOSE 5000

CMD ["python", "app.py"]