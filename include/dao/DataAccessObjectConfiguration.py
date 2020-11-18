import os
import json

class DataAccessObjectConfiguration(object):

	def getConfiguration(self):
		with open('conf/configuration.{}.json'.format(os.environ['PYTHONENV']), 'r') as configuration:
			conf = json.load(configuration)
		conf = conf['database']['postgresql']
		return conf