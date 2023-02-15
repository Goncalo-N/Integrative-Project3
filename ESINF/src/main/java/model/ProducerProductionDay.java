package model;

import java.util.Map;

/**
 * producao para um dado dia de todos os produtos
 */
public class ProducerProductionDay {
	int day;
	Map<String, ProductProduction> productsProdution;

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public Map<String, ProductProduction> getProductsProdution() {
		return productsProdution;
	}

	public void setProductsProdution(Map<String, ProductProduction> productsProdution) {
		this.productsProdution = productsProdution;
	}

	public double getAvailable(String product) {
		return productsProdution.get(product).getAvailable();
	}

	public void addSupplied(String product, double supplied) {
		productsProdution.get(product).addSupplied(supplied);
	}
}
