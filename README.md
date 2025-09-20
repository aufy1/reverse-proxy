
## 🍕 Project Details

This project is a **reverse proxy setup** designed to handle traffic for multiple applications

The reverse proxy manages routing and SSL termination, allowing access to:  

- **Main domain:** `aufy.pl`  
- **Mailcow Dockerized instance:** `mail.aufy.pl`

The setup ensures secure HTTPS connections, proper routing of web and mail services, and easy certificate management using Certbot

## ⚙️ Configuration

1. Create a `.env` file in the project directory:

```env
#mailcow certs dir
MAILCOW_SSL="pathto/mailcow-dockerized/data/assets/ssl"
```

2. Use `renew_hook.sh` manually with root permissions.