package org.tydoo.efarm.model;

public enum Category {
	
	GRAIN("Grain"), FRUIT("Fruit"), TUBER("Tuber"), VEGETABLE("Vegetable");
	
	private Category(String value) {
		this.value = value;
	}
	
	private String value;
	
	public String getValue() {
		return value;
	}
}
