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
