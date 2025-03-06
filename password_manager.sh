#!/bin/bash

PASSWORD="./password_manager.txt"

if [ ! -f $PASSWORD ]; then
  touch $PASSWORD
fi

echo "パスワードマネージャーへようこそ！"

while true; do
echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
read choice

case $choice in
  "Add Password" )
    echo "サービス名を入力してください："
    read service_name

    echo "ユーザー名を入力してください："
    read user_name

    echo "パスワードを入力してください："
    read password

    echo

    echo "$service_name:$user_name:$password" >> $PASSWORD
    echo "Thank you!"
    ;;
  "Get Password" )
    echo "サービス名を入力してください："
    read service_name

    result=$(grep "$service_name:" "$PASSWORD")

    if [ -z "$result" ]; then
      echo "そのサービスは登録されていません。"
    else
      IFS=':' read -r result_service result_user result_pass <<< "$result"
      echo "サービス名：$result_service"
      echo "ユーザー名：$result_user"
      echo "パスワード：$result_pass"
    fi
    ;;
  "Exit" )
    echo "Thank you!"
    exit 0
    ;;
  * )
    echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
    ;;
esac
done
