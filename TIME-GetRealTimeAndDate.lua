local seconds = os.time()
local minutes = seconds/60 
local timezone = 2 --GMT+2
local hours = (minutes/60)
local days = math.floor(hours/24)

function calculateDate(date, days, months, years)
local year, month, day = date[1], date[2], date[3]

month = month + months 
if month > 12 then 
years = years + math.floor(month / 12)
month = month % 12
end

year = year + years 

local function daysInMonth(year, month)
local daysInMonth = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
if month == 2 and (year % 4 == 0 and (year % 100 ~= 0 or year % 400 == 0)) then 
return 29 
else 
return daysInMonth[month]
end
end

while days > 0 do 
local daysInCurrentMonth = daysInMonth(year, month)
if day + days > daysInCurrentMonth then 
days = days - (daysInCurrentMonth - day + 1)
month = month + 1 
day = 1 
if month > 12 then 
month = 1 
year = year + 1
end
else 
day = day + days 
days = 0
end
end

return {day, month, year}
end

function calculateTime(iTime, hours, minutes)
local hour, minute = iTime[1], iTime[2]

hour = hour + hour 
minute = minute + minutes 

if minute >= 60 then 
hour = hour + math.floor(minute / 60)
minute = minute % 60 
end

if hour >= 24 then 
hour = hour % 24 
end

return {math.floor(hour), math.floor(minute)}
end


local currentDate = calculateDate({1970, 1, 1}, days, 0, 0)
local currentTime = calculateTime({0, 0}, hours, minutes)
currentTime[1] = currentTime[1] + timezone

print(table.concat(currentDate, '.'))
print(table.concat(currentTime, ':'))
