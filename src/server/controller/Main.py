from flask import Blueprint, render_template
from model.ModelFactory import ModelFactory
from mo.product.Product import Product

main = Blueprint('main', 'API')

@main.route('/', methods=['GET'])
def get_main_page():

	factory = ModelFactory()
	products = factory.read(Product)

	return render_template('products.html', products=products)