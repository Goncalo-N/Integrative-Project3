package model;

        public class CabazProduct {
			@Override
			public String toString() {
				return "Produto:" + productIdentifier;
			}

			/**
 	 * Identificador do produto.
 	 */
        	private String productIdentifier;

        	/**
 	 * Construtor para inicicalizar uma instância do objeto CabazProduct com os atributos productIdentifier e amount.
 	 *
 	 * @param productIdentifier Quantidade do produto
 	 */
        	public CabazProduct(String productIdentifier) {
        		this.productIdentifier = productIdentifier;
        	}

        	/**
 	 * Método que devolve a identificação do produto.
 	 *
 	 * @return A identificação do produto.
 	 */
        	public String getProductIdentifier() {
        		return productIdentifier;
        	}

        	/**
 	 * Método para verificar se este objeto atual é igual a outro objeto do mesmo tipo.
 	 *
 	 * @param otherObj O objeto a ser comparado com este atual.
 	 * @return true se o outro objeto representa um productIdentifier igual a este, caso contrário
 	 * devolve false.
 	 */
            @Override
	public boolean equals(Object otherObj) {
        		if (otherObj == null) {
            			return false;
            		}

                		if (getClass() != otherObj.getClass()) {
            			return false;
            		}

                		CabazProduct otherProduct = (CabazProduct) otherObj;

                		return (productIdentifier.equals(otherProduct.productIdentifier));
        	}

        	/**
 	 * Calcula o hashcode para este objeto utilizando o atributo productIdentifier.
 	 *
 	 * @return O valor de hash calculado.
 	 */
        	@Override
	public int hashCode() {
        		return productIdentifier.hashCode();
        	}
}
