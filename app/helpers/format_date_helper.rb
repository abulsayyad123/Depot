module FormatDateHelper
	def long_date(date)
		date.strftime('%b %e , %Y')
	end
end
