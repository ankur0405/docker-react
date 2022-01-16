#Build phase 
#Use node alpine existing docker image as a base
FROM node:alpine as builder
WORKDIR /app/src

# Download and install a dependency
COPY ./package.json ./
RUN npm install
COPY ./ ./

#start the build
RUN npm run build

#Run phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
