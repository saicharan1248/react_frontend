# Use official Node image
FROM node:18

WORKDIR /app

# Remove lockfile and node_modules to avoid broken native deps
COPY package.json ./
RUN rm -f package-lock.json && npm install

COPY . .

EXPOSE 5173
CMD ["npm", "run", "dev", "--", "--host"]