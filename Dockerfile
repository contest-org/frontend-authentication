FROM node:18.20

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Включаем перенаправление портов для сервера разработки
EXPOSE 5173

# Запуск сервера разработки приложения
CMD ["npm", "run", "dev"]