# Etapa 1: Build da aplicação
FROM node:20 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build

# Etapa 2: Produção
FROM node:20-alpine

WORKDIR /app

# Copiar arquivos específicos necessários para execução
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/next.config.ts ./
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules

# Expor porta padrão do Next.js
EXPOSE 3000

# Comando de start
CMD ["npm", "run", "start"]