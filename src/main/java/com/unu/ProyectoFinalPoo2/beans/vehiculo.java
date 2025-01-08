package com.unu.ProyectoFinalPoo2.beans;

public class vehiculo {
	private int idvehiculo;
	private String tipo_vehiculo;
	private String placa;
	private String marca;
	private String modelo;
	private String color;
	private int idcliente;

	public int getIdvehiculo() {
		return idvehiculo;
	}

	public void setIdvehiculo(int idvehiculo) {
		this.idvehiculo = idvehiculo;
	}

	public String getTipo_vehiculo() {
		return tipo_vehiculo;
	}

	public void setTipo_vehiculo(String tipo_vehiculo) {
		this.tipo_vehiculo = tipo_vehiculo;
	}

	public String getPlaca() {
		return placa;
	}

	public void setPlaca(String placa) {
		this.placa = placa;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getIdcliente() {
		return idcliente;
	}

	public void setIdcliente(int idcliente) {
		this.idcliente = idcliente;
	}

	public vehiculo(int idvehiculo, String tipo_vehiculo, String placa, String marca, String modelo, String color,
			int idcliente) {
		super();
		this.idvehiculo = idvehiculo;
		this.tipo_vehiculo = tipo_vehiculo;
		this.placa = placa;
		this.marca = marca;
		this.modelo = modelo;
		this.color = color;
		this.idcliente = idcliente;
	}

	public vehiculo() {
		this(0, "", "", "", "", "", 0);
	}

}
