class MyClass
	NAME = "Class Name"
	@@count = 0

	def initialize
		@@count += 1
		@myvar = 10
	end

	def MyClass.getcount
		@@count
	end

	def getcount
		@@count
	end

	def getmyvar
		@myvar
	end

	def setmyvar(val)
		@myvar = val
	end
	def myvar=(val)
		@myvar = val
	end
end

foo = MyClass.new
foo.setmyvar 20
foo.myvar = 30