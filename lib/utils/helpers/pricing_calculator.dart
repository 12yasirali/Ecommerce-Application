class YPricingCalculator {
  static double calculateTotalPrice(double price, String location) {
    final taxRate = getTaxRateForLocation(location);
    final taxAmount = price * taxRate;
    final shippingCost = getShippingCost(location);
    double totalPrice = price + taxAmount + shippingCost;
    return totalPrice;
  }

  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    return 0.10;
  }

  static double getShippingCost(String location) {
    return 5.00;
  }

  // static double calculateCartTotle(CartModel cartModel) {
  //   return cart.items.map((item) => item.price).fold(0 , (previousPrice, currentPrice) => previousPrice + (currentPrice ?? 0));
  // }
}
