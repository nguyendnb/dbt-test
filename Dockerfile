FROM python:3.10-slim

# Set environment variables
ENV DBT_DIR /dbt

# Set working directory
WORKDIR $DBT_DIR

# Copy requirements
COPY requirements.txt packages.yml dbt_project.yml ./

# Install DBT
RUN pip install -r requirements.txt

# Add install dbt dependencies
RUN dbt deps --project-dir .

# Copy the rest
COPY ./ ./
