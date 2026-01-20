# LT-Configuration-RF

A comprehensive mobile automation testing project using **Robot Framework** with **Appium** for cross-platform mobile testing, integrated with **LambdaTest** cloud testing platform for scalable and reliable test execution.

## Project Overview

LT-Configuration-RF is a robust mobile test automation framework designed to streamline mobile application testing across Android and iOS platforms. By leveraging Robot Framework's simplicity and LambdaTest's cloud infrastructure, this project enables teams to execute tests on real devices, perform parallel testing, and generate detailed reports with minimal setup overhead.

The framework follows industry best practices with centralized configuration management, reusable keywords, and comprehensive reporting capabilities. Whether you're testing native, hybrid, or mobile web applications, this framework provides the flexibility and scalability needed for modern mobile QA workflows.

## Key Features

### Cloud-Based Mobile Testing
Execute tests on LambdaTest's extensive cloud network of real mobile devices. The integration supports both Android and iOS platforms with automatic device configuration and real-time test status updates.

### Parallel Test Execution
Achieve faster test cycles with Pabot integration, enabling parallel execution of multiple test cases across different devices simultaneously. This significantly reduces overall test execution time and provides quicker feedback to development teams.

### Comprehensive Reporting
Generate detailed test reports including HTML reports, logs, screenshots, and video recordings. LambdaTest integration provides additional insights with device logs, network logs, and visual comparisons for failed tests.

### Environment Configuration
Centralized configuration management using environment variables and .env files. Easily switch between different test environments, devices, and application builds without modifying test code.

### Visual Testing
Built-in visual testing capabilities with automatic screenshot capture and comparison tools. Visual=true option enables visual regression testing and helps identify UI discrepancies across different devices and OS versions.

### Cross-Platform Support
Unified test scripts that work across Android and iOS platforms. The framework abstracts platform-specific differences, allowing testers to write once and run everywhere.

## Project Structure

```
LT-Configuration-RF/
├── .DS_Store                    # macOS system file
├── README.md                    # This file
├── requirements.txt             # Python dependencies
├── log.html                     # Test execution log
├── output.xml                   # Machine-readable test results
├── report.html                  # HTML test report
├── dock/                        # Screenshots directory
│   ├── Screenshot 2024-02-04 at 10.29.18.png
│   ├── Screenshot 2024-02-04 at 20.23.47.png
│   └── Screenshot 2024-02-04 at 20.24.38.png
├── lambdatest/                  # LambdaTest integration
│   └── LambdaTestStatus.py      # Custom LambdaTest status reporter
├── resources/                   # Configuration and resources
│   ├── config.robot            # Test configuration and keywords
│   └── Env.py                  # Environment variable loader
└── tests/                       # Test cases
    └── test.robot              # Sample test suite
```

### Directory Descriptions

#### dock/
Contains screenshots captured during test execution. These screenshots are automatically saved and can be used for visual regression testing or debugging test failures.

#### lambdatest/
Houses LambdaTest-specific integrations and utilities. The LambdaTestStatus.py module provides custom functions to update test status on LambdaTest platform, mark tests as passed/failed, and update test names dynamically.

#### resources/
Centralized configuration and resource files:
- **config.robot**: Main configuration file containing device settings, capabilities, and reusable keywords
- **Env.py**: Python utility class for loading environment variables from .env files

#### tests/
Contains all test case files following Robot Framework syntax. The test.robot file demonstrates the project structure with test cases using the custom Appium keywords.

## Prerequisites

### System Requirements
- **Operating System**: macOS, Linux, or Windows
- **Python**: 3.7 or higher (3.9+ recommended)
- **Memory**: Minimum 4GB RAM (8GB+ recommended for running Appium locally)
- **Disk Space**: At least 2GB for dependencies and test artifacts

