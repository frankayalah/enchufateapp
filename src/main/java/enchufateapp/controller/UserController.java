package enchufateapp.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import enchufateapp.model.Role;
import enchufateapp.model.User;
import enchufateapp.model.UserHobby;
import enchufateapp.model.UserRole;
import enchufateapp.service.UserHobbyService;
import enchufateapp.service.UserRoleService;
import enchufateapp.service.UserService;

@Controller
@RequestMapping(value = "/public/user")
public class UserController {

    private static final String DEFAULT_PAGE_DISPLAYED_TO_USER = "0";

    @Autowired
    private UserService userService;
    
    @Autowired
    private UserHobbyService userHobbyService;
    
    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private MessageSource messageSource;
    
    @RequestMapping(method = RequestMethod.POST, produces = "application/json")
    public String create(@ModelAttribute("user") User user,
                                    @RequestParam(required = false) String searchFor,
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
                                    Locale locale, HttpServletRequest request) {
    	
    	HttpSession session = request.getSession(false);
    	User userbd = userService.findByCorreo(user.getCorreo());
    	if (userbd == null) {
    		
    		if("".contentEquals(user.getFechaNacimiento())) {
    			user.setFechaNacimiento(null);
    		}
    		
    		user.setActivo(1); // ESTADO ACTIVO
        	userService.save(user);
        	userbd = userService.findByCorreo(user.getCorreo());
        	
        	String[] hobby = user.getHobby();
        	if (hobby != null) {
        		for (String intCodigoHobby : hobby) {
            		UserHobby userHobby = new UserHobby();
            		userHobby.setCodigoUsuario(userbd.getId());
            		userHobby.setCodigoHobby(new Integer(intCodigoHobby));
            		userHobbyService.save(userHobby);
    			}
        	}
        	
        	UserRole userRole = new UserRole();
        	userRole.setIntCodigoUsuario(userbd.getId());
        	userRole.setIntCodigoRol(Role.ROLE_USER.getId());
        	userRoleService.save(userRole);
        	
        	String messageKey = "message.create.success";
        	String response = messageSource.getMessage(messageKey, null, null, locale);
        	session.setAttribute("messageSuccess", response);
        	return "redirect:/login";
    	} else {
    		String messageKey = "message.create.duplicate";
    		String response = messageSource.getMessage(messageKey, null, null, locale);
    		session.setAttribute("messageError", response);
    		return "redirect:/signup";
    	}
    }
}