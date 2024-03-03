
---

| [Home](/README.md) | [Index](./README.md) | [Back](./4_Negative_numbers_in_binary.md) | [Next](./6_Shift_operations.md) |
| :---: | :---: | :---: | :---: |

---

# Bitwise Operations

In computer science, operations performed at the level of bits, are called as bitwise operations. Thus, these operations may effect the most-significant bit, and in that case if the number is signed, it will convert a number from positive to negative or vice versa.

---

## 1) - `NOT` ('`~`')

Bitwise `NOT` operation inverts the bits of the number.

`~(01110101) = 10001010`

The value of the result depends on if the number is signed or unsigned. For example:
- 4-bit unsigned-number `0001`. `~(0001) = 1110 => 14`.
- 4-bit signed-number `0001`. `~(0001) = 1110 => -2` _(Negative numbers are represented in 2's complement in modern computers.)_.

__To understand how we calculated the value of negative number, please read the previous chapter__: [Negative numbers in the Binary world](./4_Negative_numbers_in_binary.md).

---

## 2) - `AND` ('`&`')

A bitwise `AND` is a binary operation that takes two equal-length binary representations and performs the __logical `AND`__ operation on each pair of the corresponding bits. Thus, if both bits in the compared position are `1`, the bit in the resulting binary representation is `1 => (1 × 1 = 1)`; otherwise, the result is `0 => (1 × 0 = 0 and 0 × 0 = 0)`.

For example, let's take 4-bits numbers `1001` and `1101`.

```

1001 & 1101 = 1001

```

- if the result is stored in 4-bit unsigned-number: `9`
- if the result is stored in 4-bit signed-number: `-7`

---

If the result is stored in 8-bit signed-number?

```

1001 & 1101
= 00001001 & 00001101   /* Because they are 8-bit numbers */
= 00001001 => 9

```

__Note: This is why the size of number also matters in computers.__

---

But why we didn't care about it in `NOT` operation. Let's see:

```

~(0001)         /* We are assuming it is signed. */
= ~(00000001)   /* Because it is a 8-bit number. */
= 11111110

/* We see most-significant bit is '1' */
/* We take 2's complement to find the absolute value. */

=> 00000010 = 2
=> -2

```

As we can see, apparantly the number size is not affecting the result for bitwise `NOT` operation. Only it signedness.

---

## 3) - `OR` ('`|`')

A bitwise `OR` is a binary operation that takes two bit patterns of equal length and performs the __logical inclusive `OR`__ operation on each pair of corresponding bits. The result in each position is `0` if both bits are `0`, while otherwise the result is `1`.

For example, let's take 4-bits numbers `1001` and `1101`.

```

1001 | 1101 = 1101

```

- if the result is stored in 4-bit unsigned-number: `13`
- if the result is stored in 4-bit signed-number: `-3`

---

If the result is stored in 8-bit signed-number?

```

1001 & 1101
= 00001001 & 00001101   /* Because they are 8-bit numbers */
= 00001101 => 13

```

__Note: This is why the size of number also matters in computers.__

---

## 4) - `XOR` ('`^`')

A bitwise `XOR` is a binary operation that takes two bit patterns of equal length and performs the __logical exclusive `OR`__ operation on each pair of corresponding bits. The result in each position is `1` if only one of the bits is `1`, but will be `0` if both are `0` or both are `1`. In this we perform the comparison of two bits, being `1` if the two bits are different, and `0` if they are the same.

For example, let's take 4-bits numbers `1001` and `0101`.

```

1001 ^ 0101 = 1100

```

- if the result is stored in 4-bit unsigned-number: `12`
- if the result is stored in 4-bit signed-number: `-4`

---

If the result is stored in 8-bit signed-number?

```

1001 ^ 0101
= 00001001 & 00000101   /* Because they are 8-bit numbers */
= 00001101 => 12

```

__Note: This is why the size of number also matters in computers.__

---

## 5) - Shifts

Move to the [next chapter](./6_Shift_operations.md) for this.

---