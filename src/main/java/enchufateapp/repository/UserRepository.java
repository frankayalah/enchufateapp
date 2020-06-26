package enchufateapp.repository;

import org.springframework.data.repository.CrudRepository;
import enchufateapp.model.User;

public interface UserRepository extends CrudRepository<User, Integer> {
    User findByEmail(String email);
}
