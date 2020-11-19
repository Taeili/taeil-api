from psycopg2 import connect
from dao.DataAccessObjectConfiguration import DataAccessObjectConfiguration

class DataAccessObject(object):

	def getConnection(self):
		conf = DataAccessObjectConfiguration().getConfiguration()
		connection = connect(host=conf['host'], dbname=conf['db'], user=conf['user'], password=conf['password'], port=conf['port'])
		return connection