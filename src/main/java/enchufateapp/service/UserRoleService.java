package enchufateapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import enchufateapp.model.UserRole;
import enchufateapp.repository.UserRoleRepository;

@Service
public class UserRoleService {

	@Autowired
    private UserRoleRepository userRoleRepository;
	
	public void save(UserRole userRole) {
		userRoleRepository.save(userRole);
    }
}
