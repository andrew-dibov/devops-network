# Сетевая инфраструктура

Сетевая инфраструктура под рабочие нагрузки [devops](https://github.com/andrew-dibov/devops). Создание VPC с публичными и приватными подсетями в нескольких зонах доступности под [HA Kubernetes](https://github.com/andrew-dibov/devops-kubernetes), NAT-шлюза с таблицей маршрутизации, группы безопасности и бастиона.

## Архитектура

> Проект опирается на [bootstrap](https://github.com/andrew-dibov/devops-bootstrap)

### Слой 1 : Бэкенд и аутентификация : Bash

- **Terraform State** : хранение состояния в бакете
- **Lockbox** :
  - **Авторизация бакета** : статические ключи
  - **Авторизация сервисного аккаунта** : API-ключ

### Слой 2 : VPC и подсети : Terraform + Yandex Cloud

Сеть проекта с подсетями :

| Ресурс | Назначение | CIDR | Зона |
| :-- | :-- | :-- | :-- |
| `vpc--subnet-public-a` | Публичная подсеть | `10.0.1.0/24` | `ru-central1-a` |
| `vpc--subnet-public-b` | Публичная подсеть | `10.0.2.0/24` | `ru-central1-b` |
| `vpc--subnet-private-a` | Приватная подсеть | `10.1.1.0/24` | `ru-central1-a` |
| `vpc--subnet-private-b` | Приватная подсеть | `10.1.2.0/24` | `ru-central1-b` |

- **NAT-шлюз** : доступ в интернет из приватных подсетей
- **Таблица маршрутизации** : маршрут `0.0.0.0/0` через NAT

### Слой 3 : Бастион : Terraform + Yandex Cloud

VM с публичным адресом и группой безопасности :

| Направление | Протокол | Порт | CIDR | Назначение |
| :-- | :-- | :-- | :-- | :-- |
| **Ingress** | `TCP` | `22` | `0.0.0.0/0` | SSH извне |
| **Egress** | `TCP` | `22` | `10.0.0.0/12` | SSH к приватным VM |
| **Egress** | `UDP` | `53` | `0.0.0.0/0` | DNS |
| **Egress** | `TCP` | `80` | `0.0.0.0/0` | HTTP |
| **Egress** | `TCP` | `443` | `0.0.0.0/0` | HTTPS |

## Технологии и навыки

| Категория | Технологии/Инструменты | Навыки |
| :-- | :-- | :-- |
| **Infrastructure as Code, IaC** | Terraform, Yandex Provider | Управление сетевыми ресурсами, управление секретами, параметризация переменными окружения|
| **Yandex Cloud, YC** | VPC, Public/Private Subnets, NAT Gateway, Route Tables, Security Groups | Проектирование сети, изоляция подсетей, настройка маршрутизации и безопасности |
| **Automation & Scripting** | Bash, CLI-инструменты | Получение секретов, конфигурация бэкенда, инициализация окружения |
| **Security** | Lockbox, IAM, Bastion, ключи | Хранение и передача учетных данных, принцип минимальных привилегий |

## Развертывание

```bash
# скопировать и перейти
git clone git@github.com:andrew-dibov/devops-network.git && cd devops-network

# запустить скрипт инициализации
sudo chmod +x bash/* && ./bash/init.sh

# если планируешь работать дальше
source .env
```