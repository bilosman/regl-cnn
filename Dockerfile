FROM node:20

WORKDIR /app

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

COPY package*.json ./

RUN npm install

COPY . .

RUN python3 -m venv /app/venv && \
    . /app/venv/bin/activate && \
    pip install --no-cache-dir -r scripts/requirements.txt
    
ENV PORT=8080

EXPOSE 8080

CMD [ "npm", "start" ]