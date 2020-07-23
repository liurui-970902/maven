import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.liurui.Service.userService;

class maventest {
   
	ApplicationContext context = null;
	@BeforeEach
	void setUp() throws Exception {
		context = new ClassPathXmlApplicationContext("applicationContext.xml");
	}

	@Test
	void test() {
		/*
		 * Userapi uapi =new Userapi((userService)context.getBean("userService"));
		 * uapi.index(null, null); uapi.add("≤‚ ‘","10","ƒ–","1"); uapi.drop("1");
		 * uapi.baocun("3","≤‚ ‘–°Ω¥”Õ","20","≈Æ","2");
		 */
	}

}
