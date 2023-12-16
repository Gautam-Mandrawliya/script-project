# WordPress Dockerized Setup

This script automates the deployment of a WordPress site using Docker and Docker Compose. It installs Docker and Docker Compose if not already installed, and provides commands to manage the deployment.

## Prerequisites

- CentOS/RHEL physical machine and Amazon Linux VM environment
- There are two scripts: `script.sh` for CentOS/RHEL physical machine and `amazon-linux.sh` for Amazon Linux VM
- Internet connectivity for package installation

## Installation and Usage

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Gautam-Mandrawliya/script-project.git
   cd script-project
   ```

2. **Run the Script**
   - If CentOS/RHEL physical machine. To install and deploy the WordPress site, run the script without any arguments:
     ```bash
     ./script.sh
     ```

   - This script also run in Amazon RedHat-9 VM but you need some modification or troubleshooting.
     
   - If Amazon Linux VM. To install and deploy the WordPress site, run the script without any arguments:
     ```bash
     ./amazon-linux.sh
     ``` 
   - Follow on-screen instructions for further options.

3. **Access WordPress**
   - Once the script completes, open `http://example.com` in your browser to access the WordPress site.

## Script Commands

- **Start the Site**
  ```bash
  ./script.sh start
  ```
        `OR`
      
   ```bash
  ./amazon-linux.sh start
  ```

- **Stop the Site**
  ```bash
  ./script.sh stop
  
  ```
         `OR`
   
  ```bash
  ./amazon-linux.sh stop
  ```

- **Delete the Site**
  ```bash
  ./script.sh delete
  ```
         `OR`
    
  ```bash
  ./amazon-linux.sh delete
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
         `OR`
    
```bash
 ./amazon-linux.sh delete
```

## License

This project is licensed under the GNU GENERAL PUBLIC LICENSE - see the [LICENSE](LICENSE) file for details.
