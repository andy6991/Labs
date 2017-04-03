!ПРИМЕЧАНИЕ: Функции выполнены типа real, так как не все трансляторы правильно транслируют функции с другими типами данных (действует правило умолчания)

!вводимые символы
character ai,bi,ci
!имя операции
character*3 op
!после перевода в ложь/истину соответственно заданию
logical a,b,c
!результат выполнения функции
real r
!форматы для ввода символов и операций
1 format(A1)
2 format(A3)

!ввод символов
write(*,*) "First symbol"
read(*,1) ai
write(*,*) "Second symbol"
read(*,1) bi
write(*,*) "Third symbol"
read(*,1) ci

!ввод операции
write(*,*) "Print operation (not(only for first symbol),or,and,xor)"
read(*,2) op

!переводы из символьного типа в логический соответственно заданию
if (ai.eq.'0') then
a=.false.
else
   a=.true.
endif

if (bi.eq.'0') then
b=.false.
else
   b=.true.
endif

if (ci.eq.'0') then
c=.false.
else
   c=.true.
endif

!вызов функций соответствующей операции
if (op.eq."and") then
r=funcAND(a,b,c)
endif

if (op.eq."or") then
r=funcOR(a,b,c)
endif

if (op.eq."xor") then
r=funcXOR(a,b,c)
endif

if (op.eq."not") then
   r=funcNOT(a)
   endif

write(*,*)

! вывод результата
if (r.eq.1) then
write(*,*) "TRUE"
else
   write(*,*) "FALSE"
endif

end program

!функция дизъюнкции
real function funcOR (a,b,c)
  logical a,b,c,r
  r=a.or.b.or.c
  if (r.eqv..true.) then
     result=1
  else
     result=0
  endif
end function funcOR

!функция конъюнкции
real function funcAND (a,b,c)
  logical a,b,c,r
  r=a.and.b.and.c
  if (r.eqv..true.) then
     result=1
  else
     result=0
  endif
end function funcAND

! сложение по модулю 2
real function funcXOR (a,b,c)
  logical a,b,c,r,p
  p=(a.and..not.b).or.(.not.a.and.b)
  r=(p.and..not.c).or.(.not.p.and.c)
  if (r.eqv..true.) then
     result=1
  else
     result=0
  endif
end function funcXOR

!отрицание
real function funcNOT (a)
  logical a,r
  r=.not.a
  if (r.eqv..true.) then
     result=1
  else
     result=0
  endif
end function funcNOT




