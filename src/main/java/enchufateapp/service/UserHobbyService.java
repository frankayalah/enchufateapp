package enchufateapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import enchufateapp.model.UserHobby;
import enchufateapp.repository.UserHobbyRepository;

@Service
public class UserHobbyService {

	@Autowired
    private UserHobbyRepository userHobbyRepository;
	
	public void save(UserHobby userHobby) {
		userHobbyRepository.save(userHobby);
    }

	public List<UserHobby> findByCodigoUsuario(int codigoUsuario) {
		return userHobbyRepository.findByCodigoUsuario(codigoUsuario);
	}
}
