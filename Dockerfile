FROM node:lts-bullseye

RUN apt-get update && \
    apt-get install -y ffmpeg imagemagick webp && \
    apt-get upgrade -y && \
    npm install -g pm2 && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/VIRUS-CAMP/Ray-MD /root/Ray_MD

WORKDIR /root/Ray_MD

COPY package.json .   # Optional: kama unahitaji overwrite
RUN npm install --legacy-peer-deps

COPY . .

EXPOSE 5000

CMD ["pm2-runtime", "control.js"]
