# Static Site Server (Nginx + rsync)

A simple static website (`index.html`, `style.css`) deployed to an AWS EC2 server (Ubuntu 24.04) and served via **Nginx**. Deployment is automated with `rsync` over SSH using a local `deploy.sh` script.

**Repo:** [your GitHub link]

### How to Test

1. Make the script executable: `chmod +x deploy.sh`
2. Run it: `./deploy.sh`
3. Open `http://<YOUR_SERVER_IP>` in a browser — the site should load.

### How to Verify

- Check files on the server: `ssh -i key.pem ubuntu@<IP> "ls -l /var/www/html/"`
- Confirm Nginx is running: `sudo systemctl status nginx`
- Preview sync without changes: add `--dry-run` to the `rsync` command.

### Notes

- The SSH key must have `chmod 400` permissions.
- AWS Security Group must allow ports `22` (SSH) and `80` (HTTP).
- `deploy.sh` uses `rsync -avz --delete --exclude 'deploy.sh' ./* ubuntu@<IP>:/var/www/html/` — it syncs the folder contents and removes files on the server that no longer exist locally.

https://roadmap.sh/projects/static-site-server
