# ScholarAcad Database Deployment Guide

This directory contains the database files for deploying the ScholarAcad backend to production, staging, or local development environments.

## Files Included

1. **`scholaracad_database.zip` (Recommended for Full Setup)**:
   - Contains `scholaracad_db_dump.sql` (Full database with all 127 tables, complete course catalogs, modules, FAQs, schemas, dynamic course pages, DSA course data, quizzes, and user roles).
   - Clean UTF-8 format ready for MySQL 5.7+ / MariaDB 10.3+.

2. **`scholaracad_schema.sql` (DDL Structure Only)**:
   - Contains all `CREATE TABLE` and constraint statements for 127 tables without row data.

---

## Quick Import Instructions (Live / Staging / Local)

### Option 1: Full Database Import (Recommended)

1. Extract the zip file:
   ```bash
   # Linux / macOS / cPanel Terminal
   unzip database/scholaracad_database.zip -d database/

   # Windows PowerShell
   Expand-Archive -Path database/scholaracad_database.zip -DestinationPath database/ -Force
   ```

2. Create the database in MySQL / MariaDB (if not already created):
   ```sql
   CREATE DATABASE IF NOT EXISTS scolarcad CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```

3. Import the SQL dump:
   ```bash
   mysql -u <username> -p scolarcad < database/scholaracad_db_dump.sql
   ```

4. Configure your `.env` file:
   ```env
   DB_CONNECTION=mysql
   DB_HOST=127.0.0.1
   DB_PORT=3306
   DB_DATABASE=scolarcad
   DB_USERNAME=<your_db_username>
   DB_PASSWORD=<your_db_password>
   ```

5. Run post-deployment optimization:
   ```bash
   php artisan optimize:clear
   php artisan optimize
   php artisan storage:link
   ```

---

### Option 2: Schema Only (Clean Setup)

If you only want the table structures:
```bash
mysql -u <username> -p scolarcad < database/scholaracad_schema.sql
```

