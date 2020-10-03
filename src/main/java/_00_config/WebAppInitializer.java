package _00_config;

import javax.servlet.Filter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.HiddenHttpMethodFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
	// getRootConfigClasses()會傳回提供組態資訊(Java based configuration)的Java類別，
	// 本例為RootAppConfig類別，它說明應用系統中，提供Service/Dao功能之Bean的組態資訊，例如提供
	// DataSource類別、交易管理器(Transaction managers)、Hibernate的SessionFactory類別等。

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] {RootAppConfig.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {WebAppConfig.class};
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] {"/"};
	}
	
	@Override
	protected Filter[] getServletFilters() {
		HiddenHttpMethodFilter hhmf = new HiddenHttpMethodFilter();
		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		characterEncodingFilter.setForceEncoding(true);
		
//		MultipartFilter multipartFilter = new MultipartFilter();
//		HiddenHttpMethodFilter hiddenFilter = new HiddenHttpMethodFilter();
		// application.properties:
		// spring.mvc.hiddenmethod.filter.enabled=true
		// , multipartFilter, hiddenFilter
		return new Filter[] {characterEncodingFilter,hhmf};
	}

	@Override
	public void onStartup(ServletContext context) throws ServletException {
		super.onStartup(context);
		context.addListener(_00_init.listener.InitialListener.class);
	}
	
	
}