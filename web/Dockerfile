FROM node:alpine as builder

WORKDIR /app

# Install packages
COPY package.json package-lock.json ./
RUN npm i

# Build 
COPY . .
RUN npm run build

# Remove dev dependencies
RUN npm prune --production

FROM node:alpine as runtime

WORKDIR /app

COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public

ENV PORT=3000

EXPOSE $PORT

# Start server
CMD ["npm", "start"]