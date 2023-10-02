// Press Shift twice to open the Search Everywhere dialog and type `show whitespaces`,
// then press Enter. You can now see whitespace characters in your code.
public class Main {
    public static void main(String[] args) {
       Calculator calculator = Calculator.getInstance();

       double value1 = 23;
       double value2 = 0;

       CalculateOperation add = new Adition();
       CalculateOperation sub = new Substract();
       CalculateOperation multiply = new Multiply();
       CalculateOperation division = new Division();

        System.out.println("Suma: " + calculator.getResult(value1, value2, add));
        System.out.println("Resta: " + calculator.getResult(value1, value2, sub));
        System.out.println("Multiplicación: " + calculator.getResult(value1, value2, multiply));
        System.out.println("División: " + calculator.getResult(value1, value2, division));
    }
}