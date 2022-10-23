# Список внесенных изменений в ходе модифицирования

### Убраны присваивания, не влияющие на логику программы:

**main.s**
``` assembly
- lea	rax, .LC0[rip]
- mov	rdi, rax
+ lea rdi, .LC0[rip]
```

``` assembly
- lea	rax, -420[rbp]
- mov	rsi, rax
+ lea rsi, -420[rbp]
```

``` assembly
- lea	rax, .LC1[rip]
- mov	rdi, rax
+ lea rdi, .LC1[rip]
```

``` assembly
# mov	eax, DWORD PTR -96[rbp+rax*4]
# mov	esi, eax
mov esi, DWORD PTR -96[rbp+rax*4]
```

``` assembly
- mov	eax, DWORD PTR -4[rbp]
- mov	esi, eax
+ mov esi, DWORD PTR --4[rbp]
```

``` assembly
- lea	rax, .LC2[rip]
- mov	rdi, rax
+ lea rdi, .LC2[rip]
```

``` assembly
- lea	rax, -208[rbp]
- mov	rdi, rax
+ lea rdi, -208[rbp]
```

``` assembly
- mov	ecx, DWORD PTR -420[rbp]
- mov	esi, esx
+ lea esi, DWORD PTR -420[rbp]
```

``` assembly
- mov eax, DWORD PTR -416[rbp+rax*4]
- mov	esi, eax
+ lea esi, DWORD PTR -416[rbp+rax*4]
```

``` assembly
- lea	rax, .LC3[rip]
- mov	rdi, rax
+ lea rdi, .LC3[rip]
```
### Удалены cdqe
```assembly
cdqe
```

### Вручную удалены строки, не влияющие на ход программы, в конце каждого файла
``` assembly
	.ident	"GCC: (Debian 11.3.0-5) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
```
