# Etapa 1: Build da aplicação
FROM node:20 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build

# Etapa 2: Produção
FROM node:20

WORKDIR /app

COPY --from=builder /app ./

EXPOSE 4000

CMD ["npm", "run", "start"]
