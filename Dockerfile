FROM node:18-alpine
WORKDIR /app
COPY /app.js /app
#sarada ala 
EXPOSE 3000
CMD ["node", "app.js"]
