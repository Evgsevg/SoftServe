#!/bin/bash
mysqldump $1 > test.sql
mysql $2 -uusername -ppassword < test.sql
rm test.sql