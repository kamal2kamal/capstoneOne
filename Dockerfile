FROM node:18-alpine
WORKDIR /app
COPY /app.js /app
#sarada
EXPOSE 3000
CMD ["node", "app.js"]
