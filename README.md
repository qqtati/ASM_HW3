# avs_idz3

БПИ219 Талалаев Геннадий Алексеевич

Мой вариант 3 представлен ниже:

![v3](img/var.png)

---
**Формат ввода:**
- Программа запускается через командую строку в формате:

```
./ans {a} {file.in (опционально)} {file.txt(опционально)}
```
- Вводится число a: 

1 -> генерируется рандомное число
```
./ans 1
```
2 -> входной параметр вводится следующим аргументом
```
./ans 2 -27
```
3 -> вводится два файла (входной и выходной). 
```
./ans 3 input.txt output.txt
```
---
**Формат вывода.**
Выводится 3 строки в формате:
```
Result: {результат}
Precision: {точность}
Time: {результат замера по времени для выполнения программы 1000 раз}
```
---
## 4 балла
![4_1](crit/4_1.png)
 - В проекте это два файла p1.c и p2.c
---
![4_2](crit/4_2.png)

- Компиляция без отладочных опций:

![compilation1](img/1.png)

- После компиляции созданы файлы p1.s и p2.s, комментарии написаны в них.
---

![4_3](crit/4_3.png)

- Использованы аргументы командой строки и ручное редактирование, получились файлы p1_v2.s и p2_v2.s.

![compilation2](img/2.png)

---
![4_4](crit/4_4.png)

- Программа скомпилирована и скомпонована без опций отладки
![compilation3](img/3.png)

---
![4_5](crit/4_5.png)

**Тесты (для всех трех программ)**


![4_5](test/test1.png)

---
![4_6](crit/4_6.png)

- Отчёт сформирован.
---
## 5 баллов
![5_1](crit/5_1.png)

- Функции с передачей данных через параметры использованы (файл part2.c)

```
double factorial(double x) {
    double i = 1;
    while (x > 0) {
        i *= x;
        --x;
    }
    return i;
}
```

---
![5_2](crit/5_2.png)

- Локальные переменные использованы. Это можно увидеть в файле part1.c
```
double val;
double result = 0;
double next;
double a = 0;
```
---
![5_3](crit/5_3.png)
-   В ассемблерную программу при вызове функции добавлены комментарии, описывающие передачу фактических параметров и перенос возвращаемого результата. Это можно увидеть в файлах p1_v2.s и p2_v2.s
---
![5_4](crit/5_4.png)
-    В функциях для формальных параметров добавлены комментарии, описывающие связь между параметрами языка Си и регистрами (стеком). Это можно увидеть в файлах p1_v2.s и p2_v2.s
---
![5_5](crit/5_5.png)

- Информация добавлена в отчёт

## 6 баллов
![6_1](crit/6_1.png)

- Произведёе рефакторинг программы за счёт максимального использования регистров. Это можно увидеть в файлах p1_v3.s и p2_v3.s

---
![6_2](crit/6_2.png)
- Комментарии добавлены в файлы p1_v3.s и p2_v3.s

---
![6_3](crit/6_3.png)
*Тест 1*
![]()
*Тест 2*
![]()
*Тест 3*
![]()
*Тест 4*
![]()
*Тест 5*
![]()
*Тест 6*
![]()
*Тест 7*
![]()
*Тест 8*
![]()
*Тест 9*
![]()
*Тест 10*
![]()
---
- Вес файла p1.s - 7 164  Б.
- Вес файла p1_v3.s - 5 653 Б.
- Вес файла p2.s - 1 103 Б.
- Вес файла p2_v3.s - 851 Б.
---
![6_4](crit/6_4.png)
- Информация добавлена в отчёт.

## 7 баллов
![7_1](crit/7_1.png)
- Выполнена реализация программы на ассемблере в виде двух единиц компиляции (так же разделена программа на C)
```
gcc -Os -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions part1_e.c -S -Wno-unused-result -o ./p1_v3.s

gcc -Os -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions part2_e.c -S -Wno-unused-result -o ./p2_v3.s

gcc p1_v3.s -c -o p1_v3.o

gcc p2_v3.s -c -o p2_v3.o

gcc ./p2_v3.o p1_v3.o ans3 -lm

```
---
![7_2](crit/7_2.png)
- Для ввода/вывода результата из файла необходимо ввести:
```
./ans 3 {path to input file} {path to output file}
```
- Командная строка проверяет корректность, если что-то пойдёт не так - результат будет "Invalid input" и программа завершит выполнение.
---
![7_3](crit/7_3.png) input.txt = {15}
*Тест 1*
![7_3](test/filetests.png)
*Output1*
![7_3](test/output1.png)
*Output2*
![7_3](test/output2.png)
*Output3*
![7_3](test/output3.png)
---
![7_4](crit/7_4.png)
- Добавлена возможность ввода/вывода из файла
- Формат входных файлов input.txt
- Формат выходных файлов output.txt

## 8 баллов
![8_1](crit/8_1.png)
- Добавлен генератор случайных чисел
```
double randomValue() {
    srand(time(NULL));
    return -100 + (double) rand() / RAND_MAX * (115);
}
```
---
![8_2](crit/8_2.png)
- Есть 3 типа ввода: из файла, из командой строки, рандомые входные данные
1) Рандомные входные данные
```
./ans 1
```
2) Входные данные из командой строки
```
./ans 2 
27
```
3) Входные данные из файла и вывод результата в файл
```
./ans 3 test.txt out.txt
```
---
![8_3](crit/8_3.png)
- Добавлены функции замера времени, это можно увидеть в файле p1.c:
```
struct timespec start;
struct timespec end;
clock_gettime(CLOCK_MONOTONIC, &start);
(Работа программы без ввода/вывода в цикле на 1000 повторений) 
clock_gettime(CLOCK_MONOTONIC, &end);
long long result_time = end.tv_sec * 10e8 + end.tv_nsec - start.tv_sec * 10e8 - start.tv_nsec;
```
---
![8_4](crit/8_4.png)
- Тесты замеры времени
![](test/test1.png)
