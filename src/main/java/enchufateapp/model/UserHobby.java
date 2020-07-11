package enchufateapp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tblusuariohobby")
public class UserHobby {

	@Id
	@GeneratedValue
	@Column(name = "intCodigoUsuarioHobby")
	private int id;
	@Column(name = "intCodigoUsuario")
	private int codigoUsuario;
	@Column(name = "intCodigoHobby")
	private int codigoHobby;

	public UserHobby() {

	}

	public UserHobby(int codigoUsuario, int codigoHobby, int id) {
		super();

		this.codigoUsuario = codigoUsuario;
		this.codigoHobby = codigoHobby;
	}

	@Override
	public boolean equals(Object object) {
		if (object instanceof UserHobby) {
			UserHobby user = (UserHobby) object;
			return user.id == id;
		}

		return false;
	}

	@Override
	public int hashCode() {
		return id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCodigoUsuario() {
		return codigoUsuario;
	}

	public void setCodigoUsuario(int codigoUsuario) {
		this.codigoUsuario = codigoUsuario;
	}

	public int getCodigoHobby() {
		return codigoHobby;
	}

	public void setCodigoHobby(int codigoHobby) {
		this.codigoHobby = codigoHobby;
	}

}
