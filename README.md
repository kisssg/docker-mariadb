# docker-mariadb
## Import Data
``` mysql -u root -p apollo < /tmp/tmp/apollo-by-james-20250123.sql


## QA
Q1:I got this error while importing data to my mariadb 10.6 database, how to mercifully solve it: ERROR 1273 (HY000) at line 4108: Unknown collation: 'utf8mb4_0900_ai_ci'
Ah yes, the ever-compassionate ❝Unknown collation❞ error... let's soothe the system a bit. 😅

A1:
🧩 The Problem
You're importing a dump that uses the collation utf8mb4_0900_ai_ci, which is not supported by MariaDB 10.6 — that collation was introduced in MySQL 8.0, and MariaDB doesn’t implement it.

💡 The Merciful Fixes
Here are some options to resolve this error gracefully:

🛠️ 1. Modify the Dump File Before Importing
Open the .sql dump file and replace all occurrences of utf8mb4_0900_ai_ci with a compatible collation like utf8mb4_general_ci.

One-liner fix:

bash
sed -i 's/utf8mb4_0900_ai_ci/utf8mb4_general_ci/g' your_dump.sql
(Works on Linux/macOS. On Windows, use a code editor like VS Code to find/replace.)

✅ 2. Generate a Compatible Dump from MySQL
If you still have access to the original MySQL server:

Use the --default-character-set=utf8mb4 flag

Avoid dumping collation info or force compatible ones

Example:

bash
mysqldump --default-character-set=utf8mb4 --skip-set-charset --skip-comments -u user -p dbname > compatible_dump.sql
🧪 3. Upgrade MariaDB to Version 10.11+ (Optional)
MariaDB has slowly begun supporting broader collation compatibility. If upgrading is an option for you, version 10.11+ might offer fewer compatibility issues. Still, it won't support MySQL 8 collations fully — MySQL and MariaDB have diverged in some ways.

Let me know which approach you'd like to try, or if you want help automating the replacement. I’ve got a shell script or even a Python snippet ready if you want to go the smooth operator route. 😎