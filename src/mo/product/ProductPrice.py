from dao.DataAccessObject import DataAccessObject

class ProductPrice(object):

	def create(self, product_id, price):

		conn = DataAccessObject().getConnection()
		cursor = conn.cursor()

		sql = '''
				INSERT INTO sinsa.product_price (product_id, price) 
				VALUES (
					{product_id},
					{price}
				)
				'''.format(product_id=product_id,
						   price=price
		                   )

		cursor.execute(sql)
		conn.commit()

		cursor.close()
		conn.close()

		return