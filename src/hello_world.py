import logging
import os
import json

class HelloWorld():
    def __init__(self, config_file='config/logger_config.json'):
        super().__init__()
        
        with open(config_file, 'r') as f:
            config = json.load(f)
        
        self.logger = logging.getLogger(__name__)
        self.logger.setLevel(getattr(logging, config['level']))
        
        formatter = logging.Formatter(config['format'])
        
        if config['output']['file']:
            # Create logs directory if it doesn't exist
            if not os.path.exists(config['output']['path']):
                os.makedirs(config['output']['path'])
            
            fh = logging.FileHandler(os.path.join(config['output']['path'], config['output']['filename']))
            fh.setFormatter(formatter)
            self.logger.addHandler(fh)
            
        if config['output']['console']:
            ch = logging.StreamHandler()
            ch.setFormatter(formatter)
            self.logger.addHandler(ch)
    
    def say_hello(self):
        message = "Hello, World!"
        self.logger.info("Hello, World!")
        return message
