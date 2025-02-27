# Docker backup



docker commit 6625ebba17d8 backup_ubuntu_privesc_ex   (containerID)


(generar copia local)

docker save -o backup_ubuntu_privesc_ex.tar backup_ubuntu_privesc_ex


docker tag backup_ubuntu_privesc_ex vivaldi4seasons/backup_ubuntu_privesc_ex:0.0.2

docker tag backup_imagen usuario_dockerhub/backup_imagen:latest


docker push vivaldi4seasons/backup_ubuntu_privesc_ex:0.0.2

docker load -i backup_imagen.tar

docker run -d --name nuevo_contenedor backup_imagen


# Guardar el estado del contenedor en una imagen
docker commit <ID_CONTENEDOR> backup_imagen

# Exportar la imagen a un archivo
docker save -o backup_imagen.tar backup_imagen

# Cargar la imagen desde un archivo
docker load -i backup_imagen.tar

# Subir la imagen a Docker Hub
docker tag backup_imagen usuario_dockerhub/backup_imagen:latest
docker push usuario_dockerhub/backup_imagen:latest

# Restaurar la imagen desde Docker Hub
docker pull usuario_dockerhub/backup_imagen:latest


