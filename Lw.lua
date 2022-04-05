

    
   



local user = {
    ["KRIPSI"] = true,
    [""] = true,
}

local name = globals.get_username()
if user[name] == nil then
console.execute("quit")
else


    print("Coded By KRIPSI LEGEND")
menu.add_check_box("KRIPSI YAW")
local math_random = math.random
local function kripsaa()
    if menu.get_bool("KRIPSI YAW") then
        menu.set_int("anti_aim.desync_range", math_random (37, 47))
        menu.set_int("anti_aim.desync_range_inverted", math_random (22, 26))
        menu.set_int("anti_aim.yaw_offset", math_random (0, -5))
        
        
    end
end
-------------------
inverter = menu.get_key_bind_state("anti_aim.invert_desync_key")
timer = 0
function cu()
    timer = timer + 1
if  timer > 4 then
    timer = 0
end
if menu.get_bool("KRIPSI YAW") and menu.get_key_bind_state("rage.double_tap_key") then
if timer == 0 then
menu.set_int("anti_aim.yaw_offset", 40)
menu.set_bool("anti_aim.invert_desync_key", false)
elseif timer == 2 then
menu.set_int("anti_aim.yaw_offset", -40)
menu.set_bool("anti_aim.invert_desync_key", true)
end
end
end

function l()
menu.set_int("anti_aim.yaw_modifier", 0)
menu.set_int("anti_aim.desync_type", 1)
end

function a()
if not menu.get_key_bind_state("rage.double_tap_key") then
menu.set_int("anti_aim.yaw_offset", 0)
else

end
end


--------------------------------


local ft = render.create_font("MuseoSansCyrl-500", 14, 500, true, false, false)
local ft1 = render.create_font("MuseoSansCyrl-900", 14, 500, true, false, false)

client.add_callback("on_paint", function()
    
        local screen_width = engine.get_screen_width()
        local name = globals.get_username()
        local ping = tostring(globals.get_ping())
        local time = os.date("%H:%M:%S")
        local tt = "KRIPSI YAW"
        local wm
        if engine.is_connected() then
            wm = " | "..name.." | "..ping.." ms | "..time
        else
            wm = " | "..name.." | Offline | "..time
        end
        local width = render.get_text_width(ft, wm)
        local x = screen_width - 12 - width - 7
        local y = 10
        local w = width
        render.draw_rect_filled(x-77, y-5, w+79, 20, color.new(1,16,29,200))
        render.draw_text(ft, x-2, y-2, color.new(255,255,255), wm)
        render.draw_text(ft1, x-74, y-2, color.new(45, 179, 246), tt)
        render.draw_text(ft1, x-73, y-1, color.new(755,777,755), tt)
    
end)



---RESOLVER
local angles = {
    [1] = -60,
    [2] = 60,
    [3] = -58,
    [4] = 58,
    [5] = -50,
    [6] = 50,
    [7] = -55,
    [8] = 55,
    [9] = 48,
    [10] = -48,
    [11] = 30,
    [12] = -29,
    [13] = 29,
    [14] = -15,
    [15] = 15,
    [16] = 0
}

local bit_band = bit.band
local math_pi   = math.pi
local math_min  = math.min
local math_max  = math.max
local math_deg  = math.deg
local math_rad  = math.rad
local math_sqrt = math.sqrt
local math_sin  = math.sin
local math_cos  = math.cos
local math_atan = math.atan
local math_atan2 = math.atan2
local math_acos = math.acos
local math_fmod = math.fmod
local math_ceil = math.ceil
local math_pow = math.pow
local math_abs = math.abs
local math_floor = math.floor
local last_angle = 0
local new_angle = 0
local last_angle = 0
local new_angle = 0
local switch1 = false
local switch2 = false
local i = 1
local username = globals.get_username()



menu.add_check_box("Resolver")



local function resolve(shot_info)
	local result = shot_info.result
	local gpinf = engine.get_player_info
	local target = shot_info.target_index
	local target_name = gpinf(target).name

menu.set_bool("player_list.player_settings[" .. target.. "].force_body_yaw", true) -- we only want to bruteforce our target. not everyone
    
    if last_angle == -new_angle and switch1 then
        new_angle = -angles[i]
        if switch2 == true then
            switch1 = not switch1
        end
    else
        if i < #angles then
            i = i + 1
        else
            i = 1
        end
        new_angle = angles[i]
    end
    if last_angle == 0 then
        last_angle = "RESOLVER"
    end


	if result == "Resolver" and menu.get_bool("Enable Resolver lua") then
	print("[LEGENDWARE] missed player: " ..target_name .. ", at angle: " .. last_angle .. ", bruteforced to: " .. new_angle) 
    
	menu.set_int("player_list.player_settings["..target.."].body_yaw", new_angle) 
    end

    if result == "Hit" and menu.get_bool("Enable Resolver lua") then
        print("[LEGENDWARE] hit player " ..target_name.. ", at angle: " .. new_angle)
    end


local function set_all_down()
    local all = globals.get_maxclients()

    if menu.get_bool("force all players down") then
        for nigger=1,48 do
        menu.set_bool("player_list.player_settings[" ..nigger.. "].force_pitch", true)
        menu.set_int("player_list.player_settings[" ..nigger.. "].pitch", 89)
        end
    end
