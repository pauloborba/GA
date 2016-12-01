import org.openqa.selenium.chrome.ChromeDriver
import org.openqa.selenium.firefox.FirefoxDriver
import org.openqa.selenium.firefox.FirefoxProfile

driver = {
 File file = new File("chromedrivers/chromedriverlinux64"); //configurar com o enderço correto do chromedriver.
    System.setProperty("webdriver.chrome.driver", file.getAbsolutePath());
    new ChromeDriver();
} 

environments {
   // run as “grails -Dgeb.env=chrome test-app”
   // See: http://code.google.com/p/selenium/wiki/ChromeDriver
   chrome {
      driver = { File file = new File("chromedrivers/chromedriverlinux64"); //configurar com o enderço correto do chromedriver.
            System.setProperty("webdriver.chrome.driver", file.getAbsolutePath());
            new ChromeDriver(); }
   }

   // run as “grails -Dgeb.env=firefox test-app”
   // See: http://code.google.com/p/selenium/wiki/FirefoxDriver
   firefox {
    driver = { new FirefoxDriver() }
  }
}
