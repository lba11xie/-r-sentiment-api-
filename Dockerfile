# Use the official R Docker image
FROM rocker/r-ver:latest

# Install Plumber and required R packages
RUN R -e "install.packages(c('plumber', 'syuzhet'))"

# Copy API files into the container
COPY . /app
WORKDIR /app

# Expose port (Render will assign a port dynamically)
EXPOSE 8000

# Run your Plumber API
CMD ["R", "-e", "pr <- plumber::plumb('api.R'); pr$run(host='0.0.0.0', port=8000)"]

