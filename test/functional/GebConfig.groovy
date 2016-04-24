import org.openqa.selenium.chrome.ChromeDriver
import org.openqa.selenium.firefox.FirefoxDriver
import org.openqa.selenium.firefox.FirefoxProfile


driver = {
    File file = new File("chromedrivers/chromedriverlinux64"); //configurar com o enderço correto do chromedriver.
    System.setProperty("webdriver.chrome.driver", file.getAbsolutePath());
    new ChromeDriver();
}

baseUrl = "http://localhost:8080/"

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
        driver = {FirefoxProfile profile = new FirefoxProfile()
            profile.setPreference("intl.accept_languages", "en-us")
            def driverInstance = new FirefoxDriver(profile)
            driverInstance.manage().window().maximize()
            driverInstance}
    }
}