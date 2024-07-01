import tornado.ioloop
import tornado.web


# Define a RequestHandler to handle GET requests to "/"
class MainHandler(tornado.web.RequestHandler):
    def get(self):
        self.write({"message": "Hello, World!"})


# Create an Application with a single route ("/", MainHandler)
def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
    ])


if __name__ == "__main__":
    # Create an instance of the Tornado Application
    app = make_app()
    # Start the Tornado server on port 8888
    app.listen(8888)
    print("Server listening on http://localhost:8888")
    # Start the Tornado event loop
    tornado.ioloop.IOLoop.current().start()
