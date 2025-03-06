#!/bin/bash

PASSWORD="./password_manager.txt"

if [ ! -f $PASSWORD ]; then
  touch $PASSWORD
fi

echo "パスワードマネージャーへようこそ！"
echo "サービス名を入力してください："
read service_name

echo "ユーザー名を入力してください："
read user_name

echo "パスワードを入力してください："
read password

echo

echo "$service_name:$user_name:$password" >> $PASSWORD
echo "Thank you!"
