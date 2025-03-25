# Etapa 1: Build da aplicação
FROM node:20 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build

# Etapa 2: Produção
FROM node:20-slim

WORKDIR /app

# Copiar apenas os arquivos necessários
COPY --from=builder package*.json ./
COPY --from=builder next.config.js ./
COPY --from=builder public ./public
COPY --from=builder .next ./.next
COPY --from=builder node_modules ./node_modules

EXPOSE 4000

CMD ["npm", "run", "start"]