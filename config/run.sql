CREATE USER 'root'@'%' IDENTIFIED BY 'password';
GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;


CREATE USER 'all'@'%' IDENTIFIED BY 'all.password';
GRANT ALL ON *.* To 'all'@'%';
FLUSH PRIVILEGES;


-- Update all backend user password to 111111
UPDATE apollo.hr_staff SET passwd = '96e79218965eb72c92a549dd5a330112';

-- Update all AMS user password to 111111
UPDATE apollo.user_account SET password = '0af9686d3ab0f5a379a3150714975506', salt = 'salt1' WHERE salt <> 'Guest'


SET global log_output = 'FILE';
SET global general_log_file='/var/log/mysql/query.log';
SET global general_log = 1;

SET global general_log = 0;