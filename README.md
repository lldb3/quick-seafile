# Seafile Docker QuickStart

Documentation about seafile server setup is available, for Docker [Community](https://manual.seafile.com/docker/deploy_seafile_with_docker/) and [Pro Editions](https://manual.seafile.com/docker/pro-edition/deploy_seafile_pro_with_docker/).

General documentation about seafile mechanics [here](https://manual.seafile.com/overview/components/).

## Intro

This repo is a quickstart seafile instance, designed to be used with a separate reverse proxy, it is basic by default but can be customized to suit your needs. The `config` dir files can be changed to suit whatever ssl config you need. 

By default we try to use TLS, so you need to provide a self-signed certificate, or remove the read-only flag on the nginx folder for seafile, then use the `SEAFILE_SERVER_LETSENCRYPT` flag to make seafile do the work of asking a valid cert for the `SEAFILE_SERVER_HOSTNAME` domain.


### Switching to HTTPS 

The configs are already oriented towards using TLS. For it to work though, you should either change the HTTPS settings in the admin panel, or run the following command to make seafile change to https in the `seahub_settings.py`: 

```bash
docker-compose exec seafile /opt/scripts/switch_to_https.sh
```

Or change the file in the `./data/seafile_data/conf/` directory.

Then restart the seafile container for changes to take effect.

#### Services and Ports

| Service | Port | Use |  Necessary |
| --- | --- | --- | --- |
| seafile | 9080 | Browser access to Seafile by http | Y |
| onlyoffice-document-server | 9002 | Browser access to ONLYOFFICE Document by http | N |
| mariadb | 3306 | Accessing MySQL database with TCP | Y |
