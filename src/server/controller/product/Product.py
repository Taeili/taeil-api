from flask import Blueprint, jsonify, request, render_template
from mo.product.Product import Product
from mo.product.ProductOption import ProductOption
from mo.product.ProductImage import ProductImage
from mo.product.ProductPrice import ProductPrice

from model.ModelFactory import ModelFactory

product = Blueprint('product', 'API')

@product.route('/products', methods=['GET'])
def get_products():
	factory = ModelFactory()
	products = factory.read(Product)

	return jsonify(status=200, message='OK', body={
		'status': 200,
		'message': 'OK',
		'payload': products
	})

@product.route('/product/<product_id>', methods=['GET'])
def get_product_detail(product_id):
	factory = ModelFactory()
	product = factory.get(Product, id=product_id)

	return render_template('product_detail.html', product=product)

@product.route('/product/create', methods=['POST'])
def create_product():
	data = request.json
	factory = ModelFactory()

	product_id = factory.create(Product, seller=data['seller'], name=data['name'])

	for color in data['option']['color']:
		for size in data['option']['size']:
			factory.create(ProductOption, product_id=product_id, color=color, size=size)
	for seq, image in enumerate(data['images']):
		factory.create(ProductImage, product_id=product_id, seq=int(seq), path=image['path'], url=image['url'])
	factory.create(ProductPrice, product_id=product_id, price=data['price'])

	return jsonify(status=201, message='Created')