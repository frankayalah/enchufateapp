package enchufateapp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tblusuariorol")
public class UserRole {

	@Id
	@GeneratedValue
	@Column(name = "intCodigoUsuarioRol")
	private int id;
	@Column(name = "intCodigoUsuario")
	private int intCodigoUsuario;
	@Column(name = "intCodigoRol")
	private int intCodigoRol;

	public UserRole() {

	}

	public UserRole(int intCodigoUsuario, int intCodigoRol, int id) {
		super();

		this.intCodigoUsuario = intCodigoUsuario;
		this.intCodigoRol = intCodigoRol;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIntCodigoUsuario() {
		return intCodigoUsuario;
	}

	public void setIntCodigoUsuario(int intCodigoUsuario) {
		this.intCodigoUsuario = intCodigoUsuario;
	}

	public int getIntCodigoRol() {
		return intCodigoRol;
	}

	public void setIntCodigoRol(int intCodigoRol) {
		this.intCodigoRol = intCodigoRol;
	}

	@Override
	public boolean equals(Object object) {
		if (object instanceof UserRole) {
			UserRole user = (UserRole) object;
			return user.id == id;
		}

		return false;
	}

	@Override
	public int hashCode() {
		return id;
	}
}
