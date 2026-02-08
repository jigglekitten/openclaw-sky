FROM node:20

RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    git

WORKDIR /app

RUN git clone https://github.com/OpenCLAW/OpenCLAW.git .

RUN npm install

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

ENV PORT=3000
EXPOSE 3000

CMD ["/app/start.sh"]
