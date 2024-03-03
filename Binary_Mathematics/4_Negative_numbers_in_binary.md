
---

| [Home](/README.md) | [Index](./README.md) | [Back](./3_Addition_in_binary_numbers.md) | [Next](./5_Bitwise_operations.md) |
| :---: | :---: | :---: | :---: |

---

# Representation of Negative numbers in Binary number system

For general mathematics we can just write `-5 ` as `-0101`. But how would you tell the computer about this negative sign?

We will need a special register to store the flag for positive or negatve. But it will be complicated to store the number and the flag separately.

Thus we use the most-significant bit, or the left-most bit as a flag. If left-most bit is `0` => positive, if `1` => negative. Thus if `5` is `0101`, then one of the way of representing `-5` is `1101`. It is just a way of representation. The numbers are called as __Signed-Numbers__, as they have a sign/ flag to tell if the number is positive or negative.


But why `1101` is not `13`? This is why the size of a number, in terms of bytes or bits, is important in computers. So, for the above examples, if we decide to represent the number in 4 bits; and if we are using the left-most bit for the flag, only remaining 3 bits decide the value of the number. Now if we are using 8 bit to represent a random number `1001`, it becomes `00001001`. In this case the most-significant bit is zero. Thus it's a positive number `9`. And the representation of `-5` (using only flag method) in 8-bit will now be `10000101`.

__Thus, the negative numbers make sense only for signed-numbers. The value of most-significant bit means nothing for unsigned-numbers in terms of negative/positive.__

Now with left-most bit as a flag, there are several ways to represent a negative numbers even with this flag:
 - Simply the flag.
 - 1's Complement.
 - 2's Complement.

---

## 1) - Just the flag

This is the simplest way to represnt a negative number, but we still cannot do meaningful calculations with them. Let's take 4-bit signed-numbers `6` and `5` (`0110` and `0101`). We want to do `6-5`:

```

6 - 5 => 6 + (-5)

=> 0110 + (-0101)
=> 0110 + 1101 = 1011
=> 1011 => -3 ?

```

Thus we still need to find a meaningful way to do calculations. This is why we use __2's Complement__ for this purpose.

---

## 2) - 1's Complement

To find the 1's complement of a number, just invert the bits. Let's use 4-bit signed-numbers for examples.

| Number | Binary | 1's complement |
| :---: | :---: | :---: |
| 2 | 0010 | 1101 |
| 3 | 0011 | 1100 |
| 4 | 0100 | 1011 |
| 5 | 0101 | 1010 |

---

## 3) - 2's Complement

To find the 2's complement of a number, just add `1` to its 1's complement.

| Number | Binary | 1's complement | 2's complement |
| :---: | :---: | :---: | :---: |
| 2 | 0010 | 1101 | 1110 |
| 3 | 0011 | 1100 | 1101 |
| 4 | 0100 | 1011 | 1100 |
| 5 | 0101 | 1010 | 1011 |

Let's try the subtraction again with 2's complement this time:

```

6 - 5
= 0110 + (-0101)
= 0110 + 1011 /* 2's complement of 5 */
= 0001
= 1

```

```

5 - 2
= 0101 + (-0010)
= 0101 + 1110   /* 2's complement of 2 */
= 0011
= 3

```

This is why computers use 2's complement to do subtraction.

---

__Trick method to calculate 2's complement of a binary number:__ Start with the right-most (least-significant) bit. Keep coping the bits. As soon as you encounter a `1`, copy it, and invert all the bits thereafter.

For example 4: `0100`

```
0100
   0    /* Copy the bit */
  00    /* Copy the bit */
 100    /* We encountered our 1st '1'. Copy it and invert rest */
1100    /* Copy the inverted value */
```

For example 5: `0101`

```

0101
   1    /* We encountered our 1st '1'. Copy it and invert rest */
  11    /* Copy the inverted value */
 011    /* Copy the inverted value */
1011    /* Copy the inverted value */

```
---

## 4) - Finding absolute value of the negative number

We know how to convert from negative to positive, but what about vice-versa? How do we know the value of 4 bit signed-number `1011`?

This is actually simple and obvious. `-(-x) = x`. Thus to get the absolute value:
- if just the most-significant bit is used as a flag, invert the flag.
- if the negative number is represnted in 1's complement, find 1's complement of that negative number.
- if the negative number is represnted in 2's complement, find 2's complement of that negative number.

This is why it is important to know how the negative number is represented by your system. __Although, all modern computers use two’s-complement representation for negative integers.__

So, what is the value of `1011`?

```

1011  /* Most significant bit is '1'. Thus, a negative number. */
1011  /* We are sure that 2's complement is used for representation. */
1011  /* We again do 2's complement on it. */

1011  /* We can use trick method */
   1
  01
 101
0101

=> 0101 = 5
=> 1011 = -5

```

---

__Trick question: What is the value of 4-bit unisgned-number 1011?__

Answer is '11'. Because even though the most-significant bit is '1', it is an unisnged number. That means, we are not considering the most-significant bit as a flag, and it is actually a part of the number.

---