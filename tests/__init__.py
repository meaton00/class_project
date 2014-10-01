import unittest

class InitializationTests(unittest.TestCase):

	#def  setUp(self):
	#	print "setting up"
		
	#def tearDown(self):
	#	raise Exception("tearing down!")
	
	def test_sanity(self):
		"""Check that the world is sane and 2+2=4"""
		self.assertEquals(2+2, 4)
		
	def test_import(self):
		""" We're able to import the classproj module"""
		try:
			import classproj
		except ImportError:
			self.fail("Could not import classproj")