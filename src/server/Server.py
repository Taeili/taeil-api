from flask import Flask

from server.controller.Main import main
from server.controller.user.User import user
from server.controller.product.Product import product

class Server(object):

	def __init__(self):
		self.app=Flask('API', static_folder='templates/static')
		self.app.register_blueprint(main)
		self.app.register_blueprint(user)
		self.app.register_blueprint(product)

	def run(self):
		self.app.run()