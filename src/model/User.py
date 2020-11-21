from dao.DataAccessObject import DataAccessObject

class User(object):

	def get(self, id):

		conn = DataAccessObject().getConnection()
		cursor = conn.cursor()

		sql = '''
				SELECT 
					email,
					name,
					nickname,
					sns,
					created
				FROM 
					sinsa.user 
				WHERE
				    id = {id}
				'''.format(id=id)
		cursor.execute(sql)
		user_info = cursor.fetchall()

		cursor.close()
		conn.close()

		return user_info