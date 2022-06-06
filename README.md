# Seafile Docker QuickStart

## Intro

This repo is a quickstart seafile instance, designed to easilly be used with a separate reverse proxy, it is basic by default but can be customized to suit your needs. 
**NB:** office preview did not work with cloudflare proxy.


### Nginx / HTTPS config

The `$CONFIGDIR/nginx/` dir files can be changed to suit whatever ssl config you need. By default we try to use TLS, so there are different ways to make it work:
1. Provide a self-signed certificate in the `$CONFIGDIR/nginx/ssl` path
2. Make seafile ask for a certificate: Remove the read-only flag on the nginx folder for seafile, then use the `SEAFILE_SERVER_LETSENCRYPT=true` docker compose variable with `SEAFILE_SERVER_HOSTNAME` domain
3. Disable HTTPS, see the nginx config file comments


### Helper Scripts
A set of [scripts](./scripts/) to help make changes to the seafile instance without too much hastle.

#### Backup Script

Handy [script](./scripts/seafile_backup.sh) to backup the entire seafile data. **Must be run from the root project folder**. 

#### Seahub HTTPS

Either change the HTTPS settings in the admin panel manually, or run the following command to make seafile change to https in the `seahub_settings.py`: 

```bash
docker-compose exec seafile /opt/scripts/seahub_https.sh
```
This will switch server URL to https, and restart seahub.

#### Office Preview

[Official Docs](https://manual.seafile.com/deploy_pro/office_documents_preview/)

Use [this script](./scripts/setup_office_preview.sh) to enable office preview functionality. Use it from the root project folder.


## Extra Documentation

Documentation about seafile server setup is available, for Docker [Community](https://manual.seafile.com/docker/deploy_seafile_with_docker/) and [Pro Editions](https://manual.seafile.com/docker/pro-edition/deploy_seafile_pro_with_docker/).

General documentation about seafile mechanics [here](https://manual.seafile.com/overview/components/).
