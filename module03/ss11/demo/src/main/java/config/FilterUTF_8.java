package config;

import javax.servlet.*;
import java.io.IOException;

@javax.servlet.annotation.WebFilter(filterName = "FilterUTF_8",value = "/*")
class FilterUTF8 implements Filter {
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        chain.doFilter(req, resp);
    }
}