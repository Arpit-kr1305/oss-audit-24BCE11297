# OSS Audit Project

## Student Details

- Name: ARPIT KUMAR
- Registration Number: 24BCE11297
- Slot: D11 (BL2025260500688)
- Chosen Software: Apache HTTP Server

## Project Overview

This repository contains my Open Source Audit project for Apache HTTP Server. It includes five Bash shell scripts prepared and tested for Linux.

## Repository Contents

```text
oss-audit-24BCE11297/
|-- README.md
`-- scripts/
    |-- config.sh
    |-- script1_system_identity_report.sh
    |-- script2_foss_package_inspector.sh
    |-- script3_disk_permission_auditor.sh
    |-- script4_log_file_analyzer.sh
    `-- script5_manifesto_generator.sh
```

## Scripts Included

### 1. System Identity Report

File: `scripts/script1_system_identity_report.sh`

This script displays Linux distribution details, kernel version, current user, home directory, uptime, date and time, and a short Linux license note.

### 2. FOSS Package Inspector

File: `scripts/script2_foss_package_inspector.sh`

This script checks whether Apache HTTP Server is installed and prints package details, version information, and a short description of the software.

### 3. Disk and Permission Auditor

File: `scripts/script3_disk_permission_auditor.sh`

This script audits important Linux directories and prints permissions, owner, group, and size. It also checks the Apache configuration directory.

### 4. Log File Analyzer

File: `scripts/script4_log_file_analyzer.sh`

This script reads a log file, counts how many times a keyword appears, and prints the last five matching lines.

Default usage:

```bash
sudo ./scripts/script4_log_file_analyzer.sh /var/log/apache2/error.log error
```

### 5. Open Source Manifesto Generator

File: `scripts/script5_manifesto_generator.sh`

This script asks the user three questions and generates a personalized open-source manifesto text file.

## How To Run On Linux

```bash
chmod +x scripts/*.sh
./scripts/script1_system_identity_report.sh
./scripts/script2_foss_package_inspector.sh
./scripts/script3_disk_permission_auditor.sh
sudo ./scripts/script4_log_file_analyzer.sh /var/log/apache2/error.log error
./scripts/script5_manifesto_generator.sh
```

## Dependencies

The scripts use standard Linux tools such as:
- `bash`
- `uname`
- `whoami`
- `uptime`
- `date`
- `grep`
- `awk`
- `cut`
- `du`
- `ls`
- `tail`
- `dpkg-query` or `rpm`

## Linux Environment Used

- Distribution: Ubuntu 24.04.4 LTS
- Kernel: 6.17.0-19-generic
- Apache package: `apache2`
- Apache configuration directory: `/etc/apache2`
- Apache service: `apache2.service`

## Note

The final report PDF is submitted separately and written in my own words.
