package com.unu.ProyectoFinalPoo2.beans;

public class cliente {

	private int idcliente;
	private String dni;
	private String nombres;
	private String apellidos;
	private String telefono;

	public int getIdcliente() {
		return idcliente;
	}

	public void setIdcliente(int idcliente) {
		this.idcliente = idcliente;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public cliente(int idcliente, String dni, String nombres, String apellidos, String telefono) {
		super();
		this.idcliente = idcliente;
		this.dni = dni;
		this.nombres = nombres;
		this.apellidos = apellidos;
		this.telefono = telefono;

	}

	public cliente() {
		this(0, "", "", "", "");

	}

}
