package utils.Exceptions;

public class HubNotFoundException extends RuntimeException {

    /**
     * Construtor para lançar uma mensagem por defeito.
     */
    public HubNotFoundException() {
        super("O ponto de rede não é válido!");
    }

    /**
     * Construtor para lançar a exceção com uma mesagem a indicar a linha do ficheiro onde erro foi encontrado.
     *
     * @param line A linha do ficheiro que contém erro.
     */
    public HubNotFoundException(int line) {
        super("O ponto de rede na linha " + line + " do ficheiro, não é valido!");
    }

    /**
     * Construtor para lançar a exceção com uma mensagem personalizada.
     *
     * @param message A mensagem personalizada.
     */
    public HubNotFoundException(String message) {
        super(message);
    }
}
