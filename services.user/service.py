import sys

import tornado.ioloop
import tornado.web
from src.messages.HelloMessages import HelloMessage
import logging
import os

# Set up logging
log_dir = "/app/logs"
os.makedirs(log_dir, exist_ok=True)
log_file = os.path.join(log_dir, 'app.log')
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler(log_file),
        logging.StreamHandler(sys.stdout)
    ]
)
logger = logging.getLogger(__name__)


# Define a RequestHandler to handle GET requests to "/"
class MainHandler(tornado.web.RequestHandler):
    def get(self):
        logger.info("Received GET request on /")
        self.write({"message": "Hello, World!"})


# Create an Application with a single route ("/", MainHandler)
def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
    ])


if __name__ == "__main__":
    # Create an instance of the Tornado Application
    x = HelloMessage()
    logger.info(f"HelloMessage class name: {x.class_name}")
    app = make_app()
    # Start the Tornado server on port 8888
    app.listen(8888)
    logger.info("Server listening on http://localhost:8888")
    print("Server listening on http://localhost:8888")
    # Start the Tornado event loop
    tornado.ioloop.IOLoop.current().start()
