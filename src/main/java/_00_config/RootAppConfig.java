package _00_config;

import java.beans.PropertyVetoException;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableTransactionManagement
@PropertySource("classpath:db.properties")
public class RootAppConfig {
	
//	@Autowired
//	private Environment environment;
	
	@Value("${jdbc.maxPoolSize}")
	Integer maxPoolsize;
	
	@Value("${jdbc.initPoolSize}")
	Integer initPoolsize;

	@Value("${jdbc.driverClass}")
	String driverClass;

	@Value("${jdbc.user}")
	String user;
	
	@Value("${jdbc.jdbcUrl}")
	String jdncUrl;
	
	@Value("${jdbc.password}")
	
	String pswd;
	
	@Bean
	public DataSource dataSource() {
		ComboPooledDataSource ds = new ComboPooledDataSource();
		ds.setUser(user);
		ds.setPassword(pswd);
		try {
			ds.setDriverClass(driverClass);
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}
		ds.setJdbcUrl(jdncUrl);
		ds.setInitialPoolSize(initPoolsize);
		ds.setMaxPoolSize(maxPoolsize);
		return ds;
	}
	@Bean
	public LocalSessionFactoryBean sessionFactory() {
		LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
		// 第一次建立本檔案時就要列入所有含永續類別的套件
		factory.setPackagesToScan(new String[] {
				"_00_init", "_01_register.model", "_03_listProducts.model", "_04_ShoppingCart",
				"_04_ShoppingCart.model","partner_h","_04_forum.model","newlywed.model","support",
				"_06_Program.model","favorites"
		});
		factory.setDataSource(dataSource());
		factory.setHibernateProperties(additionalPropertiesMySQL());	
		return factory;
	}
	@Bean(name="transactionManager")
    @Autowired
    public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
         HibernateTransactionManager txManager = new HibernateTransactionManager();
         txManager.setSessionFactory(sessionFactory);
         return txManager;
      }	
	
	private Properties additionalPropertiesMySQL() {
		Properties properties=new Properties(); 
		properties.put("hibernate.dialect", org.hibernate.dialect.MySQL8Dialect.class);
		properties.put("hibernate.show_sql", Boolean.TRUE);
		properties.put("hibernate.format_sql", Boolean.TRUE);
		properties.put("default_batch_fetch_size", 10);
		properties.put("hibernate.hbm2ddl.auto", "update");
		return properties;
	}
//	private Properties additionalPropertiesMsSQL() {
//		Properties properties=new Properties();
//		properties.put("hibernate.dialect", org.hibernate.dialect.SQLServer2012Dialect.class);
//		properties.put("hibernate.show_sql", Boolean.FALSE);
//		properties.put("hibernate.format_sql", Boolean.TRUE);
//		properties.put("default_batch_fetch_size", 10);
//		properties.put("hibernate.hbm2ddl.auto", "update");
//		return properties;
//	}
	
}