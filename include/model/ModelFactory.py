

class ModelFactory(object):

	def get(self, Model, *args, **kwargs):
		model = Model()
		return model.get(*args, **kwargs)