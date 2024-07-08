import os
import sys
import logging


class LoggerSingleton:
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(LoggerSingleton, cls).__new__(cls)
            cls._instance._initialize_logger()
        return cls._instance

    def _initialize_logger(self):
        log_dir = "/app/logs"
        os.makedirs(log_dir, exist_ok=True)
        log_file = os.path.join(log_dir, 'app.log')

        is_container = os.environ.get('CONTAINER', '').lower() == 'true'

        handlers = []
        if is_container:
            handlers.append(logging.FileHandler(log_file))
        else:
            handlers.append(logging.StreamHandler(sys.stdout))

        logging.basicConfig(
            level=logging.INFO,
            format='%(asctime)s %(levelname)s %(message)s',
            handlers=handlers
        )

        self.logger = logging.getLogger(__name__)

    def get_logger(self):
        return self.logger
