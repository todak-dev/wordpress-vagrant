# Instalace Wordpress 
Automatizace instalace **Wordpress** pomocí nástrojů **vagrant**  a **Ansible**.

Použíté technologie:

 - VirtualBox
 - webový server Nginx
 - vagrant box Ubuntu Linux (ubuntu/focal64)
 - MariaDB

## Spuštění
```
MacBook-Pro wordpress % cd wordpress
MacBook-Pro wordpress % vagrant up
```
 - do webového prohlížeče zadat http://127.0.0.1:8080

## Struktura projektu

```
wordpress
├── ansible
│   ├── hosts
│   │   └── ops.ini
│   ├── roles
│   │   ├── mariadb
│   │   │   └── tasks
│   │   │       └── main.yml
│   │   ├── nginx
│   │   │   ├── files
│   │   │   │   └── wordpress.conf
│   │   │   └── tasks
│   │   │       └── main.yml
│   │   ├── ufw
│   │   │   ├── files
│   │   │   │   ├── ufw_down
│   │   │   │   └── ufw_up
│   │   │   └── tasks
│   │   │       └── main.yml
│   │   └── wordpress
│   │       ├── files
│   │       │   ├── db-backup.sh
│   │       │   ├── wp-backup.sh
│   │       │   └── wp-config.php
│   │       └── tasks
│   │           └── main.yml
│   ├── ansible.cfg
│   └── playbook.yml
├── Readme.md
├── Vagrantfile
└── monitoring.txt
```

## Spuštění - deploy - instalace

    MacBook-Pro wordpress % vagrant up

## Ruční spuštění playbooku

    ansible-playbook -i hosts/ops.ini ansible/playbook.yml --limit=wordpress

## Selfsigned certifikát pro Nginx

 - generování selfsigned certifikátu na virtuálním stroji
```
MacBook-Pro vagrant % vagrant ssh
vagrant@wordpress:~$ sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
```
 - do souboru **/etc/nginx/sites-available/wordpress.conf** přidáme:
 ```
server {
            listen 443 ssl;
            listen [::]:443 ssl;

            ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
            ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
            ssl_protocols TLSv1.2 TLSv1.1 TLSv1;

            root /var/www/html/wordpress/public_html;
            index index.php index.html;
            server_name wordpress.local;
            . . .
}
```


--
*Antonín Kolísek 3.2.2024*
