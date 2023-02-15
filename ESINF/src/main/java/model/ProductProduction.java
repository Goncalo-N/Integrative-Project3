package model;

/**
 * guarda a producao de um produto
 */
public class ProductProduction
{
	String product;
	double qtdProduced;
	double qtdSupplied = 0;

	public ProductProduction(String product, double qtdProduced) {
		this.product = product;
		this.qtdProduced = qtdProduced;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public double getQtdProduced() {
		return qtdProduced;
	}

	public void setQtdProduced(double qtdProduced) {
		this.qtdProduced = qtdProduced;
	}

	public double getQtdSupplied() {
		return qtdSupplied;
	}

	public void setQtdSupplied(double qtdSupplied) {
		this.qtdSupplied = qtdSupplied;
	}

	public void addSupplied(double supplied) {
		this.qtdSupplied += supplied;
	}

	public double getAvailable() {
		return qtdProduced-qtdSupplied;
	}
}
