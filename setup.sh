#!/bin/bash

# Скрипт для автоматической настройки SQLite и создания тестовой базы данных
# Выполнять внутри WSL (Ubuntu)

echo "=== 1. Обновление системы и установка SQLite ==="
sudo apt update -y
sudo apt install sqlite3 -y

echo "=== 2. Создание базы данных и таблицы users ==="
# Создаем базу данных test.db и выполняем SQL-команды внутри неё
sqlite3 test.db <<EOF
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    age INTEGER,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name, email, age) VALUES 
('Иван', 'ivan@mail.ru', 25),
('Мария', 'maria@mail.ru', 30),
('Петр', 'petr@mail.ru', 22);

.mode column
.headers on
SELECT * FROM users;
EOF

echo "=== 3. Готово! База данных test.db создана ==="
echo "Для проверки введите: sqlite3 test.db 'SELECT * FROM users;'"
