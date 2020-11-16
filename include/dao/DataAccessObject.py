from psycopg2 import connect

class DataAccessObject(object):

	def getConnection(self):
		connection = connect(host='', dbname='', user='', password='', port=5432)
		return connection