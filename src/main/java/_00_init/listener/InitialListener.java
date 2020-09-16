package _00_init.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import _00_init.util.GlobalService;
// 本Listener由IoC容器控管，所以並未使用@WebListener註釋
public class InitialListener implements ServletContextListener {   
    public void contextInitialized(ServletContextEvent event)  {
        ServletContext context  = event.getServletContext();
        context.setAttribute("SYSTEM",new GlobalService());
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce)  {
    }
}