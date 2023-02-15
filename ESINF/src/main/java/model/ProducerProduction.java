package model;

import java.util.Map;

/**
 * guarda toda a producao para todos os dias do producer
 */
public class ProducerProduction
{
	String producer;
	Map<Integer, ProducerProductionDay> production;

	public String getProducer() {
		return producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	public Map<Integer, ProducerProductionDay> getProduction() {
		return production;
	}

	public void setProduction(Map<Integer, ProducerProductionDay> production) {
		this.production = production;
	}

	public double getAvailable(int day, String product) {
		return production.get(day).getAvailable(product);
	}

	public void addSupplied(int day, String product, double supplied) {
		production.get(day).addSupplied(product, supplied);
	}
}
