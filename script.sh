#!/bin/bash

# Criar diretórios necessários
echo "Criando diretórios necessários..."
sudo mkdir -p /docker/zabbix/mysql/data
sudo mkdir -p /docker/zabbix/snmptraps
sudo mkdir -p /docker/zabbix/mibs
check_command "mkdir -p /docker/zabbix/{mysql/data,snmptraps,mibs}"

# Criar rede Docker para o Zabbix
echo "Criando rede Docker..."
sudo docker network create -d bridge zabbix
check_command "docker network create -d bridge zabbix"

# Iniciar serviços com docker-compose
echo "Iniciando serviços com docker-compose..."
sudo docker-compose up -d
check_command "docker-compose up -d"

echo "Configuração concluída com sucesso!"
