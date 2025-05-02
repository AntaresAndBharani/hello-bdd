## Instructions for Adding Logger

To add a logger to each class and method, follow these steps:

1.  **Import the `logging` module:**
    ```python
    import logging
    import os
    ```

2.  **In the class `__init__` method, configure the logger:**
    ```python
    def __init__(self):
        super().__init__()
        # Create logs directory if it doesn't exist
        if not os.path.exists('logs'):
            os.makedirs('logs')

        self.logger = logging.getLogger(__name__)
        self.logger.setLevel(logging.INFO)
        
        # Create file handler
        fh = logging.FileHandler('logs/your_module_name.log') # Replace your_module_name
        
        # Create formatter and add it to the handler
        formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(funcName)s - %(message)s')
        fh.setFormatter(formatter)
        
        # Add the handler to the logger
        self.logger.addHandler(fh)
    ```
    *   Make sure to replace `your_module_name` with the appropriate name for your module.

3.  **Use the logger in your methods:**
    ```python
    def your_method(self):
        self.logger.info("Message to log")
        # ... rest of your code ...
    ```

This setup will ensure that log messages include the timestamp, module name, log level, method name, and the log message itself, and that logs are written to a file in the `logs` directory.

## Instructions for Behavior-Driven Development (BDD) with Behave

When developing new functionality or modifying existing code, follow these BDD practices:

1.  **Source Code Location:**
    *   All primary Python source code (classes, functions implementing the core logic) should reside within the `src` directory.

2.  **Feature Files:**
    *   For each new feature or significant piece of functionality developed in `src`, create a corresponding `.feature` file in the `features` directory.
    *   Write scenarios using Gherkin syntax (Given, When, Then) to describe the expected behavior from a user's perspective.

3.  **Step Definitions:**
    *   For each `.feature` file, create a corresponding Python file for step definitions in the `features/steps` directory (e.g., `feature_name_steps.py`).
    *   Implement the Python functions decorated with `@given`, `@when`, `@then` that match the steps defined in the `.feature` file.
    *   These step definitions will often import and utilize the code from the `src` directory to execute the actions and verify the outcomes.

4.  **Logging Requirement:**
    *   Remember to apply the **Instructions for Adding Logger** (detailed above) to *all* classes created, both in the `src` directory and potentially within step definition files if complex state or logic is managed there. Ensure logger configuration and usage are implemented as specified.
