from flask import Blueprint, jsonify, render_template, request
from model.Product import Product
from model.ModelFactory import ModelFactory

product = Blueprint('product', 'API')

@product.route('/products', methods=['GET'])
def get_products():
	factory = ModelFactory()
	products = factory.get(Product)

	return jsonify(status=200, message='OK', body={
		'status': 200,
		'message': 'OK',
		'payload': products
	})

@product.route('/product/create', methods=['POST'])
def create_product():
	data = request.json
	factory = ModelFactory()
	factory.create(Product, seller=data['seller'], name=data['name'])

	return jsonify(status=200, message='OK')