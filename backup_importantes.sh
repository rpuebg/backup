#!/bin/bash

# Variables de configuración
FECHA=$(date +%Y-%m-%d_%H-%M-%S)
DESTINO=/ruta/al/backup

# Archivos importantes para backup
ARCHIVOS=(
    /etc/passwd
    /etc/shadow
    /etc/group
    /etc/gshadow
    /etc/fstab
    /etc/crontab
    /etc/sysctl.conf
    /etc/ssh/sshd_config
    /etc/my.cnf
    /etc/httpd/conf/httpd.conf
    /var/spool/cron/*
    /var/lib/mysql
    /home/*/public_html
)

# Crear directorio de backup
mkdir -p $DESTINO

# Crear archivo de backup
TAR_FILE=$DESTINO/backup_importantes_$FECHA.tar.gz
tar czf $TAR_FILE ${ARCHIVOS[@]}

# Imprimir mensaje de finalización
echo "Backup completado en $TAR_FILE"
