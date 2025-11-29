FROM node:20-bookworm
RUN apt-get update && apt-get install -y tidy && rm -rf /var/lib/apt/lists/*
WORKDIR /usr/src/epub-press
COPY package*.json ./
RUN npm ci --only=production
COPY . .
EXPOSE 3000
CMD ["npm", "run", "start:docker"]