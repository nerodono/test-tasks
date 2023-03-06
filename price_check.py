from unittest import TestCase, main


def check_length_eqs(prods, prices_):
    if len(prods) != len(prices_):
        raise ValueError("len(products) != len(prices)")


def all_to_float(in_: list[str]) -> list[float]:
    return [float(x) for x in in_]


def get_errors_of(products: list[str], prices: list[float],
                  sold: list[str], sold_prices: list[float]) -> int:
    check_length_eqs(products, prices)
    check_length_eqs(sold, sold_prices)

    errors = 0
    product_map = {prod: price for (prod, price) in zip(products, prices)}

    for product_sold, sold_price in zip(sold, sold_prices):
        expected_price = product_map[product_sold]
        if expected_price != sold_price:
            errors += 1

    return errors

# test


class ErrorsTest(TestCase):
    def test_expected(self):
        self.assertEqual(
            get_errors_of(
                ["eggs", "milk", "cheese"],
                [2.89, 3.29, 5.79],
                ["eggs", "eggs", "cheese", "milk"],
                [2.89, 2.99, 5.97, 3.29],
            ),
            2
        )


main()
