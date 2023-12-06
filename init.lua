-- Get the settings
local time_format = minetest.settings:get("time_format") --or "24_hour"
local date_format = minetest.settings:get("date_format") --or "dd-mm-yyyy"

-- Convert the settings to the corresponding format strings
if time_format == "24_hour" then 
	time_format = "%H:%M:%S" 
else 
	time_format = "%I:%M:%S %p" 
end

if date_format == "mm-dd-yyyy" then 
	date_format = "%m/%d/%Y" 
else 
	date_format = "%d/%m/%Y" 
end

-- Modify the chat message
minetest.register_on_chat_message(function(name, message)
    local time = os.date(time_format) 
    local date = os.date(date_format) 
    minetest.chat_send_all("<"..name.."> "..message.." [Message sent at "..time.." on "..date.."]")
    return true
end)