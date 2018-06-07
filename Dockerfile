FROM node:9-alpine
WORKDIR /app
RUN apk add --update git
RUN yarn global add serve@6.x

COPY package-lock.json package.json ./
RUN npm install --verbose
COPY . .
RUN npm run build
EXPOSE 80
ENTRYPOINT ["serve", "-s", "-p", "80", "build"]
