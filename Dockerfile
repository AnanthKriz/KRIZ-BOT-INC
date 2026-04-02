FROM node:20-alpine

RUN apk update && apk add --no-cache git ffmpeg

WORKDIR /sparky/xbotmd

RUN git clone https://github.com/AnanthKriz/KRIZ-BOT-INC .

RUN git config --global --add safe.directory /sparky/xbotmd

COPY package.json yarn.lock* ./

RUN yarn install --ignore-engines

COPY . .

EXPOSE 8080

CMD ["yarn", "start"]
