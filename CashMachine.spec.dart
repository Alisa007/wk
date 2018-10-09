import "package:test/test.dart";
import 'CashMachine.dart';

void main() {
  CashMachine machine1 = new CashMachine([1, 3, 4]);
  CashMachine machine2 = new CashMachine([1, 5, 10, 50]);
  CashMachine machine3 = new CashMachine([10, 50, 100]);

  test("1 equalls 1", () {
    expect(machine1.exchange(1), equals([1]));
  });
  
  test("6 equalls 1, 1, 4", () {
    expect(machine1.exchange(6), equals([1, 1, 4]));
  });

  test("20 equalls 1, 1, 1, 1, 1, 5, 10", () {
    expect(machine2.exchange(20), [1, 1, 1, 1, 1, 5, 10]);
  });

  test("100 equalls 1, 1, 1, 1, 1, 5, 10, 10, 10, 10, 50", () {
    expect(machine2.exchange(100), [1, 1, 1, 1, 1, 5, 10, 10, 10, 10, 50]);
  });

  test("5 equalls null", () {
    expect(machine3.exchange(5), equals(null));
  });

  test("108 equalls null", () {
    expect(machine3.exchange(108), equals(null));
  });
}