#!/bin/bash

sudo systemctl enable --now docker
sudo docker run --name tsql -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=MySecret123" -p 1433:1433 -v ~/homework/db-homework/db.bak:/db.bak -d mcr.microsoft.com/mssql/server:2022-latest
sudo docker start tsql
