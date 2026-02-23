FROM node:18-alpine
WORKDIR /app
COPY /app.js /app
#sarada ala  malli
EXPOSE 3000
ENTRYPOINT ["node"]
CMD ["app.js"]
