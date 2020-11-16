from flask import Blueprint, jsonify

user = Blueprint('user', 'API')

@user.route('/user', methods=['GET'])
def read():
	return 'read user'