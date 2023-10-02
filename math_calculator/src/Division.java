public class Division implements CalculateOperation{
    @Override
    public double calculate(double value1, double value2) {
        if(value2 != 0) {
            return value1 / value2;
        } else {
            throw new ArithmeticException("No se puede dividir por cero");
        }
    }
}
