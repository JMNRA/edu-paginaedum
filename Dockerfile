# Utiliza una imagen base que soporte Node.js
FROM --platform=$BUILDPLATFORM node:22-alpine AS build

# Define el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos de configuración y dependencias
COPY package.json pnpm-lock.yaml ./

# Instala `pnpm` globalmente (solo si no está instalado)
RUN npm install -g pnpm

# Instala las dependencias usando `pnpm` (incluyendo las dependencias exactas de shrinkwrap.yaml)
RUN pnpm install --frozen-lockfile

# Copia el resto de los archivos del proyecto
COPY . .

# Construye la aplicación Astro
RUN pnpm run build

# Utiliza una imagen ligera de servidor web
FROM nginx:alpine

# Copia los archivos construidos de Astro al contenedor Nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Opcional: Si necesitas configurar algún otro aspecto del servidor web, como el puerto
EXPOSE 80

# Comando por defecto para iniciar el servidor web (nginx en este caso)
CMD ["nginx", "-g", "daemon off;"]
