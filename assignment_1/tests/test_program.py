import pytest

from assignment_1.program import multiply_321_by_recursion, multiply_321_by_bitshifting


@pytest.mark.parametrize('method', [multiply_321_by_recursion, multiply_321_by_bitshifting])
@pytest.mark.parametrize('factor', [0, 1, 5, -1, -10, 321, 100, -100])
def test_multiply_321_by_recursion(method, factor):
    assert method(factor) == 321 * factor
