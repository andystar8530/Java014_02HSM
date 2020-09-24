package _00_config;

import javax.annotation.PostConstruct;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.orm.hibernate5.support.OpenSessionInViewInterceptor;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import _00_init.interceptor.DisableCacheInterceptor;
//import _02_login.interceptor.CheckLoginInterceptor;
@Configuration
@EnableWebMvc
@EnableTransactionManagement  // 本註釋必須與@Configuration出現在同一個類別
<<<<<<< HEAD
@ComponentScan({"_00_init", "_03_listProducts","_04_forum","ch01_h_register","partner_h"})
=======
@ComponentScan({"_00_init", "_02_login","_03_listProducts","_01_register","partner_h"})
>>>>>>> dc14db13d9b5d493cb7f1e4f846abadfa9875ef2
public class WebAppConfig implements WebMvcConfigurer {
	@Autowired
	private RequestMappingHandlerAdapter requestMappingHandlerAdapter;
	
	// 取消"redirect+冒號..."時會掛上QueryString
	@PostConstruct
	public void init() {
		requestMappingHandlerAdapter.setIgnoreDefaultModelOnRedirect(true);
	}
	
	
	@Bean
	public InternalResourceViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver  resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	} 
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("UTF-8");
		resolver.setMaxUploadSize(81920000);
		return resolver;
	}
//	@Override
//	// 為了處理靜態檔案必須加入下列敘述：只要是 /css/開頭的任何請求，都轉到/WEB-INF/views/css/去尋找
//	// 為了處理靜態檔案必須加入下列敘述：只要是 /image/開頭的任何請求，都轉到/WEB-INF/views/images/去尋找
//	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//		registry.addResourceHandler("/css/**")
//				.addResourceLocations("/WEB-INF/views/css/");
//		registry.addResourceHandler("/image/**")
//				.addResourceLocations("/WEB-INF/views/images/");
//	}
	
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
//	@Override
//    public void addInterceptors(InterceptorRegistry registry) {
//		registry.addInterceptor(new CheckLoginInterceptor());
//		DisableCacheInterceptor  disableCacheInterceptor = new DisableCacheInterceptor();
//        registry.addInterceptor(disableCacheInterceptor);
//        
//        OpenSessionInViewInterceptor openSessionInViewInterceptor = new OpenSessionInViewInterceptor();
//	    openSessionInViewInterceptor.setSessionFactory(factory);
//	    registry.addWebRequestInterceptor(openSessionInViewInterceptor).addPathPatterns("/_05_orderProcess/orderDetail");
//	    
//        
//    }
	
	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
		messageSource.setBasenames("ValidationMessages");
		return messageSource;
	}

	
}