# Install

- whalebrew install ghcr.io/wtnb75/gawkextlib

# Usage

## mpfr

```
# gawkextlib -l mpfr 'BEGIN {x=665857; y=470832; \
  print mpfr_sub(mpfr_sub(mpfr_pow(x, 4), mpfr_mul(4, mpfr_pow(y, 4))), 4 * y^2)}'
1.1885568000000000E7
# gawkextlib -l mpfr 'BEGIN {MPFR_PRECISION=1000; print "pi = " mpfr_const_pi() }'
pi = 3.14159265358979323846264338327950288419716939937510582097494459230781640628620899862803482534211706798214808651328230664709384460955058223172535940812848111745028410270193852110555964462294895493038196442881097566593344612847564823378678316527120190914564856692346034861045432664821339360726024914127360
```

## json

```
# gawkextlib -l filefuncs -l json 'BEGIN {stat(".", data); print json::to_json(data);}'
{"blksize":4096,"devbsize":512,"mtime":1612923637,"mode":16877,"type":"directory","dev":105,"gid":0,"ino":56734366,"ctime":1612923637,"blocks":0,"nlink":66,"name":".","atime":1612923638,"pmode":"drwxr-xr-x","size":2112,"uid":0}
```

# Links

- [gawkextlib](http://gawkextlib.sourceforge.net/)
