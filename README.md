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
Автогенерация массива выбирается в ходе программы (если не выбран ввод из файла)

3. Если вы выбрали ввод из файла, перед тестированием **вам необходимо подготовить папку tests рядом с .exe, в которой будут 2 файла*:
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

**[Тестирование программы через консоль](https://github.com/Grisha1232/ABC_HW1/blob/11f8f2bae719ae82b6c1085f6cc74448fef6fdb6/Tests.md)**
### Итог:
Сделана программа на С. Сделан перевод в Assembler и добавлены комментарии в него. Проведены тест показывающи что программа работает одинакого послемодификаций

## Задание на 5
**Модифицированый С файл:**
* [main.c](https://github.com/Grisha1232/ABC_HW1/blob/5eb8b89f7a43c0678172010ffe32821a6cd6f881/Code%20C%20modification/main.c)
* [MakeB.c](https://github.com/Grisha1232/ABC_HW1/blob/5eb8b89f7a43c0678172010ffe32821a6cd6f881/Code%20C%20modification/MakeB.c)

**Добавлено:**
* Реализована функция с передачей параметров в нее

**Модифицированый Assembler:**
* [main.s](https://github.com/Grisha1232/ABC_HW1/blob/8d450683e05496c9b232887114519fa149bd5692/Assembler%20mod/main.s)
* [task.s](https://github.com/Grisha1232/ABC_HW1/blob/8d450683e05496c9b232887114519fa149bd5692/Assembler%20mod/MakeB.s)


**Добавлено:**
* Комментарии описывающий все действия просиходимые на Assembly

### Итог:
Переделан С файл: добавлена функция с параметрами. Assembler прокомментирован все действия и переменные в аналогичном С файле. [Тестиование]() показало что программы все еще работает идентично.

## Задание на 6
**Использован регистр r12d для переменной i для итераций**
**Сохранил An и Bn в регистры r13d и r14d соответсвенно**

**Модифицированый Assembler:**
* [main.s](https://github.com/Grisha1232/ABC_HW1/blob/8d450683e05496c9b232887114519fa149bd5692/Assembler%20mod/main.s)
* [task.s](https://github.com/Grisha1232/ABC_HW1/blob/8d450683e05496c9b232887114519fa149bd5692/Assembler%20mod/MakeB.s)

### Итог:
Переделан Assembler файл: добавлено сохранение в регистры переменных An и Bn, а также используется регистр для итерации по циклу. [Тестирование]() показало идентичность работы C файла b Assembler сборки.

## Задание на 7

## Задание на 8
