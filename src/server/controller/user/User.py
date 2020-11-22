from flask import Blueprint, jsonify, render_template
from mo.user.User import User
from model.ModelFactory import ModelFactory

user = Blueprint('user', 'API')

@user.route('/user/<user_id>', methods=['GET'])
def get_users(user_id):

	factory = ModelFactory()
	user_info = factory.get(User, id=user_id)

	return jsonify(status=200, message='OK', body={
		'status': 200,
		'message': 'OK',
		'payload': user_info
	})

@user.route('/register', methods=['GET'])
def get_register_form():
	return render_template('register.html')