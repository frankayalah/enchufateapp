package enchufateapp.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import enchufateapp.model.User;
import enchufateapp.model.UserHobby;
import enchufateapp.service.UserHobbyService;
import enchufateapp.service.UserService;

@Controller
@RequestMapping(value = "/protected/profile")
public class ProfileController {

    @Autowired
    private UserService userService;
    
    @Autowired
    private UserHobbyService userHobbyService;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView welcome() {
        return new ModelAndView("profile");
    }
    
    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<?> getUser(@RequestParam int page, Locale locale, HttpServletRequest request) {
    	
    	HttpSession session = request.getSession();
		String correo = ((User) session.getAttribute("usersession")).getCorreo();
		User user = userService.findByCorreo(correo);
		
		String fechaNac = user.getFechaNacimiento();
		if (fechaNac != null) {
			try {
				Date date = new SimpleDateFormat("yyyy-MM-dd").parse(fechaNac);
				user.setFechaNacimiento(new SimpleDateFormat("dd/MM/yyyy").format(date));  
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		List<UserHobby> list = userHobbyService.findByCodigoUsuario(user.getId());
		
    	if (list != null) {
    		int contador = 0;
    		String[] hobby = new String[list.size()];
    		for (UserHobby userHobby : list) {
    			hobby[contador] = String.valueOf(userHobby.getCodigoHobby());
    			contador++;
			}
    		user.setHobby(hobby);
    	}
    	
    	return new ResponseEntity<User>(user, HttpStatus.OK);
    }

//    @RequestMapping(method = RequestMethod.POST, produces = "application/json")
//    public ResponseEntity<?> create(@ModelAttribute("contact") Contact contact,
//                                    @RequestParam(required = false) String searchFor,
//                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
//                                    Locale locale) {
//        contactService.save(contact);
//
//        if (isSearchActivated(searchFor)) {
//            return search(searchFor, page, locale, "message.create.success");
//        }
//
//        return createListAllResponse(page, locale, "message.create.success");
//    }
//
//    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, produces = "application/json")
//    public ResponseEntity<?> update(@PathVariable("id") int contactId,
//                                    @RequestBody Contact contact,
//                                    @RequestParam(required = false) String searchFor,
//                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
//                                    Locale locale) {
//        if (contactId != contact.getId()) {
//            return new ResponseEntity<String>("Bad Request", HttpStatus.BAD_REQUEST);
//        }
//
//        contactService.save(contact);
//
//        if (isSearchActivated(searchFor)) {
//            return search(searchFor, page, locale, "message.update.success");
//        }
//
//        return createListAllResponse(page, locale, "message.update.success");
//    }

}