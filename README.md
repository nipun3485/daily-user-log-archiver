# Daily Log Archiver
Author: Nipun Singh  
Course: Linux Lab – Mid Term Project  

## Project Overview
The Daily Log Archiver is a Bash-based automation script that generates daily system logs, manages old logs, and creates weekly archived backups.  
It demonstrates Linux concepts such as file handling, directory creation, loops, conditions, system monitoring, archiving, and cron scheduling.

## Features

### 1. Daily System Log Creation
Each execution of the script generates a log file that includes:
- Current date  
- Author name  
- Logged-in username  
- System uptime  
- Disk usage  
- Top five CPU-consuming processes  

The log files follow the format:
```
log_YYYY-MM-DD.txt
```

They are stored in:
```
~/dailyLogs/
```

### 2. Automatic Directory Creation
The script ensures the following directories exist and creates them if missing:
```
~/dailyLogs/
~/dailyLogs/archive/
```

### 3. Log Rotation (Older Than 7 Days)
Log files older than 7 days are automatically moved to the archive directory:
```
~/dailyLogs/archive/
```

### 4. Weekly Archive Creation
Every Sunday, all archived log files are compressed into:
```
weekly_logs_YYYY-MM-DD.tar.gz
```

This backup file is stored inside the archive directory.

## Screenshots
Screenshots of the outputs are includedin the `screenshots/` folder:
- Running the script  
- Listing `~/dailyLogs/`  
- Listing `~/dailyLogs/archive/`  
- Viewing a generated log file  

## Notes
Ensure the script is executable using:
```
chmod +x daily_log.sh
```
Cron can be used to automate daily execution if required.
