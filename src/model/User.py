from dao.DataAccessObject import DataAccessObject

class User(object):

	def get(self, id):

		conn = DataAccessObject().getConnection()
		cur = conn.cursor()

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
				    id = %s
				'''
		cur.execute(sql, [id])
		user_info = cur.fetchall()

		cur.close()
		conn.close()

		return user_info