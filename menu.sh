#!/bin/bash

# Функция для отображения меню
read_options(){
    clear
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo " M A I N - M E N U"
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo "1.  Start auth container (docker run auth)"
    echo "2.  Stop auth container (docker stop auth)"
    echo "3.  Access auth container shell (docker exec auth)"
    echo "4.  Remove auth container (docker rm auth)"
    echo "0.  Exit"
    read -p "Select your choice [0-4]:" choice
    case "$choice" in
        1)
            dr_auth
            ;;
        2)
            ds_auth
            ;;
        3)
            dex_auth
            ;;
        4)
            drm_auth
            ;;
        0)
            exit 0
            ;;
        *)
            echo "Error... Invalid choice" && sleep 1
            ;;
    esac
}

# Функция для запуска auth контейнера
dr_auth(){
    echo "Starting auth container..."
    docker run -d -p 5173:5173 --name auth-container contest-auth
    condition
}

# Функция для остановки auth контейнера
ds_auth(){
    echo "Stopping auth container..."
    docker stop auth-container
    condition
}

# Функция для доступа в shell auth контейнера
dex_auth(){
    echo "Accessing auth container shell..."
    docker exec -it auth-container /bin/sh
    condition
}

# Функция для удаления auth контейнера
drm_auth(){
    echo "Removing auth container..."
    docker rm auth-container
    condition
}

# Функция для проверки состояния последней команды
condition(){
    if [ $? -eq 0 ]; then
        echo "Command executed successfully"
    else
        echo "Command failed"
    fi
    sleep 2
}

# Бесконечный цикл для отображения меню
while true
do
    read_options
done
