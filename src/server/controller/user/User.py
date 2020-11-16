from flask import Blueprint, jsonify, request
from dao.DataAccessObject import DataAccessObject


user = Blueprint('user', 'API')

@user.route('/user/<user>', methods=['GET'])
def get_user_info(user):
	dao = DataAccessObject()
	conn = dao.getConnection()

	cur = conn.cursor()

	sql = '''
		SELECT 
			email,
			name,
			nickname,
			sns,
			created
		FROM 
			sinsa.user 
		WHERE
		    id = %s
		'''
	cur.execute(sql, [user])
	user_info = cur.fetchall()

	cur.close()
	conn.close()

	return jsonify(status=200, message='OK', body={
		'status': 200,
		'message': 'OK',
		'payload': user_info
	})