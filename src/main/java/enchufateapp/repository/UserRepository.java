package enchufateapp.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import enchufateapp.model.User;

public interface UserRepository extends PagingAndSortingRepository<User, Integer> {

	User findByCorreo(String correo);

	Page<User> findByNombreLike(Pageable pageable, String Nombre);

}
