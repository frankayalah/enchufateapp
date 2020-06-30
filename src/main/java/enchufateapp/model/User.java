package enchufateapp.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tblusuario")
public class User {

	@Id
	@GeneratedValue
	@Column(name = "intCodigoUsuario")
	private int codigoUsuario;
	@Column(name = "vchNombre")
	private String nombre;
	@Column(name = "vchApellidoPaterno")
	private String apellidoPaterno;
	@Column(name = "vchApellidoMaterno")
	private String apellidoMaterno;
	@Column(name = "vchCorreo")
	private String correo;
	@Column(name = "vchClave")
	private String clave;
	@Column(name = "dtmFechaNacimiento")
	private Date fechaNacimiento;
	@Column(name = "blbImagen")
	private byte[] imagen;
	@Column(name = "vchGenero")
	private String genero;
	@Column(name = "vchSede")
	private String sede;
	@Column(name = "intActivo")
	private int activo;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "vchRol")
	private Role role;

	public int getCodigoUsuario() {
		return codigoUsuario;
	}

	public void setCodigoUsuario(int codigoUsuario) {
		this.codigoUsuario = codigoUsuario;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidoPaterno() {
		return apellidoPaterno;
	}

	public void setApellidoPaterno(String apellidoPaterno) {
		this.apellidoPaterno = apellidoPaterno;
	}

	public String getApellidoMaterno() {
		return apellidoMaterno;
	}

	public void setApellidoMaterno(String apellidoMaterno) {
		this.apellidoMaterno = apellidoMaterno;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public byte[] getImagen() {
		return imagen;
	}

	public void setImagen(byte[] imagen) {
		this.imagen = imagen;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getSede() {
		return sede;
	}

	public void setSede(String sede) {
		this.sede = sede;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

}