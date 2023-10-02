public class Calculator {
    private static Calculator instance;
    private Calculator(){}

    public static synchronized Calculator getInstance() {
        if(instance == null) {
            instance = new Calculator();
        }
        return instance;
    }

    public double getResult(double value1, double value2, CalculateOperation calculateOperation) {
        return calculateOperation.calculate(value1, value2);
    }
}