end

client.add_callback("on_shot", resolve)
client.add_callback("on_paint", set_all_down)

if username == "User" then
    console.execute("sv_lan 1")
else
end
end
--region math
function math.round(number, precision)
	local mult = 10 ^ (precision or 0)

	return math.floor(number * mult + 0.5) / mult
end
--endregion

--region angle
--- @class angle_c
--- @field public p number Angle pitch.
--- @field public y number Angle yaw.
--- @field public r number Angle roll.
local angle_c = {}
local angle_mt = {
	__index = angle_c
}

--- Overwrite the angle's angles. Nil values leave the angle unchanged.
--- @param angle angle_c
--- @param p_new number
--- @param y_new number
--- @param r_new number
--- @return void
angle_mt.__call = function(angle, p_new, y_new, r_new)
	p_new = p_new or angle.p
	y_new = y_new or angle.y
	r_new = r_new or angle.r

	angle.p = p_new
	angle.y = y_new
	angle.r = r_new
end

--- Create a new angle object.
--- @param p number
--- @param y number
--- @param r number
--- @return angle_c
local function angle(p, y, r)
	return setmetatable(
		{
			p = p or 0,
			y = y or 0,
			r = r or 0
		},
		angle_mt
	)
end

--- Overwrite the angle's angles. Nil values leave the angle unchanged.
--- @param p number
--- @param y number
--- @param r number
--- @return void
function angle_c:set(p, y, r)
	p = p or self.p
	y = y or self.y
	r = r or self.r

	self.p = p
	self.y = y
	self.r = r
end

--- Offset the angle's angles. Nil values leave the angle unchanged.
--- @param p number
--- @param y number
--- @param r number
--- @return void
function angle_c:offset(p, y, r)
	p = self.p + p or 0
	y = self.y + y or 0
	r = self.r + r or 0

	self.p = self.p + p
	self.y = self.y + y
	self.r = self.r + r
end

--- Clone the angle object.
--- @return angle_c
function angle_c:clone()
	return setmetatable(
		{
			p = self.p,
			y = self.y,
			r = self.r
		},
		angle_mt
	)
end

--- Clone and offset the angle's angles. Nil values leave the angle unchanged.
--- @param p number
--- @param y number
--- @param r number
--- @return angle_c
function angle_c:clone_offset(p, y, r)
	p = self.p + p or 0
	y = self.y + y or 0
	r = self.r + r or 0

	return angle(
		self.p + p,
		self.y + y,
		self.r + r
	)
end

--- Clone the angle and optionally override its coordinates.
--- @param p number
--- @param y number
--- @param r number
--- @return angle_c
function angle_c:clone_set(p, y, r)
	p = p or self.p
	y = y or self.y
	r = r or self.r

	return angle(
		p,
		y,
		r
	)
end

--- Unpack the angle.
--- @return number, number, number
function angle_c:unpack()
	return self.p, self.y, self.r
end

--- Set the angle's euler angles to 0.
--- @return void
function angle_c:nullify()
	self.p = 0
	self.y = 0
	self.r = 0
end

--- Returns a string representation of the angle.
function angle_mt.__tostring(operand_a)
	return string.format("%s, %s, %s", operand_a.p, operand_a.y, operand_a.r)
end

--- Concatenates the angle in a string.
function angle_mt.__concat(operand_a)
	return string.format("%s, %s, %s", operand_a.p, operand_a.y, operand_a.r)
end

