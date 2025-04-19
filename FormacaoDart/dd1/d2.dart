void main() {
  List<double> temperaturasCelsius = [
    0.0,
    4.2,
    15.0,
    18.1,
    21.7,
    32.0,
    40.0,
    41.0,
  ];

  for (var celsius in temperaturasCelsius) {
    double fahrenheit = (celsius * 9 / 5) + 32;
    double kelvin = celsius + 273.15;

    print(
      'Celcius: ${celsius.toStringAsFixed(2)}, '
      'fahrenheit: ${fahrenheit.toStringAsFixed(2)}, '
      'kelvin: ${kelvin.toStringAsFixed(2)}',
    );
  }
}
