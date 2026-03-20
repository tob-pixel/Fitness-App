# Для лінтінгу було обрано swiftlint
## Причини вибору
Swiftlint було обрано, бо він найпопулярніший інструмент лінтингу в розробці.



## Базові правила та їх пояснення
### Basic rules
file_length:
 warning: 400
 error: 200 

type_body_length:
 warning: 250
 error: 400

identifier_name:
 min_length: 2
 max_length: 20
 
 ### Пояснення
 file_length:       Розмір файлу
 type_body_length:  Розмір класу/структури
 identifier_name:   Довжина назв змінних/функцій



## Інструкція з запуску лінтера
Для запуску лінтера необхідно наступне:
0. Завантажити лінтер
1. Створити .swiftlint.yml в корені проєкту
2. Запустити лінтер командою 'swiftlint'
