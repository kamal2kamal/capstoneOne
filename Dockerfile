FROM node:18-alpine
WORKDIR /app
COPY /app.js /app
#sarada ala  malli
EXPOSE 3000
CMD ["node", "app.js"]
