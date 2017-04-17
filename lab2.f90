!ПРИМЕЧАНИЕ: Функции выполнены типа real, так как не все трансляторы правильно транслируют функции с другими типами данных (действует правило умолчания)

!вводимые символы
character ai,bi,ci
!после перевода в ложь/истину соответственно заданию
logical a,b,c,s,d

logical x1,a1,a2
!результат выполнения функции
real r

integer i
!форматы для ввода символов и операций
1 format(A1)

do 2 i=1,16
  
!ввод символов
write(*,*) "First symbol"
read(*,1) ai
write(*,*) "Second symbol"
read(*,1) bi
write(*,*) "Third symbol"
read(*,1) ci

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

r=funcXOR3(a,b,c)
if (r.eq.1) then
x1=.true.
else
   x1=.false.
endif

r=funcAND3(a,b,c)
if (r.eq.1) then
a1=.true.
else
   a1=.false.
endif

r=funcXOR2(d,x1)
if (r.eq.1) then
s=.true.
else
   s=.false.
endif

r=funcAND2(d,x1)
if (r.eq.1) then
a2=.true.
else
   a2=.false.
endif

r=funcOR(a2,a1)
if (r.eq.1) then
d=.true.
else
   d=.false.
endif


   
2 continue
   

end program

!функция дизъюнкции
real function funcOR (a,b)
  logical a,b,c,r
  r=a.or.b
  if (r.eqv..true.) then
     result=1
  else
     result=0
  endif
end function funcOR

!функция конъюнкции
real function funcAND3 (a,b,c)
  logical a,b,c,r
  r=a.and.b.and.c
  if (r.eqv..true.) then
     result=1
  else
     result=0
  endif
end function funcAND3

! сложение по модулю 2
real function funcXOR3 (a,b,c)
  logical a,b,c,r,p
  p=(a.and..not.b).or.(.not.a.and.b)
  r=(p.and..not.c).or.(.not.p.and.c)
  if (r.eqv..true.) then
     result=1
  else
     result=0
  endif
end function funcXOR3

!функция конъюнкции
real function funcAND2 (a,b)
  logical a,b,c,r
  r=a.and.b
  if (r.eqv..true.) then
     result=1
  else
     result=0
  endif
end function funcAND2

! сложение по модулю 2
real function funcXOR2 (a,b)
  logical a,b,c,r
  r=(a.and..not.b).or.(.not.a.and.b)
  if (r.eqv..true.) then
     result=1
  else
     result=0
  endif
end function funcXOR2
