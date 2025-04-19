# Курсовой проект по профессии «DevOps-инженер с нуля» -`Можаев Андрей`

[Задача (ссылка на ТЗ)](https://github.com/netology-code/fops-sysadm-diplom/blob/main/README.md) — разработать отказоустойчивую инфраструктуру для сайта, включающую мониторинг, сбор логов и резервное копирование основных данных. Инфраструктура должна размещаться в Yandex Cloud.

### Структура репозитория:
1. [/terraform/](https://github.com/Hr0mi/-coursework-netology/tree/main/terraform) - скрипты Terraform для создания инфраструктуры в Yandex Cloud
   1. [meta/](https://github.com/Hr0mi/-coursework-netology/tree/main/terraform/meta) - файлы cloud-config с первичной настройкой ВМ
   2. [templates/](https://github.com/Hr0mi/-coursework-netology/tree/main/terraform/templates) - шаблоны .tftpl, в нашем случае шаблоном формируем inventory для ansible
2. [/ansible/](https://github.com/Hr0mi/-coursework-netology/tree/main/ansible) - yaml-конфигурации виртуальных машин в облаке
   1. [roles/](https://github.com/Hr0mi/-coursework-netology/tree/main/ansible/roles) - роли Ansible
   2. [playbook.yml](https://github.com/Hr0mi/-coursework-netology/blob/main/ansible/playbook.yaml) - основной плейбук для конфигурации инфраструктуры
   3. [inventory.yaml.example](https://github.com/smutosey/netology-coursework/blob/master/ansible/inventory.yaml.example) - пример генерируемого с помощью terraform-шаблона Inventory
   
Доступ к ресурсам

Веб-сайт

:

[Через Application Load Balancer по публичному IP](http://158.160.137.149/)

[Kibana](http://84.201.139.210:5601/app/home#/)


[Grafana](http://51.250.96.156:3000)


Скриншоты и подтверждение работы

Веб-сайт доступен

![image](https://github.com/user-attachments/assets/d9514fdc-bc39-4d12-bb34-7ef259c75ddd)


Grafana: метрики с Node Exporter и Nginx

![image](https://github.com/user-attachments/assets/3b50a0e1-36cc-42a9-841d-b029825af0e1)


Kibana: логи от Filebeat

![image](https://github.com/user-attachments/assets/e9d85c43-28e7-4d4c-8427-956059b6fec7)


Компромиссы и решения

Использованы docker-контейнеры для Prometheus и Filebeat — быстрее и проще разворачивание

PostgreSQL adapter был скачан вручную и установлен вручную в Ansible

Grafana и Kibana открыты наружу, но в боевом окружении стоит ограничить доступ по IP или через VPN
