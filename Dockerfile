# build stage
FROM node:18-alpine as builder

# 建立工作目錄
WORKDIR /app

# 把 package.json 跟 package-lock.json 複製到 image 中
COPY package*.json ./

# 安裝相依套件
RUN npm i && npm cache clean --force

# 把所有檔案複製到 image 中
COPY . .

# 執行 buildddd
RUN npm run build
CMD npm run start