### Required Software
- **Python 3.7+**: [Download from python.org](https://www.python.org/downloads/)
- **Robot Framework**: 6.0 or higher
- **Appium**: 2.0 or higher (for local development)
- **Node.js**: 14+ (required for Appium)
- **Git**: For version control

### LambdaTest Account
To use the LambdaTest integration, you'll need:
1. A LambdaTest account (free tier available)
2. Your **Username** and **Access Key** from the LambdaTest dashboard
3. Optionally, an app (.apk or .ipa file) uploaded to LambdaTest storage

## Installation

### Step 1: Clone the Repository
```bash
# Navigate to your project directory
cd /Users/robbydarmawan/Documents/Automation/Robby

# Clone or navigate to the project
cd LT-Configuration-RF
```

### Step 2: Create Virtual Environment (Recommended)
```bash
# Create a virtual environment
python3 -m venv venv

# Activate the virtual environment
# On macOS/Linux:
source venv/bin/activate

# On Windows:
# venv\Scripts\activate
```

### Step 3: Install Dependencies
```bash
# Install all required packages from requirements.txt
pip install -r requirements.txt

# The following packages will be installed:
# - robotframework==6.0.2
# - robotframework-appiumlibrary==2.0.0
# - robotframework-pabot==2.7.0
# - Appium-Python-Client==2.11.0
# - python-dotenv==0.21.0
# - selenium==4.10.0
# - And other dependencies...
```

### Step 4: Configure Environment Variables
Create a `.env` file in the project root with your LambdaTest credentials:

```bash
# LambdaTest Credentials
LT_USERNAME=your_lambdatest_username
LT_ACCESS_KEY=your_lambdatest_access_key

# Device Configuration
LAMDA_DEVICE_NAME=Pixel 7
LAMDA_PLATFORM_NAME=Android
LAMDA_PLATFORM_VERSION=13.0

# Application Configuration
LAMDA_APP_URL=your_app_upload_url_or_local_path

# Build and Project Settings
LAMDA_BUILD_NAME=MyApp_Build_v1.0
LAMDA_PROJECT=MyProject

# Testing Options
LAMDA_ISREAL_MOBILE=true
LAMDA_WC3=true
LAMDA_DEVICE_LOG=true
LAMDA_NETWORK_LOG=true
```

### Step 5: Verify Installation
```bash
# Check installed packages
pip list | grep -i robot

# Verify Robot Framework installation
robot --version

# Verify Appium installation
appium --version
```

## Configuration

### Environment Variables

The framework uses environment variables for all configurations. Create a `.env` file in the project root:

| Variable | Description | Required | Default |
|----------|-------------|----------|---------|
| `LT_USERNAME` | LambdaTest username | Yes | - |
| `LT_ACCESS_KEY` | LambdaTest access key | Yes | - |
| `LAMDA_DEVICE_NAME` | Target device name | Yes | - |
| `LAMDA_PLATFORM_NAME` | Platform (Android/iOS) | Yes | - |
| `LAMDA_PLATFORM_VERSION` | OS version | Yes | - |
| `LAMDA_APP_URL` | App file URL or path | No | - |
| `LAMDA_BUILD_NAME` | Build name for LambdaTest | No | - |
| `LAMDA_PROJECT` | Project name | No | - |
| `LAMDA_ISREAL_MOBILE` | Use real device | No | true |
| `LAMDA_W3C` | W3C protocol | No | true |
| `LAMDA_DEVICE_LOG` | Capture device logs | No | true |
| `LAMDA_NETWORK_LOG` | Capture network logs | No | true |

### LambdaTest Capabilities

The framework automatically constructs LambdaTest capabilities based on environment variables. Key capabilities include:

- **platformName**: Target operating system (Android/iOS)
- **deviceName**: Specific device model for testing
- **platformVersion**: Operating system version
- **app**: Application under test (.apk or .ipa)
- **build**: Build identifier for LambdaTest dashboard
- **project**: Project grouping
- **isRealMobile**: Use real devices vs emulators
- **visual**: Enable visual screenshots
- **network**: Capture network logs
- **devicelog**: Capture device logs

### Custom Capabilities

To add custom capabilities, modify the `Open app` keyword in `resources/config.robot`:

```robot
&{LT_Options}    Create Dictionary
...    isRealMobile=${LAMDA_ISREAL_MOBILE}
...    platformVersion=${LAMDA_PLATFORM_VERSION}
...    deviceName=${LAMDA_DEVICE_NAME}
...    app=${LAMDA_APP_URL}
...    w3c=${LAMDA_W3C}
...    platformName=${LAMDA_PLATFORM_NAME}
...    build=${LAMDA_BUILD_NAME}_${SUITE_NAME}_${gettime}
...    name=${Test Suite, Test Case}
...    project=${LAMDA_PROJECT}
...    network=${LAMDA_NETWORK_LOG}
...    devicelog=${LAMDA_DEVICE_LOG}
...    autoGrantPermissions=true
...    visual=true
# Add your custom capabilities here
...    newCapability=value
```

## Running Tests

### Basic Test Execution

Run all tests in the tests directory:
```bash
robot tests/
```

Run a specific test file:
```bash
robot tests/test.robot
```

Run tests with custom output directory:
```bash
robot --outputdir results tests/
```

### Parallel Execution with Pabot

Run tests in parallel using multiple workers:
```bash
# Run with 2 parallel workers
pabot --processes 2 tests/

# Run with 4 parallel workers
pabot --processes 4 tests/

# Run with custom output directory
pabot --outputdir pabot_results tests/
```

### Executing Specific Tests

Run tests with specific tags:
```bash
# Run only smoke tests
robot -i SMOKE tests/

# Run only regression tests
robot -i REGRESSION tests/

# Exclude certain tests
robot -e SKIP tests/
```

Run a specific test case:
```bash
robot -t "TC001 - Open Application" tests/test.robot
```

### Generate Custom Reports

```bash
# Generate reports with custom names
robot --outputdir results \
      --output output.xml \
      --log log.html \
      --report report.html \
      tests/

# Generate JSON results
robot --output output.xml tests/
```

## Test Case Structure

### Basic Test Case Template

```robot
*** Settings ***
Library    AppiumLibrary
Resource    ../resources/config.robot

Test Template    Open app
Test Teardown    Close App

*** Test Cases ***
TC001 - Open Application    ${SUITE_NAME}-${TEST_NAME}
    # Your test steps here
```

### Custom Test Case Example

```robot
*** Settings ***
Library    AppiumLibrary
Resource    ../resources/config.robot

Test Teardown    Close App

*** Test Cases ***
TC001 - Login Test
    [Documentation]    Verify user can login successfully
    [Tags]    SMOKE    LOGIN
    Open app    ${SUITE_NAME}-${TEST_NAME}
    
    # Your test steps
    Wait Until Page Contains Element    id=login_button    timeout=30
    Input Text    id=username_field    testuser
    Input Text    id=password_field    password123
    Click Element    id=login_button
    
    # Verify login success
    Page Should Contain    Welcome, testuser
```

### Using Environment Variables in Tests

```robot
*** Test Cases ***
TC002 - Verify Environment
    [Documentation]    Test with environment variables
    ${device_name}    Get Env    LAMDA_DEVICE_NAME
    Log    Testing on device: ${device_name}
    
    ${platform}    Get Env    LAMDA_PLATFORM_NAME
    Log    Platform: ${platform}
```

## Keywords Reference

### Custom Keywords

#### Open app
Opens the mobile application on LambdaTest cloud device.

```robot
Open app    ${Test Suite, Test Case}
```

**Parameters:**
- `Test Suite, Test Case`: Combined identifier for test tracking

**Behavior:**
- Loads environment variables from .env file
- Constructs LambdaTest desired capabilities
- Opens Appium session on LambdaTest cloud
- Sets up build name with timestamp

#### Close App
Closes the application and reports test status to LambdaTest.

```robot
Close App
```

**Behavior:**
- Determines test status (PASS/FAIL)
- Executes LambdaTest status update script
- Closes the Appium session
- Logs test results

#### Get Start Date
Retrieves the build timestamp for the current test run.

```robot
${timestamp}    Get Start Date
```

**Returns:** Build timestamp in day format

#### Set Build Timestamp
Sets the build timestamp if not already set.

```robot
Set Build Timestamp
```

### AppiumLibrary Keywords

Commonly used AppiumLibrary keywords:

| Keyword | Description |
|---------|-------------|
| `Wait Until Page Contains Element` | Wait for element to appear |
| `Wait Until Element Is Visible` | Wait for element visibility |
| `Input Text` | Enter text into input field |
| `Click Element` | Click on element |
| `Page Should Contain` | Verify page contains text |
| `Page Should Contain Element` | Verify element exists |
| `Get Text` | Get element text |
| `Scroll` | Scroll on screen |
| `Swipe` | Swipe in direction |

## Test Reports

### Report Types

After test execution, the following reports are generated:

1. **report.html**: Executive summary with pass/fail statistics, pie charts, and summary tables
2. **log.html**: Detailed execution log with step-by-step information, screenshots, and error details
3. **output.xml**: Machine-readable XML output for integration with CI/CD tools and external systems

### Viewing Reports

Open reports in a web browser:
```bash
# On macOS
open report.html

# On Linux
xdg-open report.html

# On Windows
start report.html
```

### LambdaTest Dashboard

Access detailed test analytics on LambdaTest:
- Video recordings of test execution
- Device logs and system logs
- Network traffic logs
- Screenshots at failure points
- Performance metrics
- Test comparison across devices

## Troubleshooting

### Common Issues

#### Authentication Failed
**Error:** `Authentication failed` when connecting to LambdaTest

**Solution:**
- Verify your username and access key are correct
- Check that credentials haven't expired
- Ensure no special characters in credentials (escape if needed)

```bash
# Verify credentials in .env file
cat .env
```

#### Appium Server Issues
**Error:** `Appium server not running` or connection timeout

**Solution:**
- For local testing, ensure Appium server is running:
```bash
appium
```
- For LambdaTest, ensure internet connectivity

#### Device Not Found
**Error:** `Desired capabilities do not match any device`

**Solution:**
- Verify device name exists in LambdaTest device list
- Check platform name and version compatibility
- Ensure device is available (not in use)

```bash
# List available devices on LambdaTest
# Check LambdaTest dashboard for device availability
```

#### Element Not Found
**Error:** `Element not found` or timeout errors

**Solution:**
- Increase timeout in configuration
- Verify element identifiers are correct
- Check if element is in different context (web view vs native)
- Add explicit waits for dynamic content

```robot
Wait Until Page Contains Element    locator    timeout=60
```

#### Permission Issues
**Error:** `Permission denied` or `autoGrantPermissions` errors

**Solution:**
- The framework includes `autoGrantPermissions=true` in capabilities
- For local testing, ensure app has required permissions
- Check AndroidManifest.xml for proper permissions

### Debug Mode

Enable verbose logging for debugging:

```bash
robot -L DEBUG tests/test.robot
```

### Getting Help

- **Robot Framework Documentation**: https://robotframework.org/
- **AppiumLibrary Documentation**: https://github.com/serhatbolsu/robotframework-appiumlibrary
- **LambdaTest Support**: https://lambda-test.com/support
- **Robot Framework User Guide**: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html

## Best Practices

### Test Design
1. **Use Page Object Model**: Organize elements and actions by page
2. **Modular Keywords**: Create reusable keywords for common actions
3. **Clear Naming**: Use descriptive names for test cases and keywords
4. **Proper Documentation**: Document test purpose and expected results
5. **Independent Tests**: Ensure tests can run independently

### Configuration Management
1. **Environment-Specific Configs**: Use different .env files for different environments
2. **Secrets Management**: Never commit credentials to version control
3. **Device Selection**: Choose devices based on target audience statistics
4. **Build Naming**: Use consistent and descriptive build names

### Execution Strategy
1. **Parallel Execution**: Use Pabot for faster feedback
2. **Test Tagging**: Group tests by type (smoke, regression, sanity)
3. **CI/CD Integration**: Run tests automatically on code changes
4. **Scheduled Runs**: Schedule nightly or weekly test runs

### Reporting and Analysis
1. **Regular Review**: Review test reports after each run
2. **Failure Analysis**: Investigate and fix flaky tests
3. **Coverage Tracking**: Monitor test coverage over time
4. **Performance Metrics**: Track test execution times

## Contributing

### Adding New Tests

1. Create a new `.robot` file in the `tests/` directory
2. Import required libraries and resources
3. Define test cases following the project structure
4. Add appropriate tags for categorization
5. Test locally before pushing

### Extending Keywords

1. Add new keywords to `resources/config.robot`
2. Document the keyword with `[Documentation]`
3. Define parameters using `[Arguments]`
4. Return values using `[Return]`

### Code Style

- Follow Robot Framework best practices
- Use consistent indentation (4 spaces)
- Add comments for complex logic
- Keep test cases focused and simple

## CI/CD Integration

### GitHub Actions Example

```yaml
name: Mobile Tests
on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.9'
      - name: Install dependencies
        run: |
          pip install -r requirements.txt
      - name: Run tests
        run: |
          robot --outputdir results tests/
        env:
          LT_USERNAME: ${{ secrets.LT_USERNAME }}
          LT_ACCESS_KEY: ${{ secrets.LT_ACCESS_KEY }}
      - name: Upload reports
        uses: actions/upload-artifact@v3
        with:
          name: test-results
          path: results/
```

### Jenkins Pipeline Example

```groovy
pipeline {
    agent any
    environment {
        LT_USERNAME = credentials('lt-username')
        LT_ACCESS_KEY = credentials('lt-access-key')
    }
    stages {
        stage('Install') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Test') {
            steps {
                sh 'pabot --outputdir results tests/'
            }
        }
        stage('Report') {
            steps {
                archiveArtifacts artifacts: 'results/**', fingerprint: true
            }
        }
    }
}
```

## License

This project is open-source and available under the MIT License. See the LICENSE file for more details.

## Support

For questions, issues, or contributions:

1. **GitHub Issues**: Report bugs and feature requests
2. **Documentation**: Refer to Robot Framework and LambdaTest docs
3. **Community**: Robot Framework user group and forums

## Version History

- **v2.0.0** - Enhanced LambdaTest integration with Pabot support
- **v1.5.0** - Added visual testing and network logging
- **v1.0.0** - Initial release with basic Appium integration

---

**Happy Testing! 🚀**

