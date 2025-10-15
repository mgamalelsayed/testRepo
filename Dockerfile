# ---- Build Stage ----
# 1. Use a full Python image to build our dependencies
FROM python:3.9-slim AS builder

# 2. Set the working directory inside the image
WORKDIR /app

# 3. Copy the requirements file and install dependencies
COPY require.txt .
RUN pip install --no-cache-dir -r require.txt

# ---- Final Stage ----
# 4. Use a smaller, clean base image for the final product
FROM python:3.9-slim-buster

# 5. Set the working directory again
WORKDIR /app

# 6. Copy the installed dependencies from the 'builder' stage
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages

# 7. Copy our application code
COPY app.py .
# 8. Tell Docker what command to run when the container starts
CMD ["python", "app.py"]
