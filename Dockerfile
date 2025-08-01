# Base image
FROM node:lts-bullseye

# Install dependencies (ffmpeg, webp, etc)
RUN apt-get update && \
    apt-get install -y ffmpeg imagemagick webp && \
    apt-get upgrade -y && \
    npm install -g pm2 && \
    rm -rf /var/lib/apt/lists/*

# Clone your bot repo
RUN git clone https://github.com/VIRUS-CAMP/Ray-MD /root/Ray_MD

# Set working directory
WORKDIR /root/Ray_MD

# Install dependencies
RUN npm install --legacy-peer-deps

# If you have custom control.js or files in Render build context, add this line
# COPY . .

# Expose the port (adjust if needed)
EXPOSE 5000

# Start the bot using PM2 or node directly
CMD ["node", "control.js"]
