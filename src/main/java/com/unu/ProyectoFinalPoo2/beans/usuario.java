package com.unu.ProyectoFinalPoo2.beans;

public class usuario {
	private int idusuario;
	private String dni;
	private String nombres;
	private String apellidos;
	private String tipo;
	private String nomusuario;
	private String contrasenia;

	public usuario(int idusuario, String dni, String nombres, String apellidos, String tipo, String nomusuario,
			String contrasenia) {
		super();
		this.idusuario = idusuario;
		this.dni = dni;
		this.nombres = nombres;
		this.apellidos = apellidos;
		this.tipo = tipo;
		this.nomusuario = nomusuario;
		this.contrasenia = contrasenia;
	}

	public usuario() {
		this(0, "", "", "", "", "", "");
	}

	public int getIdusuario() {
		return idusuario;
	}

	public void setIdusuario(int idusuario) {
		this.idusuario = idusuario;
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

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getNomusuario() {
		return nomusuario;
	}

	public void setNomusuario(String nomusuario) {
		this.nomusuario = nomusuario;
	}

	public String getContrasenia() {
		return contrasenia;
	}

	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
	}

}
