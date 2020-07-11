package enchufateapp.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import enchufateapp.model.UserHobby;

public interface UserHobbyRepository extends CrudRepository<UserHobby, Integer>{

	List<UserHobby> findByCodigoUsuario(int codigoUsuario);

}
