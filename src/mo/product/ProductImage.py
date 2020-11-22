from dao.DataAccessObject import DataAccessObject

class ProductImage(object):

	def create(self, product_id, seq, path, url):

		conn = DataAccessObject().getConnection()
		cursor = conn.cursor()

		sql = '''
				INSERT INTO sinsa.product_image (product_id, seq, path, url) 
				VALUES (
					{product_id},
					{seq},
					'{path}',
					'{url}'
				);
				'''.format(product_id=product_id,
		                   seq=seq,
		                   path=path,
                           url=url
		                   )

		cursor.execute(sql)
		conn.commit()

		cursor.close()
		conn.close()

		return