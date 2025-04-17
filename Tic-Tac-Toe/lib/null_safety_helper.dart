String? getNullableName(bool isAvailable) {
  if (isAvailable) {
    return "Player";
  }
  return null;
}

String getSafeValue(String? input) {
  return input ?? "Default";
}

class Example {
  late String requiredValue;
  String? optionalValue;

  void init() {
    requiredValue = "Hello";
  }

  void printAll() {
    print(optionalValue ?? "Nothing");
    print(requiredValue);
  }
}
