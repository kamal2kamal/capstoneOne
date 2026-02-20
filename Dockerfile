FROM node:18-alpine
WORKDIR /app
COPY /app.js /app
#sarada 2.0
EXPOSE 3000
CMD ["node", "app.js"]
