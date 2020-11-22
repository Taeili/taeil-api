from dao.DataAccessObject import DataAccessObject

class ProductOption(object):

	def create(self, product_id, color, size):

		conn = DataAccessObject().getConnection()
		cursor = conn.cursor()

		sql = '''
				INSERT INTO sinsa.product_option (product_id, color, size) 
				VALUES (
					{product_id},
					'{color}',
					'{size}'
				);
				'''.format(product_id=product_id,
		                   color=color,
		                   size=size
		                   )

		cursor.execute(sql)
		conn.commit()

		cursor.close()
		conn.close()

		return