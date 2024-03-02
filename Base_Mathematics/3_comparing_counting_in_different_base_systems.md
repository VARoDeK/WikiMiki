
---

| [Home](/README.md) | [Index](./README.md) | [Back](./2_How_Counting_Works.md) | [Next](./4_Base_Conversions.md) |
| :---: | :---: | :---: | :---: |

---

# Comparing counting in different base systems

We will use:

1) Decimal :
   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
   | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |

3) Binary :
   | 0 | 1 |
   | :---: | :---: |

4) Octal :
   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
   | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |

5) Hexadecimal :
   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | A | B | C | D | E | F |
   | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |

---   

| Decimal | Binary | Octal | Hexadecimal |
| :---: | :---: | :---: | :---: |
| The number _'A'_ in each row is (_A)<sub>10</sub>_ | The number _'A'_ in each row is (_A)<sub>2</sub>_ | The number _'A'_ in each row is (_A)<sub>8</sub>_ | The number _'A'_ in each row is (_A)<sub>16</sub>_ |
| _0_ | _0_ | _0_ | _0_ |
| _1_ | _1_ | _1_ | _1_ |
| _2_ | _10_ | _2_ | _2_ |
| _3_ | _11_ | _3_ | _3_ |
| _4_ | _100_ | _4_ | _4_ |
| _5_ | _101_ | _5_ | _5_ |
| _6_ | _110_ | _6_ | _6_ |
| _7_ | _111_ | _7_ | _7_ |
| _8_ | _1000_ | _10_ | _8_ |
| _9_ | _1001_ | _11_ | _9_ |
| _10_ | _1010_ | _12_ | _A_ |
| _11_ | _1011_ | _13_ | _B_ |
| _12_ | _1100_ | _14_ | _C_ |
| _13_ | _1101_ | _15_ | _D_ |
| _14_ | _1110_ | _16_ | _E_ |
| _15_ | _1111_ | _17_ | _F_ |
| _16_ | _10000_ | _20_ | _10_ |
| _17_ | _10001_ | _21_ | _11_ |
| _18_ | _10010_ | _22_ | _12_ |
| _19_ | _10011_ | _23_ | _13_ |
| _20_ | _10100_ | _24_ | _14_ |
| _21_ | _10101_ | _25_ | _15_ |
| _22_ | _10110_ | _26_ | _16_ |
| _23_ | _10111_ | _27_ | _17_ |
| _24_ | _11000_ | _30_ | _18_ |
| _25_ | _11001_ | _31_ | _19_ |
| _26_ | _11010_ | _32_ | _1A_ |
| _27_ | _11011_ | _33_ | _1B_ |
| _28_ | _11100_ | _34_ | _1C_ |
| _29_ | _11101_ | _35_ | _1D_ |
| _30_ | _11110_ | _36_ | _1E_ |
| _31_ | _11111_ | _37_ | _1F_ |
| _32_ | _100000_ | _40_ | _20_ |
| _33_ | _100001_ | _41_ | _21_ |
| _34_ | _100010_ | _42_ | _22_ |
| _35_ | _100011_ | _43_ | _23_ |
| _36_ | _100100_ | _44_ | _24_ |
| _37_ | _100101_ | _45_ | _25_ |
| _38_ | _100110_ | _46_ | _26_ |
| _39_ | _100111_ | _47_ | _27_ |
| _40_ | _101000_ | _50_ | _28_ |

---

## 1) - Every base/radix is written as '10' in its respective base/radix number system.

1) __Base-10__ (Decimal) : 10 is written as _(10)<sub>10</sub>_ .

2) __Base-2__ (Decimal) : 2 is written as _(10)<sub>2</sub>_ .

3) __Base-8__ (Decimal) : 8 is written as _(10)<sub>8</sub>_ .

4) __Base-16__ (Decimal) : 16 is written as _(10)<sub>16</sub>_ .

This is the outcome of mathematical rule defined for number systems.

---

## 2) - n<sup>th</sup> power to base/radix is equal to '1' followed by 'n' zeros in its respective number system.

