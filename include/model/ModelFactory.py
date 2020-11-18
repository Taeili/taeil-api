

class ModelFactory(object):

	def get(self, Model, *args, **kwargs):
		model = Model()
		return model.get(*args, **kwargs)

	def read(self, Model, *args, **kwargs):
		model = Model()
		return model.read(*args, **kwargs)

	def create(self, Model, *args, **kwargs):
		model = Model()
		return model.create(*args, **kwargs)

	def update(self, Model, *args, **kwargs):
		model = Model()
		return model.update(*args, **kwargs)

	def delete(self, Model, *args, **kwargs):
		model = Model()
		return model.delete(*args, **kwargs)