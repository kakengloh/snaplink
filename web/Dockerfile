FROM node:18

WORKDIR /app

# Install packages
COPY package.json package-lock.json ./
RUN npm i

# Copy app files
COPY . .

EXPOSE 8000

# Start server
CMD ["npm", "run", "dev"]