1) __Base-10__ (Decimal) :

   |  |  |
   | :--- | :--- |
   | 10<sup>0</sup> | _(1)<sub>10</sub>_ |
   | 10<sup>1</sup> | _(10)<sub>10</sub>_ |
   | 10<sup>2</sup> | _(100)<sub>10</sub>_ |
   | 10<sup>3</sup> | _(1000)<sub>10</sub>_ |
   | 10<sup>4</sup> | _(10000)<sub>10</sub>_ |

2) __Base-2__ (Decimal) :

   |  |  |  |
   | :--- | :--- | :--- |
   | 2<sup>0</sup> | _(1)<sub>2</sub>_ | _(1)<sub>10</sub>_ |
   | 2<sup>1</sup> | _(10)<sub>2</sub>_ | _(2)<sub>10</sub>_ |
   | 2<sup>2</sup> | _(100)<sub>2</sub>_ | _(4)<sub>10</sub>_ |
   | 2<sup>3</sup> | _(1000)<sub>2</sub>_ | _(8)<sub>10</sub>_ |
   | 2<sup>4</sup> | _(10000)<sub>2</sub>_ | _(16)<sub>10</sub>_ |

3) __Base-8__ (Decimal) :

   |  |  |  |
   | :--- | :--- | :--- |
   | 8<sup>0</sup> | _(1)<sub>8</sub>_ | _(1)<sub>10</sub>_ |
   | 8<sup>1</sup> | _(10)<sub>8</sub>_ | _(8)<sub>10</sub>_ |
   | 8<sup>2</sup> | _(100)<sub>8</sub>_ | _(64)<sub>10</sub>_ |
   | 8<sup>3</sup> | _(1000)<sub>8</sub>_ | _(512)<sub>10</sub>_ |
   | 8<sup>4</sup> | _(10000)<sub>8</sub>_ | _(4096)<sub>10</sub>_ |

4) __Base-16__ (Decimal) :

   |  |  |  |
   | :--- | :--- | :--- |
   | 16<sup>0</sup> | _(1)<sub>16</sub>_ | _(1)<sub>10</sub>_ |
   | 16<sup>1</sup> | _(10)<sub>16</sub>_ | _(16)<sub>10</sub>_ |
   | 16<sup>2</sup> | _(100)<sub>16</sub>_ | _(256)<sub>10</sub>_ |
   | 16<sup>3</sup> | _(1000)<sub>16</sub>_ | _(4096)<sub>10</sub>_ |
   | 16<sup>4</sup> | _(10000)<sub>16</sub>_ | _(65536)<sub>10</sub>_ |

This is the outcome of mathematical rule defined for number systems.

---

## 4) - Multiplying a number by base/radix, in its respective base/radix number system, is equal to adding a trailing zero towards right of the number.

Let's take number _(2)<sub>10</sub>_ .

1) __Base-10__ (Decimal) :

   |  |  |
   | :--- | :--- |
   | 2 x 10 | _(20)<sub>10</sub>_ |
   | 20 x 10 | _(200)<sub>10</sub>_ |

2) __Base-2__ (Decimal) :

   |  |  |  |
   | :--- | :--- | :--- |
   | _(10)<sub>2</sub>_ x 2 | _(100)<sub>2</sub>_ | _(4)<sub>10</sub>_ |
   | _(100)<sub>2</sub>_ x 2 | _(1000)<sub>2</sub>_ | _(8)<sub>10</sub>_ |

3) __Base-8__ (Decimal) :

   |  |  |  |
   | :--- | :--- | :--- |
   | _(2)<sub>8</sub>_ x 8 | _(20)<sub>8</sub>_ | _(16)<sub>10</sub>_ |
   | _(20)<sub>8</sub>_ x 8 | _(200)<sub>8</sub>_ | _(128)<sub>10</sub>_ |

4) __Base-16__ (Decimal) :

   |  |  |  |
   | :--- | :--- | :--- |
   | _(2)<sub>16</sub>_ x 16 | _(20)<sub>16</sub>_ | _(32)<sub>10</sub>_ |
   | _(20)<sub>16</sub>_ x 16 | _(200)<sub>16</sub>_ | _(512)<sub>10</sub>_ |

This is the outcome of mathematical rule defined for number systems.

---