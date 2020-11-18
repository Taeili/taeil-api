from flask import Blueprint, jsonify
from model.User import User
from model.ModelFactory import ModelFactory

user = Blueprint('user', 'API')

@user.route('/user/<user_id>', methods=['GET'])
def get_user_info(user_id):

	factory = ModelFactory()
	user_info = factory.get(User, id=user_id)

	return jsonify(status=200, message='OK', body={
		'status': 200,
		'message': 'OK',
		'payload': user_info
	})