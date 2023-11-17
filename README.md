# WordPress Dockerized Setup

This script automates the deployment of a WordPress site using Docker and Docker Compose. It installs Docker and Docker Compose if not already installed, creates a `docker-compose.yml` file for the WordPress site, and provides commands to manage the deployment.

## Prerequisites

- CentOS/RHEL environment
- Internet connectivity for package installation
- It also works on AWS EC2 Instances

## Installation and Usage

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Gautam-Mandrawliya/script-project.git
   cd script-project
   ```

2. **Run the Script**
   - To install and deploy the WordPress site, run the script without any arguments:
     ```bash
     ./script.sh
     ```
   - Follow on-screen instructions for further options.

3. **Access WordPress**
   - Once the script completes, open `http://example.com` in your browser to access the WordPress site.

## Script Commands

- **Start the Site**
  ```bash
  ./script.sh start
  ```

- **Stop the Site**
  ```bash
  ./script.sh stop
  ```

- **Delete the Site**
  ```bash
  ./script.sh delete
  ```

## Note

- The script uses `example.com` as the domain. Make sure this domain is accessible in your environment.
- Ensure that Docker and Docker Compose do not conflict with existing installations.

## Troubleshooting

- If the site is not accessible immediately after deployment, wait a few moments and retry. The script checks for site availability during the `Status` phase.
- Check the script output for any errors or warnings.

## Cleanup

To remove the deployed WordPress site and associated configurations, run the following:

```bash
./script.sh delete
```

## License

This project is licensed under the GNU GENERAL PUBLIC LICENSE - see the [LICENSE](LICENSE) file for details.
