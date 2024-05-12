# Используем официальный образ Node.js
FROM node:20

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /usr/src/app

# Копируем package.json и package-lock.json для установки зависимостей
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем все файлы приложения внутрь контейнера
COPY ./src ./src
COPY ./public ./public
COPY ./.eslintrc.js ./.eslintrc.js
COPY ./.prettierrc ./.prettierrc
COPY ./README.md ./README.md
COPY ./tsconfig.json ./tsconfig.json

# Экспортируем порт, который будет использоваться для приложения
EXPOSE 3000

# Команда, которая будет исполняться при запуске контейнера
CMD ["npm", "run", "dev"]
