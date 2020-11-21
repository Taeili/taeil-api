from flask import Blueprint, render_template

main = Blueprint('main', 'API')

@main.route('/', methods=['GET'])
def get_main_page():
	return render_template('index.html')