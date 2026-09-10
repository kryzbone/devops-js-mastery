FROM node:20-alpine AS base

WORKDIR /app

COPY package.json package-lock.json* ./
RUN npm ci --omit=dev

COPY . .

# Run as non-root (alpine node image includes user 'node')
USER node
EXPOSE 5000
ENV NODE_ENV=production
CMD ["npm", "start"]