package enchufateapp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tblusuario")
public class User {

	@Id
	@GeneratedValue
	@Column(name = "intCodigoUsuario")
	private int id;
	@Column(name = "vchNombre")
	private String nombre;
	@Column(name = "vchApellidos")
	private String apellidos;
	@Column(name = "vchCorreo")
	private String correo;
	@Column(name = "vchClave")
	private String clave;
	@Column(name = "dtmFechaNacimiento")
	private String fechaNacimiento;
	@Column(name = "blbImagen")
	private byte[] imagen;
	@Column(name = "vchGenero")
	private String genero;
	@Column(name = "vchSede")
	private String sede;
	@Column(name = "vchDescripcion")
	private String descripcion;
	@Column(name = "intActivo")
	private int activo;

	private String[] hobby;

	public User() {

	}

	public User(String nombre, String apellidos, String correo, String clave, String fechaNacimiento, byte[] imagen,
			String genero, String sede, String descripcion, int activo, int id) {
		super();

		this.nombre = nombre;
		this.apellidos = apellidos;
		this.correo = correo;
		this.clave = clave;
		this.fechaNacimiento = fechaNacimiento;
		this.imagen = imagen;
		this.genero = genero;
		this.sede = sede;
		this.descripcion = descripcion;
		this.activo = activo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
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

	public String getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(String fechaNacimiento) {
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

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getActivo() {
		return activo;
	}

	public void setActivo(int activo) {
		this.activo = activo;
	}

	@Override
	public boolean equals(Object object) {
		if (object instanceof User) {
			User user = (User) object;
			return user.id == id;
		}

		return false;
	}

	@Override
	public int hashCode() {
		return id;
	}

	public String[] getHobby() {
		return hobby;
	}

	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}
	
	public String getNombreCompleto() {
		return (this.nombre+" "+this.apellidos).trim();
	}

}