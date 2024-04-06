class EPricingCalculator {
  /// -- Calculate Priced based on tax and shipping cost
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);
    double totalPrice = taxAmount + shippingCost + productPrice;
    return totalPrice;
  }

  /// -- Calculate shipping cost
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  /// -- Calculate tax
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  /// -- get tax rate
  static double getTaxRateForLocation(String location) {
    // Lookup the tax rate for the given location from a tax rate database or api
    // Return the appropriate tax rate
    return 0.10;
  }

  /// -- get tax rate
  static double getShippingCost(String location) {
    // Lookup the shipping cost for the given location from a tax rate database or api
    // Return the appropriate shipping cost
    return 5.0;
  }

  /// -- Sum all cart values and return total amount
  // static double calculateCartTotal(CartModel cart) {
  //   return cart.items.map((e) => e.price).fold(0,
  //       (previousPrice, currentPrice) => previousPrice + (currentPrice ?? 0));
  // }
}
