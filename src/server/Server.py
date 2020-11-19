from flask import Flask

from server.controller.Main import main
from server.controller.user.User import user

class Server(object):

	def __init__(self):
		self.app=Flask('API', static_folder='templates/static')
		self.app.register_blueprint(main)
		self.app.register_blueprint(user)

	def run(self):
		self.app.run()