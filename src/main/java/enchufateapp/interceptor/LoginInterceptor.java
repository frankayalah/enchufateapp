package enchufateapp.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import enchufateapp.model.User;
import enchufateapp.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        
    	HttpSession session = request.getSession();
        User user = (User) session.getAttribute("usersession");
        if(user == null){
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            String email = auth.getName();
            user = userService.findByCorreo(email);
            session.setAttribute("usersession", user);
        }

        return super.preHandle(request, response, handler);
    }
}
