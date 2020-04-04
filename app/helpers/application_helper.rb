module ApplicationHelper
	def number_to_currency_rupiah(number)
		number_to_currency(number,:unit =>"Rp.",:delimiter =>".",:precision =>0)
	end
end
