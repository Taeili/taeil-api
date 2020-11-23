from dao.DataAccessObject import DataAccessObject
from psycopg2.extras import RealDictCursor
import json

class Product(object):

	def read(self):
		conn = DataAccessObject().getConnection()
		cursor = conn.cursor(cursor_factory=RealDictCursor)

		sql = '''
				SELECT
				    p.id,
				    p.seller,
				    p.name,
				    pp.price,
				       (select array_to_json(array_agg(product_image)) from product_image where product_id=p.id) as image
				FROM
				    sinsa.product as p
				    INNER JOIN product_price as pp ON p.id = pp.product_id
				WHERE
				        p.status=100
				'''
		cursor.execute(sql)
		products = cursor.fetchall()

		cursor.close()
		conn.close()

		return products

	def get(self, id):
		conn = DataAccessObject().getConnection()
		cursor = conn.cursor(cursor_factory=RealDictCursor)

		sql = '''
					SELECT
						p.id,
						p.seller,
						p.name,
						pp.price,
						(select array_to_json(array_agg(product_image)) from product_image where product_id={id}) as image,
						(select array_to_json(array_agg(DISTINCT size)) from product_option where product_id={id}) as size,
						(select array_to_json(array_agg(DISTINCT color)) from product_option where product_id={id}) as color
					FROM 
						sinsa.product as p
					INNER JOIN product_price as pp ON p.id = pp.product_id

					WHERE
					    status=100
					    AND p.id={id}
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
				returning id
				'''.format(seller=seller,
		                   name=name)

		cursor.execute(sql)
		conn.commit()

		product_id = cursor.fetchone()[0]

		cursor.close()
		conn.close()

		return product_id