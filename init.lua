-- Convert the settings to the corresponding format strings
if time_format == "24_hour" then 
	time_format = "%H:%M:%S" 
else 
	time_format = "%I:%M:%S %p" 
end

if date_separator == "slash" then 
	date_separator_char = "/"
elseif date_separator == "dash" then 
	date_separator_char = "-"
elseif date_separator == "period" then 
	date_separator_char = "."
elseif date_separator == "comma" then 
	date_separator_char = ","
end

if date_order == "month_day_year" then 
	date_format = "%m"..date_separator_char.."%d"..date_separator_char.."%Y" 
elseif date_order == "year_month_day" then 
	date_format = "%Y"..date_separator_char.."%m"..date_separator_char.."%d" 
elseif date_order == "year_day_month" then 
	date_format = "%Y"..date_separator_char.."%d"..date_separator_char.."%m" 
else 
	date_format = "%d"..date_separator_char.."%m"..date_separator_char.."%Y" 
end

-- Modify the chat message
minetest.register_on_chat_message(function(name, message)
    local time = os.date(time_format) 
    local date = os.date(date_format) 
    minetest.chat_send_all("<"..name.."> "..message.." [Message sent at "..time.." on "..date.."]")
    return true
end)
