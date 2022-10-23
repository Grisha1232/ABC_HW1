# Арзитектура вычислительных систем. ИДЗ №1 Вариант 2. Селезнев Григорий Ильич БПИ217.
HomeWork assembler

## Как устроена программа:
1. Если вы хотите протестировать консольный ввод:
```
/.your_name.exe 
```
2. Если вы хотите протестировать файловый ввод/вывод:
```
/.your_name.exe 2
```
Для того чтобы файловый ввод/вывод работал нужно разместить рядом папку tests и в ней сощдать два файла input.txt и output.txt

Автогенерация массива 

2. Далее на экране появится меню с опцией тестирования:
* Введите 1 для ввода через консоль
* Введите 2 для ввода из файла
* Введите 3 для автоматической генерации

3. Если вы выбрали ввод из файла, перед тестированием **вам необходимо подготовить 2 файла рядом с файлом .exe**:
* input.txt - файл,  содержащий элементы массива
* output.txt - файл, содержащий элементы нового массива

## Задание на 4 балла:
**Решение задачи на C** 
* [main.c](https://github.com/Grisha1232/ABC_HW1/blob/f542b608b7c37298f6263707242377c0741eb155/Code%20C/main.c)
* [task.c](https://github.com/Grisha1232/ABC_HW1/blob/f542b608b7c37298f6263707242377c0741eb155/Code%20C/MakeB.c)

**Не модифицированный код на Assembly с комментариями**
* [main.s](https://github.com/Grisha1232/ABC_HW1/blob/e89caab8dc8a15d51fdd36d5f4ace083e2b04bff/Assembler%20non%20mod/main.s)
* [task.s](https://github.com/Grisha1232/ABC_HW1/blob/e89caab8dc8a15d51fdd36d5f4ace083e2b04bff/Assembler%20non%20mod/MakeB.s)

**Модифицированный код на Assembly с комментариями**
* [main.s](https://github.com/Grisha1232/ABC_HW1/blob/8d450683e05496c9b232887114519fa149bd5692/Assembler%20mod/main.s)
* [task.s](https://github.com/Grisha1232/ABC_HW1/blob/8d450683e05496c9b232887114519fa149bd5692/Assembler%20mod/MakeB.s)

**[Список модификаций](https://github.com/Grisha1232/ABC_HW1/blob/0479954046a9d354ebb5a970958cc839ca8e05a4/Mod.md)**

**[Тестирование программы через консоль]**
