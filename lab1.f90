character ai,bi,ci
character*3 op
logical a,b,c
real r
1 format(A1)
2 format(A3)

write(*,*) "First symbol"
read(*,1) ai
write(*,*) "Second symbol"
read(*,1) bi
write(*,*) "Third symbol"
read(*,1) ci

write(*,*) "Print operation (or,and,xor)"
read(*,2) op

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

if (op.eq."and") then
r=funcAND(a,b,c)
endif

if (op.eq."or") then
r=funcOR(a,b,c)
endif

if (op.eq."xor") then
r=funcXOR(a,b,c)
endif

write(*,*)

if (r.eq.1) then
write(*,*) "TRUE"
else
   write(*,*) "FALSE"
endif

end program

real function funcOR (a,b,c)
  logical a,b,c,r
  r=a.or.b.or.c
  if (r.eqv..true.) then
     result=1
  else
     result=0
  endif
end function funcOR

real function funcAND (a,b,c)
  logical a,b,c,r
  r=a.and.b.and.c
  if (r.eqv..true.) then
     result=1
  else
     result=0
  endif
end function funcAND


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



