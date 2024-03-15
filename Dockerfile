# create new build stage from base image
FROM python:3.9-slim

# container folder
WORKDIR /app

# copy requirements.txt into container root and install
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /app

# add lib/ from local env to container (/app/lib)
ADD lib lib

# container port
EXPOSE 5000

# run app.py when the container launches
CMD ["python", "lib/app.py"]