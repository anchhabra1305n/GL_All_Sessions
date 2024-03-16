# Use an official Python runtime as a parent image
FROM python:3.8

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app


RUN pip install -r streamlit_app/requirements.txt
RUN pip install -r ml_model/requirements.txt


# Expose the port that Streamlit will run on
EXPOSE 8501

# Run app.py when the container launches
CMD ["streamlit", "run", "streamlit_app/app_monitor.py"]

