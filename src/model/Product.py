from dao.DataAccessObject import DataAccessObject

class Product(object):

	def read(self):
		conn = DataAccessObject().getConnection()
		cursor = conn.cursor()

		sql = '''
				SELECT 
					p.seller,
					p.name,
					pp.price,
					pi.path,
					pi.url
				FROM 
					sinsa.product as p
				INNER JOIN product_price as pp ON p.id = pp.product 
				INNER JOIN product_image as pi ON p.id = pi.product
				WHERE
				    status=100
				'''
		cursor.execute(sql)
		products = cursor.fetchall()

		cursor.close()
		conn.close()

		return products

	def get(self, id):
		conn = DataAccessObject().getConnection()
		cursor = conn.cursor()

		sql = '''
					SELECT 
						p.seller,
						p.name,
						pp.price,
						pi.path,
						pi.url
					FROM 
						sinsa.product as p
					INNER JOIN product_price as pp ON p.id = pp.product 
					INNER JOIN product_image as pi ON p.id = pi.product
					WHERE
					    status=100
					    id={id}
					'''.format(id=id)
		cursor.execute(sql)
		product = cursor.fetchall()

		cursor.close()
		conn.close()

		return product

	def create(self, seller, name):

		conn = DataAccessObject().getConnection()
		cursor = conn.cursor()

		sql = '''
				INSERT INTO sinsa.product (seller, name) 
				VALUES (
					{seller},
					'{name}'
				)
				'''.format(seller=seller,
		                   name=name)

		cursor.execute(sql)

		cursor.close()
		conn.close()

		return