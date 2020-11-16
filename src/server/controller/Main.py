from flask import Blueprint, jsonify

main = Blueprint('main', 'API')

@main.route('/', methods=['GET'])
def read():
	return 'main page'