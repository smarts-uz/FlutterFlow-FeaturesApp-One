import '/backend/schema/structs/index.dart';

double calculateTotalPrice(List<FruitStruct> cartFruits) {
  // calculate total prices
  double totalPrice = 0.0;
  for (FruitStruct fruit in cartFruits) {
    totalPrice += fruit.totalPrice;
  }
  return totalPrice;
}

int incrementValue(int value) {
  return value++;
}

int decrementValue(int value) {
  return value > 0 ? value-- : 0;
}

double calculateTotalForFruit(
  int kgs,
  double price,
) {
  return kgs * price;
}
