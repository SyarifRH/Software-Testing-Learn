import pytest
from selenium import webdriver
from selenium.webdriver.common.by import By
from webdriver_manager.firefox import GeckoDriverManager  # Mengganti ChromeDriverManager dengan GeckoDriverManager
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.keys import Keys
import time
from data import addData
from selenium.webdriver.firefox.service import Service  # Mengganti Chrome service dengan Firefox service
from allure import attach

@pytest.fixture(scope='module')
def browser():
    firefox_service = Service(GeckoDriverManager().install())  # Mengganti ChromeDriverManager dengan GeckoDriverManager
    driver = webdriver.Firefox(service=firefox_service)  # Mengganti Chrome dengan Firefox
    driver.maximize_window()
    yield driver
    driver.quit()

def test_BR_001(browser):
    driver = browser
    driver.get("https://www.saucedemo.com/")
    input_email = driver.find_element(By.XPATH, ("//input[@id='user-name']"))
    input_email.send_keys(addData.username)
    time.sleep(2)

    input_password = driver.find_element(By.XPATH, ("//input[@id='password']"))
    input_password.send_keys(addData.password)
    time.sleep(2)

    input_enter = driver.find_element(By.XPATH, ("//input[@id='login-button']"))
    input_enter.click()
    time.sleep(5)
    try:
        response_data = WebDriverWait(driver, 10).until(EC.visibility_of_element_located((By.XPATH, "//body/div[@id='root']/div[@id='page_wrapper']/div[@id='contents_wrapper']/div[@id='header_container']/div[2]/span[text()='Products']")))
        assert response_data.text == "Products"
    except:
        pytest.fail("Pengujian Failed")

def test_BR_002(browser):
    driver = browser
    driver.get("https://www.saucedemo.com/")
    input_email = driver.find_element(By.XPATH, ("//input[@id='user-name']"))
    input_email.send_keys(addData.wrongUsername)
    time.sleep(2)

    input_password = driver.find_element(By.XPATH, ("//input[@id='password']"))
    input_password.send_keys(addData.wrongPassword)
    time.sleep(2)

    input_enter = driver.find_element(By.XPATH, ("//input[@id='login-button']"))
    input_enter.click()
    time.sleep(5)
    try:
        response_data = WebDriverWait(driver, 10).until(EC.visibility_of_element_located((By.XPATH, "//body/div[@id='root']/div[1]/div[2]/div[1]/div[1]/div[1]/form[1]/div[3]/h3[1]")))
        assert response_data.text == "Epic sadface: Username and password do not match any user in this service"
    except:
        pytest.fail("Pengujian Failed")


def test_BR_003(browser):
    driver = browser
    driver.get("https://www.saucedemo.com/")
    input_email = driver.find_element(By.XPATH, ("//input[@id='user-name']"))
    input_email.send_keys()
    time.sleep(2)

    input_password = driver.find_element(By.XPATH, ("//input[@id='password']"))
    input_password.send_keys()
    time.sleep(2)

    input_enter = driver.find_element(By.XPATH, ("//input[@id='login-button']"))
    input_enter.click()
    time.sleep(5)
    try:
        response_data = WebDriverWait(driver, 10).until(EC.visibility_of_element_located((By.XPATH, "//body/div[@id='root']/div[1]/div[2]/div[1]/div[1]/div[1]/form[1]/div[3]/h3[1]")))
        assert response_data.text == "Epic sadface: Username is required"
    except:
        pytest.fail("Pengujian Failed")       


def test_BR_004(browser):
    driver = browser
    driver.get("https://www.saucedemo.com/")
    input_email = driver.find_element(By.XPATH, ("//input[@id='user-name']"))
    input_email.send_keys(addData.uppUsername)
    time.sleep(2)

    input_password = driver.find_element(By.XPATH, ("//input[@id='password']"))
    input_password.send_keys(addData.uppPassword)
    time.sleep(2)

    input_enter = driver.find_element(By.XPATH, ("//input[@id='login-button']"))
    input_enter.click()
    time.sleep(5)
    try:
        response_data = WebDriverWait(driver, 10).until(EC.visibility_of_element_located((By.XPATH, "//body/div[@id='root']/div[1]/div[2]/div[1]/div[1]/div[1]/form[1]/div[3]/h3[1]")))
        assert response_data.text == "Epic sadface: Username and password do not match any user in this service"
    except:
        pytest.fail("Pengujian Failed")          


def test_BR_005(browser):
    driver = browser
    driver.get("https://www.saucedemo.com/")
    input_email = driver.find_element(By.XPATH, ("//input[@id='user-name']"))
    input_email.send_keys(addData.username)
    time.sleep(2)

    input_password = driver.find_element(By.XPATH, ("//input[@id='password']"))
    input_password.send_keys(addData.password)
    time.sleep(2)

    input_enter = driver.find_element(By.XPATH, ("//input[@id='login-button']"))
    input_enter.click()
    time.sleep(5)

    addTochart1 = driver.find_element(By.XPATH, "//button[@id='add-to-cart-sauce-labs-backpack']")
    addTochart1.click()

    addTochart2 = driver.find_element(By.XPATH, "//button[@id='add-to-cart-sauce-labs-bike-light']")
    addTochart2.click()

    driver.find_element(By.XPATH, "//body/div[@id='root']/div[@id='page_wrapper']/div[@id='contents_wrapper']/div[@id='header_container']/div[1]/div[3]/a[1]").click()
    time.sleep(2)
    driver.find_element(By.XPATH, "//button[@id='checkout']").click()

    fristName = driver.find_element(By.XPATH, "//input[@id='first-name']")
    fristName.send_keys("Syarif")
    lastName = driver.find_element(By.XPATH, "//input[@id='last-name']")
    lastName.send_keys("Ridhohidayatulloh")
    postalCode = driver.find_element(By.XPATH, "//input[@id='postal-code']")
    postalCode.send_keys(53151)

    submit = driver.find_element(By.XPATH, "//input[@id='continue']")
    submit.click()

    submitFinish = driver.find_element(By.XPATH, "//button[@id='finish']")
    submitFinish.click()

    try:
        response_data = WebDriverWait(driver, 10).until(EC.visibility_of_element_located((By.XPATH, "//body/div[@id='root']/div[@id='page_wrapper']/div[@id='contents_wrapper']/div[@id='checkout_complete_container']/h2[1]")))
        assert response_data.text == "Thank you for your order!"
    except:
        pytest.fail("Pengujian Failed")     