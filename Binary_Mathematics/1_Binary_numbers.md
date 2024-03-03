
---

| [Home](/README.md) | [Index](./README.md) | [Back](./README.md) | [Next](./2_Binary_to_decimal_and_vice_versa.md) |
| :---: | :---: | :---: | :---: |

---

# Binary Numbers

Before going through the notes of binary numbers in this Wiki, please read [Base (Mathematics)](/Base_Mathematics/README.md) from this Wiki. Binary numbers are the subset of Base-Mathematics.

Binary is Base-2, that means we can count 2 objects using unique digits and/or letters. `0` and `1` .

The standard way to write a Binary number _A_ with base _χ_ is: ___(A)<sub>χ</sub>___

---

## 1) - Writing `2` in Binary form:

Every base/radix is written as '10' in its respective base/radix number system.

---

## 2) - nth power to 2 (in binary notation) is equal to '1' followed by 'n' zeros.

__Base-2__ (compared to Decimal) :

   |  |  |  |
   | :--- | :--- | :--- |
   | 2<sup>0</sup> | _(1)<sub>2</sub>_ | _(1)<sub>10</sub>_ |
   | 2<sup>1</sup> | _(10)<sub>2</sub>_ | _(2)<sub>10</sub>_ |
   | 2<sup>2</sup> | _(100)<sub>2</sub>_ | _(4)<sub>10</sub>_ |
   | 2<sup>3</sup> | _(1000)<sub>2</sub>_ | _(8)<sub>10</sub>_ |
   | 2<sup>4</sup> | _(10000)<sub>2</sub>_ | _(16)<sub>10</sub>_ |


---

## 3) - Counting in Binary till 40

| Decimal | Binary |
| :---: | :---: |
| The number _'A'_ in each row is (_A)<sub>10</sub>_ | The number _'A'_ in each row is (_A)<sub>2</sub>_ |
| _0_ | _0_ |
| _1_ | _1_ |
| _2_ | _10_ |
| _3_ | _11_ |
| _4_ | _100_ |
| _5_ | _101_ |
| _6_ | _110_ |
| _7_ | _111_ |
| _8_ | _1000_ |
| _9_ | _1001_ |
| _10_ | _1010_ |
| _11_ | _1011_ |
| _12_ | _1100_ |
| _13_ | _1101_ |
| _14_ | _1110_ |
| _15_ | _1111_ |
| _16_ | _10000_ |
| _17_ | _10001_ |
| _18_ | _10010_ |
| _19_ | _10011_ |
| _20_ | _10100_ |
| _21_ | _10101_ |
| _22_ | _10110_ |
| _23_ | _10111_ |
| _24_ | _11000_ |
| _25_ | _11001_ |
| _26_ | _11010_ |
| _27_ | _11011_ |
| _28_ | _11100_ |
| _29_ | _11101_ |
| _30_ | _11110_ |
| _31_ | _11111_ |
| _32_ | _100000_ |
| _33_ | _100001_ |
| _34_ | _100010_ |
| _35_ | _100011_ |
| _36_ | _100100_ |
| _37_ | _100101_ |
| _38_ | _100110_ |
| _39_ | _100111_ |
| _40_ | _101000_ |

---

## 4) - Multiplying a number by 2<sup>n</sup> in Binary

It is equal to adding `n` trailing zeros towards the right of the number.

| Number | Binary | x (2<sup>1</sup> = 2) | x (2<sup>2</sup> = 4) | x (2<sup>3</sup> = 8) | x (2<sup>4</sup> = 16) |
| :---: | :---: | :---: | :---: | :---: | :---: |
| 3 | 11 | 110 | 1100 | 11000 | 110000 |
| 4 | 100 | 1000 | 10000 | 100000 | 1000000 |
| 5 | 101 | 1010 | 10100 | 101000 | 1010000 |
| 6 | 110 | 1100 | 11000 | 110000 | 1100000 |
| 7 | 111 | 1110 | 11100 | 111000 | 1110000 |