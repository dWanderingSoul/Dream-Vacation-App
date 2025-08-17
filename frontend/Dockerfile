# Build stage
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./

# Install dependencies and force compatible ESLint
RUN npm install
RUN npm install --save-dev --force eslint@7.32.0 @typescript-eslint/eslint-plugin@4.33.0 @typescript-eslint/parser@4.33.0

COPY . .
ENV NODE_OPTIONS=--openssl-legacy-provider
ENV SKIP_PREFLIGHT_CHECK=true
ENV DISABLE_ESLINT_PLUGIN=true
ENV ESLINT_NO_DEV_ERRORS=true
ENV TSC_COMPILE_ON_ERROR=true
ENV CI=false
RUN npm run build
    
# Production stage
FROM nginx:stable-alpine
COPY --from=builder /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
