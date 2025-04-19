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
   