--- Adds the angle to another angle.
function angle_mt.__add(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return angle(
			operand_a + operand_b.p,
			operand_a + operand_b.y,
			operand_a + operand_b.r
		)
	end

	if (type(operand_b) == "number") then
		return angle(
			operand_a.p + operand_b,
			operand_a.y + operand_b,
			operand_a.r + operand_b
		)
	end

	return angle(
		operand_a.p + operand_b.p,
		operand_a.y + operand_b.y,
		operand_a.r + operand_b.r
	)
end

--- Subtracts the angle from another angle.
function angle_mt.__sub(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return angle(
			operand_a - operand_b.p,
			operand_a - operand_b.y,
			operand_a - operand_b.r
		)
	end

	if (type(operand_b) == "number") then
		return angle(
			operand_a.p - operand_b,
			operand_a.y - operand_b,
			operand_a.r - operand_b
		)
	end

	return angle(
		operand_a.p - operand_b.p,
		operand_a.y - operand_b.y,
		operand_a.r - operand_b.r
	)
end

--- Multiplies the angle with another angle.
function angle_mt.__mul(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return angle(
			operand_a * operand_b.p,
			operand_a * operand_b.y,
			operand_a * operand_b.r
		)
	end

	if (type(operand_b) == "number") then
		return angle(
			operand_a.p * operand_b,
			operand_a.y * operand_b,
			operand_a.r * operand_b
		)
	end

	return angle(
		operand_a.p * operand_b.p,
		operand_a.y * operand_b.y,
		operand_a.r * operand_b.r
	)
end

--- Divides the angle by the another angle.
function angle_mt.__div(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return angle(
			operand_a / operand_b.p,
			operand_a / operand_b.y,
			operand_a / operand_b.r
		)
	end

	if (type(operand_b) == "number") then
		return angle(
			operand_a.p / operand_b,
			operand_a.y / operand_b,
			operand_a.r / operand_b
		)
	end

	return angle(
		operand_a.p / operand_b.p,
		operand_a.y / operand_b.y,
		operand_a.r / operand_b.r
	)
end

--- Raises the angle to the power of an another angle.
function angle_mt.__pow(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return angle(
			math.pow(operand_a, operand_b.p),
			math.pow(operand_a, operand_b.y),
			math.pow(operand_a, operand_b.r)
		)
	end

	if (type(operand_b) == "number") then
		return angle(
			math.pow(operand_a.p, operand_b),
			math.pow(operand_a.y, operand_b),
			math.pow(operand_a.r, operand_b)
		)
	end

	return angle(
		math.pow(operand_a.p, operand_b.p),
		math.pow(operand_a.y, operand_b.y),
		math.pow(operand_a.r, operand_b.r)
	)
end

--- Performs modulo on the angle with another angle.
function angle_mt.__mod(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return angle(
			operand_a % operand_b.p,
			operand_a % operand_b.y,
			operand_a % operand_b.r
		)
	end

	if (type(operand_b) == "number") then
		return angle(
			operand_a.p % operand_b,
			operand_a.y % operand_b,
			operand_a.r % operand_b
		)
	end

	return angle(
		operand_a.p % operand_b.p,
		operand_a.y % operand_b.y,
		operand_a.r % operand_b.r
	)
end

--- Perform a unary minus operation on the angle.
function angle_mt.__unm(operand_a)
	return angle(
		-operand_a.p,
		-operand_a.y,
		-operand_a.r
	)
end

--- Clamps the angles to whole numbers. Equivalent to "angle:round" with no precision.
--- @return void
function angle_c:round_zero()
	self.p = math.floor(self.p + 0.5)
	self.y = math.floor(self.y + 0.5)
	self.r = math.floor(self.r + 0.5)
end

--- Round the angles.
--- @param precision number
function angle_c:round(precision)
	self.p = math.round(self.p, precision)
	self.y = math.round(self.y, precision)
	self.r = math.round(self.r, precision)
end

--- Clamps the angles to the nearest base.
--- @param base number
function angle_c:round_base(base)
	self.p = base * math.round(self.p / base)
	self.y = base * math.round(self.y / base)
	self.r = base * math.round(self.r / base)
end

--- Clamps the angles to whole numbers. Equivalent to "angle:round" with no precision.
--- @return angle_c
function angle_c:rounded_zero()
	return angle(
		math.floor(self.p + 0.5),
		math.floor(self.y + 0.5),
		math.floor(self.r + 0.5)
	)
end

--- Round the angles.
--- @param precision number
--- @return angle_c
function angle_c:rounded(precision)
	return angle(
		math.round(self.p, precision),
		math.round(self.y, precision),
		math.round(self.r, precision)
	)
end

--- Clamps the angles to the nearest base.
--- @param base number
--- @return angle_c
function angle_c:rounded_base(base)
	return angle(
		base * math.round(self.p / base),
		base * math.round(self.y / base),
		base * math.round(self.r / base)
	)
end
--endregion

--region vector
--- @class vector_c
--- @field public x number X coordinate.
--- @field public y number Y coordinate.
--- @field public z number Z coordinate.
local vector_c = {}
local vector_mt = {
	__index = vector_c,
}

--- Overwrite the vector's coordinates. Nil will leave coordinates unchanged.
--- @param vector vector_c
--- @param x_new number
--- @param y_new number
--- @param z_new number
--- @return void
vector_mt.__call = function(vector, x_new, y_new, z_new)
	x_new = x_new or vector.x
	y_new = y_new or vector.y
	z_new = z_new or vector.z

	vector.x = x_new
	vector.y = y_new
	vector.z = z_new
end

--- Create a new vector object.
--- @param x number
--- @param y number
--- @param z number
--- @return vector_c
local function vector(x, y, z)
	return setmetatable(
		{
			x = x or 0,
			y = y or 0,
			z = z or 0
		},
		vector_mt
	)
end

--- Overwrite the vector's coordinates. Nil will leave coordinates unchanged.
--- @param x_new number
--- @param y_new number
--- @param z_new number
--- @return void
function vector_c:set(x_new, y_new, z_new)
	x_new = x_new or self.x
	y_new = y_new or self.y
	z_new = z_new or self.z

	self.x = x_new
	self.y = y_new
	self.z = z_new
end

--- Offset the vector's coordinates. Nil will leave the coordinates unchanged.
--- @param x_offset number
--- @param y_offset number
--- @param z_offset number
--- @return void
function vector_c:offset(x_offset, y_offset, z_offset)
	x_offset = x_offset or 0
	y_offset = y_offset or 0
	z_offset = z_offset or 0

	self.x = self.x + x_offset
	self.y = self.y + y_offset
	self.z = self.z + z_offset
end

--- Clone the vector object.
--- @return vector_c
function vector_c:clone()
	return setmetatable(
		{
			x = self.x,
			y = self.y,
			z = self.z
		},
		vector_mt
	)
end

--- Clone the vector object and offset its coordinates. Nil will leave the coordinates unchanged.
--- @param x_offset number
--- @param y_offset number
--- @param z_offset number
--- @return vector_c
function vector_c:clone_offset(x_offset, y_offset, z_offset)
	x_offset = x_offset or 0
	y_offset = y_offset or 0
	z_offset = z_offset or 0

	return setmetatable(
		{
			x = self.x + x_offset,
			y = self.y + y_offset,
			z = self.z + z_offset
		},
		vector_mt
	)
end

--- Clone the vector and optionally override its coordinates.
--- @param x_new number
--- @param y_new number
--- @param z_new number
--- @return vector_c
function vector_c:clone_set(x_new, y_new, z_new)
	x_new = x_new or self.x
	y_new = y_new or self.y
	z_new = z_new or self.z

	return vector(
		x_new,
		y_new,
		z_new
	)
end

--- Unpack the vector.
--- @return number, number, number
function vector_c:unpack()
	return self.x, self.y, self.z
end

--- Set the vector's coordinates to 0.
--- @return void
function vector_c:nullify()
	self.x = 0
	self.y = 0
	self.z = 0
end

--- Returns a string representation of the vector.
function vector_mt.__tostring(operand_a)
	return string.format("%s, %s, %s", operand_a.x, operand_a.y, operand_a.z)
end

--- Concatenates the vector in a string.
function vector_mt.__concat(operand_a)
	return string.format("%s, %s, %s", operand_a.x, operand_a.y, operand_a.z)
end

--- Returns true if the vector's coordinates are equal to another vector.
function vector_mt.__eq(operand_a, operand_b)
	return (operand_a.x == operand_b.x) and (operand_a.y == operand_b.y) and (operand_a.z == operand_b.z)
end

--- Returns true if the vector is less than another vector.
function vector_mt.__lt(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return (operand_a < operand_b.x) or (operand_a < operand_b.y) or (operand_a < operand_b.z)
	end

	if (type(operand_b) == "number") then
		return (operand_a.x < operand_b) or (operand_a.y < operand_b) or (operand_a.z < operand_b)
	end

	return (operand_a.x < operand_b.x) or (operand_a.y < operand_b.y) or (operand_a.z < operand_b.z)
end

--- Returns true if the vector is less than or equal to another vector.
function vector_mt.__le(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return (operand_a <= operand_b.x) or (operand_a <= operand_b.y) or (operand_a <= operand_b.z)
	end

	if (type(operand_b) == "number") then
		return (operand_a.x <= operand_b) or (operand_a.y <= operand_b) or (operand_a.z <= operand_b)
	end

	return (operand_a.x <= operand_b.x) or (operand_a.y <= operand_b.y) or (operand_a.z <= operand_b.z)
end

--- Add a vector to another vector.
function vector_mt.__add(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return vector(
			operand_a + operand_b.x,
			operand_a + operand_b.y,
			operand_a + operand_b.z
		)
	end

	if (type(operand_b) == "number") then
		return vector(
			operand_a.x + operand_b,
			operand_a.y + operand_b,
			operand_a.z + operand_b
		)
	end

	return vector(
		operand_a.x + operand_b.x,
		operand_a.y + operand_b.y,
		operand_a.z + operand_b.z
	)
end

--- Subtract a vector from another vector.
function vector_mt.__sub(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return vector(
			operand_a - operand_b.x,
			operand_a - operand_b.y,
			operand_a - operand_b.z
		)
	end

	if (type(operand_b) == "number") then
		return vector(
			operand_a.x - operand_b,
			operand_a.y - operand_b,
			operand_a.z - operand_b
		)
	end

	return vector(
		operand_a.x - operand_b.x,
		operand_a.y - operand_b.y,
		operand_a.z - operand_b.z
	)
end

--- Multiply a vector with another vector.
function vector_mt.__mul(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return vector(
			operand_a * operand_b.x,
			operand_a * operand_b.y,
			operand_a * operand_b.z
		)
	end

	if (type(operand_b) == "number") then
		return vector(
			operand_a.x * operand_b,
			operand_a.y * operand_b,
			operand_a.z * operand_b
		)
	end

	return vector(
		operand_a.x * operand_b.x,
		operand_a.y * operand_b.y,
		operand_a.z * operand_b.z
	)
end

--- Divide a vector by another vector.
function vector_mt.__div(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return vector(
			operand_a / operand_b.x,
			operand_a / operand_b.y,
			operand_a / operand_b.z
		)
	end

	if (type(operand_b) == "number") then
		return vector(
			operand_a.x / operand_b,
			operand_a.y / operand_b,
			operand_a.z / operand_b
		)
	end

	return vector(
		operand_a.x / operand_b.x,
		operand_a.y / operand_b.y,
		operand_a.z / operand_b.z
	)
end

--- Raised a vector to the power of another vector.
function vector_mt.__pow(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return vector(
			math.pow(operand_a, operand_b.x),
			math.pow(operand_a, operand_b.y),
			math.pow(operand_a, operand_b.z)
		)
	end

	if (type(operand_b) == "number") then
		return vector(
			math.pow(operand_a.x, operand_b),
			math.pow(operand_a.y, operand_b),
			math.pow(operand_a.z, operand_b)
		)
	end

	return vector(
		math.pow(operand_a.x, operand_b.x),
		math.pow(operand_a.y, operand_b.y),
		math.pow(operand_a.z, operand_b.z)
	)
end

--- Performs a modulo operation on a vector with another vector.
function vector_mt.__mod(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return vector(
			operand_a % operand_b.x,
			operand_a % operand_b.y,
			operand_a % operand_b.z
		)
	end

	if (type(operand_b) == "number") then
		return vector(
			operand_a.x % operand_b,
			operand_a.y % operand_b,
			operand_a.z % operand_b
		)
	end

	return vector(
		operand_a.x % operand_b.x,
		operand_a.y % operand_b.y,
		operand_a.z % operand_b.z
	)
end

--- Perform a unary minus operation on the vector.
function vector_mt.__unm(operand_a)
	return vector(
		-operand_a.x,
		-operand_a.y,
		-operand_a.z
	)
end

--- Returns the vector's 2 dimensional length squared.
--- @return number
function vector_c:length2_squared()
	return (self.x * self.x) + (self.y * self.y);
end

--- Return's the vector's 2 dimensional length.
--- @return number
function vector_c:length2()
	return math.sqrt(self:length2_squared())
end

--- Returns the vector's 3 dimensional length squared.
--- @return number
function vector_c:length_squared()
	return (self.x * self.x) + (self.y * self.y) + (self.z * self.z);
end

--- Return's the vector's 3 dimensional length.
--- @return number
function vector_c:length()
	return math.sqrt(self:length_squared())
end

--- Returns the vector's dot product.
--- @param b vector_c
--- @return number
function vector_c:dot_product(b)
	return (self.x * b.x) + (self.y * b.y) + (self.z * b.z)
end

--- Returns the vector's cross product.
--- @param b vector_c
--- @return vector_c
function vector_c:cross_product(b)
	return vector(
		(self.y * b.z) - (self.z * b.y),
		(self.z * b.x) - (self.x * b.z),
		(self.x * b.y) - (self.y * b.x)
	)
end

--- Returns the 2 dimensional distance between the vector and another vector.
--- @param destination vector_c
--- @return number
function vector_c:distance2(destination)
	return (destination - self):length2()
end

--- Returns the 3 dimensional distance between the vector and another vector.
--- @param destination vector_c
--- @return number
function vector_c:distance(destination)
	return (destination - self):length()
end

--- Returns the distance on the X axis between the vector and another vector.
--- @param destination vector_c
--- @return number
function vector_c:distance_x(destination)
	return math.abs(self.x - destination.x)
end

--- Returns the distance on the Y axis between the vector and another vector.
--- @param destination vector_c
--- @return number
function vector_c:distance_y(destination)
	return math.abs(self.y - destination.y)
end

--- Returns the distance on the Z axis between the vector and another vector.
--- @param destination vector_c
--- @return number
function vector_c:distance_z(destination)
	return math.abs(self.z - destination.z)
end

--- Returns true if the vector is within the given distance to another vector.
--- @param destination vector_c
--- @param distance number
--- @return boolean
function vector_c:in_range(destination, distance)
	return self:distance(destination) <= distance
end

--- Clamps the vector's coordinates to whole numbers. Equivalent to "vector:round" with no precision.
--- @return void
function vector_c:round_zero()
	self.x = math.floor(self.x + 0.5)
	self.y = math.floor(self.y + 0.5)
	self.z = math.floor(self.z + 0.5)
end

--- Round the vector's coordinates.
--- @param precision number
--- @return void
function vector_c:round(precision)
	self.x = math.round(self.x, precision)
	self.y = math.round(self.y, precision)
	self.z = math.round(self.z, precision)
end

--- Clamps the vector's coordinates to the nearest base.
--- @param base number
--- @return void
function vector_c:round_base(base)
	self.x = base * math.round(self.x / base)
	self.y = base * math.round(self.y / base)
	self.z = base * math.round(self.z / base)
end

--- Clamps the vector's coordinates to whole numbers. Equivalent to "vector:round" with no precision.
--- @return vector_c
function vector_c:rounded_zero()
	return vector(
		math.floor(self.x + 0.5),
		math.floor(self.y + 0.5),
		math.floor(self.z + 0.5)
	)
end

--- Round the vector's coordinates.
--- @param precision number
--- @return vector_c
function vector_c:rounded(precision)
	return vector(
		math.round(self.x, precision),
		math.round(self.y, precision),
		math.round(self.z, precision)
	)
end

--- Clamps the vector's coordinates to the nearest base.
--- @param base number
--- @return vector_c
function vector_c:rounded_base(base)
	return vector(
		base * math.round(self.x / base),
		base * math.round(self.y / base),
		base * math.round(self.z / base)
	)
end

--- Normalize the vector.
--- @return void
function vector_c:normalize()
	local length = self:length()

	-- Prevent possible divide-by-zero errors.
	if (length ~= 0) then
		self.x = self.x / length
		self.y = self.y / length
		self.z = self.z / length
	else
		self.x = 0
		self.y = 0
		self.z = 1
	end
end

--- Returns the normalized length of a vector.
--- @return number
function vector_c:normalized_length()
	return self:length()
end

--- Returns a copy of the vector, normalized.
--- @return vector_c
function vector_c:normalized()
	local length = self:length()

	if (length ~= 0) then
		return vector(
			self.x / length,
			self.y / length,
			self.z / length
		)
	else
		return vector(0, 0, 1)
	end
end

--- Returns a new 2 dimensional vector of the original vector when mapped to the screen, or nil if the vector is off-screen.
--- @return vector_c
function vector_c:to_screen(only_within_screen_boundary)
	local x, y = renderer.world_to_screen(self.x, self.y, self.z)

	if (x == nil or y == nil) then
		return nil
	end

	if (only_within_screen_boundary == true) then
		local screen_x, screen_y = client.screen_size()

		if (x < 0 or x > screen_x or y < 0 or y > screen_y) then
			return nil
		end
	end

	return vector(x, y)
end

--- Returns the magnitude of the vector, use this to determine the speed of the vector if it's a velocity vector.
--- @return number
function vector_c:magnitude()
	return math.sqrt(
		math.pow(self.x, 2) +
			math.pow(self.y, 2) +
			math.pow(self.z, 2)
	)
end

--- Returns the angle of the vector in regards to another vector.
--- @param destination vector_c
--- @return angle_c
function vector_c:angle_to(destination)
	-- Calculate the delta of vectors.
	local delta_vector = vector(destination.x - self.x, destination.y - self.y, destination.z - self.z)

	-- Calculate the yaw.
	local yaw = math.deg(math.atan2(delta_vector.y, delta_vector.x))

	-- Calculate the pitch.
	local hyp = math.sqrt(delta_vector.x * delta_vector.x + delta_vector.y * delta_vector.y)
	local pitch = math.deg(math.atan2(-delta_vector.z, hyp))

	return angle(pitch, yaw)
end

--- Lerp to another vector.
--- @param destination vector_c
--- @param percentage number
--- @return vector_c
function vector_c:lerp(destination, percentage)
	return self + (destination - self) * percentage
end

--- Internally divide a ray.
--- @param source vector_c
--- @param destination vector_c
--- @param m number
--- @param n number
--- @return vector_c
local function vector_internal_division(source, destination, m, n)
	return vector((source.x * n + destination.x * m) / (m + n),
		(source.y * n + destination.y * m) / (m + n),
		(source.z * n + destination.z * m) / (m + n))
end

--- Returns the result of client.trace_line between two vectors.
--- @param destination vector_c
--- @param skip_entindex number
--- @return number, number|nil
function vector_c:trace_line_to(destination, skip_entindex)
	skip_entindex = skip_entindex or -1

	return client.trace_line(
		skip_entindex,
		self.x,
		self.y,
		self.z,
		destination.x,
		destination.y,
		destination.z
	)
end

--- Trace line to another vector and returns the fraction, entity, and the impact point.
--- @param destination vector_c
--- @param skip_entindex number
--- @return number, number, vector_c
function vector_c:trace_line_impact(destination, skip_entindex)
	skip_entindex = skip_entindex or -1

	local fraction, eid = client.trace_line(skip_entindex, self.x, self.y, self.z, destination.x, destination.y, destination.z)
	local impact = self:lerp(destination, fraction)

	return fraction, eid, impact
end

--- Trace line to another vector, skipping any entity indices returned by the callback and returns the fraction, entity, and the impact point.
--- @param destination vector_c
--- @param callback fun(eid: number): boolean
--- @param max_traces number
--- @return number, number, vector_c
function vector_c:trace_line_skip_indices(destination, max_traces, callback)
	max_traces = max_traces or 10

	local fraction, eid = 0, -1
	local impact = self
	local i = 0

	while (max_traces >= i and fraction < 1 and ((eid > -1 and callback(eid)) or impact == self)) do
		fraction, eid, impact = impact:trace_line_impact(destination, eid)
		i = i + 1
	end

	return self:distance(impact) / self:distance(destination), eid, impact
end

--- Traces a line from source to destination and returns the fraction, entity, and the impact point.
--- @param destination vector_c
--- @param skip_classes table
--- @param skip_distance number
--- @return number, number
function vector_c:trace_line_skip_class(destination, skip_classes, skip_distance)
	local should_skip = function(index, skip_entity)
		local class_name = entity.get_classname(index) or ""
		for i in 1, #skip_entity do
			if class_name == skip_entity[i] then
				return true
			end
		end

		return false
	end

	local angles = self:angle_to(destination)
	local direction = angles:to_forward_vector()

	local last_traced_position = self

	while true do  -- Start tracing.
		local fraction, hit_entity = last_traced_position:trace_line_to(destination)

		if fraction == 1 and hit_entity == -1 then  -- If we didn't hit anything.
			return 1, -1  -- return nothing.
		else  -- BOIS WE HIT SOMETHING.
			if should_skip(hit_entity, skip_classes) then  -- If entity should be skipped.
				-- Set last traced position according to fraction.
				last_traced_position = vector_internal_division(self, destination, fraction, 1 - fraction)

				-- Add a little gap per each trace to prevent inf loop caused by intersection.
				last_traced_position = last_traced_position + direction * skip_distance
			else  -- That's the one I want.
				return fraction, hit_entity, self:lerp(destination, fraction)
			end
		end
	end
end

--- Returns the result of client.trace_bullet between two vectors.
--- @param eid number
--- @param destination vector_c
--- @return number|nil, number
function vector_c:trace_bullet_to(destination, eid)
	return client.trace_bullet(
		eid,
		self.x,
		self.y,
		self.z,
		destination.x,
		destination.y,
		destination.z
	)
end

--- Returns the vector of the closest point along a ray.
--- @param ray_start vector_c
--- @param ray_end vector_c
--- @return vector_c
function vector_c:closest_ray_point(ray_start, ray_end)
	local to = self - ray_start
	local direction = ray_end - ray_start
	local length = direction:length()

	direction:normalize()

	local ray_along = to:dot_product(direction)

	if (ray_along < 0) then
		return ray_start
	elseif (ray_along > length) then
		return ray_end
	end

	return ray_start + direction * ray_along
end

--- Returns a point along a ray after dividing it.
--- @param ray_end vector_c
--- @param ratio number
--- @return vector_c
function vector_c:ray_divided(ray_end, ratio)
	return (self * ratio + ray_end) / (1 + ratio)
end

--- Returns a ray divided into a number of segments.
--- @param ray_end vector_c
--- @param segments number
--- @return table<number, vector_c>
function vector_c:ray_segmented(ray_end, segments)
	local points = {}

	for i = 0, segments do
		points[i] = vector_internal_division(self, ray_end, i, segments - i)
	end

	return points
end

--- Returns the best source vector and destination vector to draw a line on-screen using world-to-screen.
--- @param ray_end vector_c
--- @param total_segments number
--- @return vector_c|nil, vector_c|nil
function vector_c:ray(ray_end, total_segments)
	total_segments = total_segments or 128

	local segments = {}
	local step = self:distance(ray_end) / total_segments
	local angle = self:angle_to(ray_end)
	local direction = angle:to_forward_vector()

	for i = 1, total_segments do
		table.insert(segments, self + (direction * (step * i)))
	end

	local src_screen_position = vector(0, 0, 0)
	local dst_screen_position = vector(0, 0, 0)
	local src_in_screen = false
	local dst_in_screen = false

	for i = 1, #segments do
		src_screen_position = segments[i]:to_screen()

		if src_screen_position ~= nil then
			src_in_screen = true

			break
		end
	end

	for i = #segments, 1, -1 do
		dst_screen_position = segments[i]:to_screen()

		if dst_screen_position ~= nil then
			dst_in_screen = true

			break
		end
	end

	if src_in_screen and dst_in_screen then
		return src_screen_position, dst_screen_position
	end

	return nil
end

--- Returns true if the ray goes through a smoke. False if not.
--- @param ray_end vector_c
--- @return boolean
function vector_c:ray_intersects_smoke(ray_end)
	if (line_goes_through_smoke == nil) then
		error("Unsafe scripts must be allowed in order to use vector_c:ray_intersects_smoke")
	end

	return line_goes_through_smoke(self.x, self.y, self.z, ray_end.x, ray_end.y, ray_end.z, 1)
end

--- Returns true if the vector lies within the boundaries of a given 2D polygon. The polygon is a table of vectors. The Z axis is ignored.
--- @param polygon table<any, vector_c>
--- @return boolean
function vector_c:inside_polygon2(polygon)
	local odd_nodes = false
	local polygon_vertices = #polygon
	local j = polygon_vertices

	for i = 1, polygon_vertices do
		if (polygon[i].y < self.y and polygon[j].y >= self.y or polygon[j].y < self.y and polygon[i].y >= self.y) then
			if (polygon[i].x + (self.y - polygon[i].y) / (polygon[j].y - polygon[i].y) * (polygon[j].x - polygon[i].x) < self.x) then
				odd_nodes = not odd_nodes
			end
		end

		j = i
	end

	return odd_nodes
end

local resolver_c = {}
local resolver_mt = {
    __index = resolver_c
}

local x = 0

function resolver_c.setup()
    return setmetatable( {
        miss_reason = {},
        entity_data = {},
        animstate_data = {},
        animlayer_data = {},
        freestand_data = {},
		misses = 0,
		hit = 0,
		shots = 0,
    }, resolver_mt )
end

function resolver_c:reset()

    self.miss_reason = {}
    self.entity_data = {}
    self.animstate_data = {}
    self.animlayer_data = {}
    self.freestand_data = {}

end

function resolver_c:GetAnimationState(_Entity)
    if not (_Entity) then
        return
    end
    local player_ptr = ffi.cast( "void***", get_client_entity(ientitylist, _Entity))
    local animstate_ptr = ffi.cast( "char*" , player_ptr ) + 0x3914
    local state = ffi.cast( "struct c_animstate**", animstate_ptr )[0]

    return state
end

function GetAnimationState1(_Entity)
    if not (_Entity) then
        return
    end
    local player_ptr = ffi.cast( "void***", get_client_entity(ientitylist, _Entity))
    local animstate_ptr = ffi.cast( "char*" , player_ptr ) + 0x3914
    local state = ffi.cast( "struct c_animstate**", animstate_ptr )[0]

    return state
end

function GetPlayerMaxFeetYaw1(_Entity)
    local S_animationState_t = GetAnimationState1(_Entity)
    local nDuckAmount = S_animationState_t.m_fDuckAmount
    local nFeetSpeedForwardsOrSideWays = math.max(0, math.min(1, S_animationState_t.m_flFeetSpeedForwardsOrSideWays))
    local nFeetSpeedUnknownForwardOrSideways = math.max(1, S_animationState_t.m_flFeetSpeedUnknownForwardOrSideways)
    local nValue =
        (S_animationState_t.m_flStopToFullRunningFraction * -0.30000001 - 0.19999999) * nFeetSpeedForwardsOrSideWays +
        1
    if nDuckAmount > 0 then
        nValue = nValue + nDuckAmount * nFeetSpeedUnknownForwardOrSideways * (0.5 - nValue)
    end
    local nDeltaYaw = S_animationState_t.m_flMaxYaw * nValue
    return nDeltaYaw < 60 and nDeltaYaw >= 0 and nDeltaYaw or 0
end

function resolver_c:GetPlayerMaxFeetYaw(_Entity)
    local S_animationState_t = self:GetAnimationState(_Entity)
    local nDuckAmount = S_animationState_t.m_fDuckAmount
    local nFeetSpeedForwardsOrSideWays = math.max(0, math.min(1, S_animationState_t.m_flFeetSpeedForwardsOrSideWays))
    local nFeetSpeedUnknownForwardOrSideways = math.max(1, S_animationState_t.m_flFeetSpeedUnknownForwardOrSideways)
    local nValue =
        (S_animationState_t.m_flStopToFullRunningFraction * -0.30000001 - 0.19999999) * nFeetSpeedForwardsOrSideWays +
        1
    if nDuckAmount > 0 then
        nValue = nValue + nDuckAmount * nFeetSpeedUnknownForwardOrSideways * (0.5 - nValue)
    end
    local nDeltaYaw = S_animationState_t.m_flMaxYaw * nValue
    return nDeltaYaw < 60 and nDeltaYaw >= 0 and nDeltaYaw or 0
end

function resolver_c:on_miss(handle)
	local hitgroup_names = {
		"generic",
		"head",
		"chest",
		"stomach",
		"left arm",
		"right arm",
		"left leg",
		"right leg",
		"neck",
		"gear",
	}--hitgroup_names[e.hitgroup + 1] or "?"
    if handle.reason ~= "?" then 
        return
	end
	
	self.misses = self.misses + 1

    if not self.entity_data[handle.target] then
        self.entity_data[handle.target] = {}
    end

    if not self.miss_reason[handle.target] then 
        self.miss_reason[handle.target] = {}
    end

    local miss_count = self.entity_data[handle.target].miss or 0

    self.entity_data[handle.target].miss = miss_count + 1

    local miss_data = handle

    local ent_name = entity.get_player_name(handle.target)

    miss_data.name = ent_name

    local yaw = (entity.get_prop(handle.target, "m_flPoseParameter", 11) or 0) * 116 - 58

    local should_fix = self.entity_data[handle.target].miss > 2 and self.entity_data[handle.target].miss < 5

    self.miss_reason[handle.target].count = self.entity_data[handle.target].miss
    self.miss_reason[handle.target].reason = self.entity_data[handle.target].miss > 2 and (string.format("lowdelta: %s", yaw) or "?") or "?"

    local fix_value = 26*(self.entity_data[handle.target].miss % 2 == 0 and -1 or 1)
end

function resolver_c:on_hit(handle)
	self.hit = self.hit + 1
end

function resolver_c:on_fire(handle)
	self.shots = self.shots + 1
end

		bruteforce_phases = {
            -- Standing players
            standing = {
                [1] = -50,
				[2] = 50,
				[3] = 30,
				[4] = 0
			},
			moving = {
				[1] = 48,
				[2] = -48,
				[3] = -29,
				[4] = 0
			},
			slowwalk = {
                [1] = 48,
				[2] = 30,
				[3] = -15,
				[4] = 0
			},
			pressing_e = {
				[1] = 50,
				[2] = -48,
				[3] = 48,
				[4] = 0,
			},
			onshot = {
				[1] = 60,
				[2] = -60,
				[3] = 0,
			},
        }



		
		--standing
		if standing then
			fix_value = bruteforce_phases.standing[calculate_phase]*calculate_invert*calculate_angles
			state = "standing"
		end
		--moving
		if moving then
			fix_value = bruteforce_phases.moving[calculate_phase]*calculate_invert*calculate_angles
			state = "moving"
		end
		--slowwalk
		if slowwalk then
			fix_value = bruteforce_phases.slowwalk[calculate_phase]
			state = "slowwalk"
		end
		--in air
		if air then
			fix_value = bruteforce_phases.air[calculate_phase]*calculate_invert*calculate_angles
			state = "in air"
		end
		--e peek
		if pressing_e then
			fix_value = bruteforce_phases.pressing_e[calculate_phase]*calculate_invert*calculate_angles
			state = "e"
		end
		--e peek
		if onshot then
			fix_value = bruteforce_phases.onshot[calculate_phase]*calculate_invert*calculate_angles
			state = "fired"
		end
		--forward
		if sideways_forward then
			fix_value = (max_yaw/2 + (max_yaw/4))*calculate_invert*calculate_angles*(-2)
			state = "forward"
		end
		--sideways
		if sideways_left_right then
			fix_value = (max_yaw/2 - 4)*calculate_invert*calculate_angles
			state = "left/right"
		end





client.add_callback("create_move", kripsaa)
client.add_callback("create_move", a)
client.add_callback("create_move", l)
client.add_callback("create_move", cu)
end
--
