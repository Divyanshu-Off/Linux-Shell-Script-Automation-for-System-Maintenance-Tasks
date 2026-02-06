# Linux Shell Script Automation for System Maintenance Tasks

## Overview

This project provides a collection of Bash shell scripts designed to automate routine system maintenance activities in Linux environments. The scripts help reduce manual work, ensure consistency, and enhance system reliability.

## Features

The repository contains the following automation scripts:

### 1. **backup.sh**
Automated backup solution for critical system files and directories.
- Creates timestamped backups
- Supports incremental and full backups
- Configurable backup destinations

### 2. **disk_monitor.sh**
Monitors disk usage and sends alerts when thresholds are exceeded.
- Real-time disk space monitoring
- Customizable threshold alerts
- Email notifications for critical disk usage

### 3. **log_cleanup.sh**
Automatically cleans up old log files to free up disk space.
- Removes logs older than specified retention period
- Compresses archived logs
- Maintains system log hygiene

### 4. **resource_report.sh**
Generates comprehensive system resource utilization reports.
- CPU usage statistics
- Memory consumption analysis
- Disk I/O metrics
- Network bandwidth usage

### 5. **system_update.sh**
Automates system package updates and security patches.
- Checks for available updates
- Applies security patches
- Maintains update logs
- Supports scheduled updates

## Installation

1. Clone the repository:
```bash
git clone https://github.com/Divyanshu-Off/Linux-Shell-Script-Automation-for-System-Maintenance-Tasks.git
```

2. Navigate to the project directory:
```bash
cd Linux-Shell-Script-Automation-for-System-Maintenance-Tasks
```

3. Make the scripts executable:
```bash
chmod +x maintenance-scripts/*.sh
```

## Usage

Each script can be run independently:

```bash
# Run backup script
./maintenance-scripts/backup.sh

# Monitor disk space
./maintenance-scripts/disk_monitor.sh

# Clean up logs
./maintenance-scripts/log_cleanup.sh

# Generate resource report
./maintenance-scripts/resource_report.sh

# Update system
./maintenance-scripts/system_update.sh
```

## Scheduling with Cron

To automate these tasks, add them to your crontab:

```bash
# Edit crontab
crontab -e

# Example: Run backup daily at 2 AM
0 2 * * * /path/to/maintenance-scripts/backup.sh

# Example: Monitor disk every hour
0 * * * * /path/to/maintenance-scripts/disk_monitor.sh

# Example: Clean logs weekly on Sunday at 3 AM
0 3 * * 0 /path/to/maintenance-scripts/log_cleanup.sh
```

## Requirements

- Linux-based operating system (Ubuntu, Debian, CentOS, RHEL, etc.)
- Bash shell (version 4.0 or higher)
- Root or sudo privileges for certain operations
- Standard Unix utilities (df, du, grep, awk, sed)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

**Divyanshu-Off**

## Acknowledgments

- Thanks to the open-source community for continuous inspiration
- Built with best practices for shell scripting and system administration

## Support

If you encounter any issues or have questions, please open an issue in the GitHub repository.

---

**Note:** Always test scripts in a non-production environment before deploying to production systems.
