def multiply_321_by_recursion(factor):
    if factor == 0:
        return 0

    if factor > 0:
        return multiply_321_by_recursion(factor - 1) + 321

    # Flip the sign of the factor and flip the sign of the end result
    if factor < 0:
        return -multiply_321_by_recursion(-factor)


def multiply_321_by_bitshifting(factor):
    return factor + (factor << 6) + (factor << 8)
