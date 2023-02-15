package model;

import utils.Exceptions.InvalidProductQuantityException;
import utils.Exceptions.ProductNotFoundException;

import java.util.*;

/**
 * Classe que representa um cabaz.
 */
public class Cabaz {


	/**
	 * Mapa com os produtos que pertencem a este cabaz (chave) e respetiva quantidade desse mesmo produto (valor)
	 */
	private Map<CabazProduct, Double> productsAndAmount;

	/**
	 * Construtor para inicicalizar uma instância do objeto Basket.
	 */
	public Cabaz() {
		this.productsAndAmount = new HashMap<>();
	}

	/**
	 * Método para adicionar um novo produto ao cabaz. Se o produto não existir, ele é criado no cabaz, mas se já
	 * existir, a sua quantidade é aumentada.
	 *
	 * @param product O produto.
	 * @param amount  A quantidade do produto a adicionar.
	 */
	public void addProduct(CabazProduct product, Double amount) {
		productsAndAmount.merge(product, amount, Double::sum);
	}

	/**
	 * Método para devolver uma cópia do Set de todos os produtos existentes neste cabaz.
	 *
	 * @return A cópia do Set de todos os produtos deste cabaz.
	 */
	public Set<CabazProduct> getProductsSet() {
		if (productsAndAmount.isEmpty())
			return null;

		return new HashSet<>(productsAndAmount.keySet());
	}

	/**
	 * Método para devolver a quantidade de um dado produto deste cabaz.
	 *
	 * @param product O produto do qual queremos a quantidade.
	 * @return A quantidade do produto, ou null se o produto não existir.
	 */
	public double getProductQuantity(CabazProduct product) {
		double quantity = 0.0;
		Double quantityCheck = productsAndAmount.get(product);

		// Se o produto existir no cabaz, atribuir a sua quantidade existente.
		if (quantityCheck != null) {
			quantity = quantityCheck;
		}

		return quantity;
	}

	/**
	 * Método para subtrair a quantidade de um dado produto.
	 *
	 * @param product  O produto do qual queremos retirar quantidade.
	 * @param quantity A quantidade a retirar.
	 */
	public void subtractProductQuantity(CabazProduct product, double quantity) {
		if (productsAndAmount.get(product) == null)
			throw new ProductNotFoundException();

		if (productsAndAmount.get(product) < quantity)
			throw new InvalidProductQuantityException("Não pode retirar mais quantidade de produto do que aquela que " +
					"se encontram disponível.");

		productsAndAmount.merge(product, -quantity, Double::sum);
	}

	/**
	 * Método para verificar se um dado produto existe neste cabaz.
	 *
	 * @param product O produto a verificar se existe.
	 * @return true se o produto exitir neste cabaz, false se não existir.
	 */
	public boolean hasProduct(CabazProduct product) {
		return productsAndAmount.get(product) != null;
	}

	/**
	 * Método para verificar se este objeto atual é igual a outro objeto do mesmo tipo.
	 *
	 * @param otherObj O objeto a ser comparado com este atual.
	 * @return true se o outro objeto representa um Basket igual a este (com os mesmos produtos e quantidades respetivas),
	 * caso contrário devolve false.
	 */
	@Override
	public boolean equals(Object otherObj) {
		if (otherObj == null) {
			return false;
		}

		if (getClass() != otherObj.getClass()) {
			return false;
		}

		Cabaz otherCabaz = (Cabaz) otherObj;

		boolean cabazIsEquals = true;
		Iterator<CabazProduct> productIterator = productsAndAmount.keySet().iterator();

		while (productIterator.hasNext() && cabazIsEquals) {
			CabazProduct product = productIterator.next();

			if (otherCabaz.productsAndAmount.get(product) == null
					|| Double.compare(productsAndAmount.get(product), otherCabaz.productsAndAmount.get(product)) != 0) {
				cabazIsEquals = false;
			}
		}

		return cabazIsEquals;
	}
	@Override
	public String toString() {
		return "Cabaz:" + productsAndAmount.toString() +
				'\n';
	}
}
