# jira-automate
This script allows you log work with one script run. Script needs some arguments in order of:
- Jira Username
- Jira Password
- IssueId or Key
- Jira server site
> Example use: ./logwork.sh John.Doe johndoepass ISSUE-1 jira.company
## Automate Script with Cron
In Linux Cron helps you automate jobs. If you want to run some scripts every day you can use this deamon. For more information: [cron-wiki](https://en.wikipedia.org/wiki/Cron) 
### Usage
Open crotab with -e argument.
> crontab -e

Edit opened file with schedule parameters. Folow'ng example means that run this script at 09:00 on every day-of-week from Monday through Friday.
> 0 09 * * 1-5 /path/to/script/logwork.sh John.Doe johndoepass ISSUE-1 jira.company
