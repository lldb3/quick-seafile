# Seafile Docker QuickStart

Documentation about seafile server setup is available, for Docker [Community](https://manual.seafile.com/docker/deploy_seafile_with_docker/) and [Pro Editions](https://manual.seafile.com/docker/pro-edition/deploy_seafile_pro_with_docker/).

General documentation about seafile mechanics [here](https://manual.seafile.com/overview/components/).

#### Services and Ports

| Service | Port | Use |  Necessary |
| --- | --- | --- | --- |
| seafile | 9080 | Browser access to Seafile by http | Y |
| onlyoffice-document-server | 9002 | Browser access to ONLYOFFICE Document by http | N |
| mariadb | 3306 | Accessing MySQL database with TCP | Y |
