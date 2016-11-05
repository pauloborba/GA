import org.openqa.selenium.chrome.ChromeDriver
import org.openqa.selenium.firefox.FirefoxDriver

environments {
    chrome {
            def osPath = System.getProperty(os.name).toLowerCase().split( ).first()


            System.setProperty(webdriver.chrome.driver, webDriver.getAbsolutePath())
        }

        driver = { new ChromeDriver() }
    }

    firefox {
        driver = { new FirefoxDriver() }
    }
}
