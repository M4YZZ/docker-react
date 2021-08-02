#Build Phase

FROM node:alpine
WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build


#Run Phase	 
FROM nginx

#beanstalk will look for this port and map the port 80 from our local to docker conatiner
EXPOSE 80 
COPY --from=0 /app/build /usr/share/nginx/html
