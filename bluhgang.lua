local images = require('gamesense/images') or error('images library not found', 2)
local http = require('gamesense/http') or error('http library not found', 2)

local legs_ref = ui.reference('AA', 'Other', 'Leg movement')
DT_ref,DT_ref_key = ui.reference('RAGE', 'Other', 'Double tap')
onshotaa_ref,onshotaa_ref_key = ui.reference('AA', 'Other', 'On shot anti-aim')
qp_ref,qp_ref_key = ui.reference('rage', 'Other', 'quick peek assist')

local bluhganglua = ui.new_label('lua', 'b', '=====================================================================')
local torretoyaw = ui.new_checkbox('lua', 'b', 'TORRETO')
local muslimowned = ui.new_checkbox('lua', 'b', 'BEST DAMAGE LOGS EVER')
local xantares_legs = ui.new_checkbox('lua', 'b', 'XANTARES LEGS KS OMK')
local best_indicators_mad = ui.new_checkbox('lua', 'b', 'BEST INDICATORS UMAD?')
local increase_speed = ui.new_checkbox("lua", "b", "XANTARES TAP")
local increase_speed_mode = ui.new_combobox("lua", "b", "XANTARES TAP MODE", {"PASSIVE", "AGRESSIVE"})
local aimwarebeta_indicator = ui.new_checkbox('lua', 'b', 'AIMWARE BETA EXTRA FEATURE')
local bluhganglua2 = ui.new_label('lua', 'b', '=======================================================================')

function old_legs()
    if not ui.get(xantares_legs) then return end
    local p = client.random_int(1, 3)
    if p == 1 then
        ui.set(legs_ref, 'Off')
    elseif p == 2 then
        ui.set(legs_ref, 'Always slide')
    elseif p == 3 then
        ui.set(legs_ref, 'Off')
    end
end

	
picurl = 'https://i.imgur.com/ZBtQUMX.png'
local image 
http.get(picurl, function(s, r)
    if s and r.status == 200 then
        image = images.load(r.body)
    else
        error("Failed to load: " .. response.status_message)
    end
end)

local image2 
http.get('https://i.imgur.com/Rm0CaPS.png', function(s, r)
    if s and r.status == 200 then
        image2 = images.load(r.body)
    else
        error("Failed to load: " .. response.status_message)
    end
end)

local image3
http.get('https://i.imgur.com/VNGNDjn.jpg', function(s, r)
    if s and r.status == 200 then
        image3 = images.load(r.body)
    else
        error("Failed to load: " .. response.status_message)
    end
end)

client.register_esp_flag("MUSLIM KID", 255, 255, 255, function(c)
    return ui.get(aimwarebeta_indicator)
end)

local function is_dt()

	local dt = false

	local screen_size = { client.screen_size() }
	local sx, sy = screen_size[1] / 2, screen_size[2] / 2

	local local_player = entity.get_local_player()

	if local_player == nil then
		return
	end

	if not entity.is_alive(local_player) then
		return
	end

	local active_weapon = entity.get_prop(local_player, 'm_hActiveWeapon')

	if active_weapon == nil then
		return
	end

	nextAttack = entity.get_prop(local_player,'m_flNextAttack')
	nextShot = entity.get_prop(active_weapon,'m_flNextPrimaryAttack')
	nextShotSecondary = entity.get_prop(active_weapon,'m_flNextSecondaryAttack')

	if nextAttack == nil or nextShot == nil or nextShotSecondary == nil then
		return
	end

	nextAttack = nextAttack + 0.5
	nextShot = nextShot + 0.5
	nextShotSecondary = nextShotSecondary + 0.5


	if ui.get(DT_ref) and ui.get(DT_ref_key) then
		if math.max(nextShot,nextShotSecondary) < nextAttack then -- swapping
			if nextAttack - globals.curtime() > 0.00 then
				dt = false 
			else
				dt = true 
			end
		else 
			if math.max(nextShot,nextShotSecondary) - globals.curtime() > 0.00  then
				dt = false 
			else
				if math.max(nextShot,nextShotSecondary) - globals.curtime() < 0.00  then
					dt = true 
				else
					dt = true 
				end
			end
		end
	end

	return dt
end

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

local function best_indicators()
    if entity.get_prop(entity.get_local_player(),'m_lifeState') ~= 0 or not entity.get_local_player() then return end
    if not ui.get(best_indicators_mad) then return end
    local a = math.floor(math.sin(globals.realtime() * 5 + 4) * 127 + 128) 
    bobali_bobali = 'BLUHGANG' bobali_bobali2 = 0 bobali_bobali3 = 0 bobali_bobali4 = 'DT MUSLIM CRY' bobali_bobali5 = 'XANTARES PEEK' bobali_bobali6 = 'HS DOGS CANT HIT'

    local width, height = client.screen_size()
	local center_width = width/2
	local center_height = height/2

    local x, y = client.screen_size()

    x,y = x / 2 + 1, y - 155
    local get_gc_state = panorama.loadstring([[ return MyPersonaAPI.IsConnectedToGC() ]])

    undertext = 'BLUHGANG  |  ' .. username .. '  |  TOP1 SCRIPT IN THE WORLD'

    local sp_x = x
    local sp_y = y
    local cn = 1

    local local_player = entity.get_local_player()
    local body_yaw = math.max(-60, math.min(60, round((entity.get_prop(local_player, 'm_flPoseParameter', 11) or 0)*120-60+0.5, 0)))
	body_yaw = (body_yaw < 1 and body_yaw > 0.0001) and math.floor(body_yaw, 1) or body_yaw
	local abs_yaw = math.abs(body_yaw)

  if not get_gc_state then  renderer.text(sp_x, sp_y + 130*cn, 255, 11, 11, a*255, 'c-', 0, 'MUSLIM KIDS RAGED GG') else renderer.text(sp_x, sp_y + 130*cn, 144, 255, 11, a*255, 'c-', 0, 'MUSLIM KIDS CRY') end
  renderer.text(sp_x, sp_y + 120*cn, 255, 255, 255, 255, 'c-', 0, '$   BLUHGANG   $')
    renderer.text(sp_x, sp_y + 140*cn, 255, 255, 255, 255, 'c-', 0, undertext)
    renderer.text(center_width, center_height+30, 255, 255, 255, 255, 'c-', 0, body_yaw)
    renderer.text(center_width, center_height+40, 255, 255, 255, 255, 'c-', 0, bobali_bobali)

    if ui.get(DT_ref) and ui.get(DT_ref_key) then 
        if ui.get(qp_ref) and ui.get(qp_ref_key) then
            renderer.text(center_width, center_height+50, 144, 255, 11, 255, 'c-', 0, bobali_bobali5)
        else
            if is_dt() then
                renderer.text(center_width, center_height+50, 144, 255, 11, 255, 'c-', 0, bobali_bobali4)
            else
                renderer.text(center_width, center_height+50, 255, 11, 11, 255, 'c-', 0, bobali_bobali4)
            end
        end
        elseif ui.get(onshotaa_ref) and ui.get(onshotaa_ref_key) then
            renderer.text(center_width, center_height+50, 144, 255, 11, a*255, 'c-', 0, bobali_bobali6)
        end
end

local double_tap_mode = ui.reference("RAGE", "Other", "Double tap mode")
local double_tap_fake_lag_limit = ui.reference("RAGE", "Other", "Double tap fake lag limit")
local fake_lag = ui.reference("AA", "Fake lag", "Limit")
local sv_maxusrcmdprocessticks = ui.reference("MISC", "Settings", "sv_maxusrcmdprocessticks")

ui.set_visible(sv_maxusrcmdprocessticks, true)

local function do_shit()
	ui.set(fake_lag, math.min(14, ui.get(fake_lag)))

	if ui.get(increase_speed) then
		ui.set(DT_ref, true)
		ui.set(double_tap_fake_lag_limit, 1)
		ui.set(double_tap_mode, "Defensive")
		
		if ui.get(increase_speed_mode) == "AGRESSIVE" then
			ui.set(sv_maxusrcmdprocessticks, 18)
			cvar.cl_clock_correction:set_int(0)
			return
		end
	end
	
	ui.set(sv_maxusrcmdprocessticks, 16)
	cvar.cl_clock_correction:set_int(1)
end

ui.set_callback(increase_speed, do_shit)
ui.set_callback(increase_speed_mode, do_shit)
ui.set_callback(fake_lag, do_shit)

client.set_event_callback("shutdown", function()
	ui.set(increase_speed, false)
	do_shit()
end)

local hwids = {
	['POISON'] = 'ja5774842jm343879471a7252529R69605012RV38794711i4060545Q4643484q5M',
	['KORPER'] = 'Pre54872034f5695397yYVwz4026840MJ6TcrdpzN9',
	['KIM'] = 'jDHvu898359g866959bNEme8cNb91023053I1222749xFb',
	['LEWIS'] = 'OB07t2155372NsQ18352843NAix4QNuxP1495776L9',
    ['MISAN'] = 'Oka12l985361gtCblXPngG1311547Ve1795553qCV'
}


local scrw = nil
local scrh = nil
local crhdisplay = {}
local crhdisplay1 = {}
local hitgroups = { 'generic body', 'head', 'chest', 'stomach', 'left arm', 'right arm', 'left leg', 'right leg', 'neck', '?', 'gear' }

local addCrh = function (obj)
table.insert(crhdisplay, obj)
end

local addCrh1 = function (obj1)
	table.insert(crhdisplay1, obj1)
	end


local function player_hurt(d)

if ui.get(muslimowned) then
	if client.userid_to_entindex(d.attacker) == entity.get_local_player() then
		addCrh({
			['time'] = globals.realtime(),
			['type'] = 'dealt',
			['damage'] = d.dmg_health,
			['target'] = entity.get_player_name(client.userid_to_entindex(d.userid)),
			['attacker'] = entity.get_player_name(client.userid_to_entindex(d.attacker)),
			['hp'] = d.health,
			['reason'] = nil,
			['hitgroup'] = hitgroups[d.hitgroup + 1] or '?',
			['remaining'] = d.health
		})
end
end
end


local function on_paint_events()
	scrw, scrh = client.screen_size()
	for index,value in ipairs(crhdisplay) do
	if globals.realtime() > value['time']+6 then
		table.remove( crhdisplay, index )
		return
	end

	local w, h = client.screen_size()
	local frames = 8 * globals.frametime()

	local text = ''
	local text2 = ''
	local flags = nil
	if ui.get(muslimowned) then
		text = value['target'] .. ' ' .. value['hitgroup'] .. ' -' .. value['damage'] .. '' .. ' (' .. value['remaining'] .. ')' 
		end

		local clr = {}

		if value['remaining'] > 0 then clr = {255,255,255} else clr = {255,11,11} end

		renderer.text(w/2, h/2+index*15 + 50, clr[1], clr[2], clr[3], 255, 'dc', 0, text)

	end
end

local notify = (function()
    notify = {callback_registered = false, maximum_count = 7, data = {}, svg_texture = [[<svg id='Capa_1' enable-background='new 0 0 512 512' height='512' viewBox='0 0 512 512' width='512' xmlns='http://www.w3.org/2000/svg'><g><g><path d='m216.188 82.318h48.768v37.149h-48.768z' fill='#ffcbbe'/></g><g><path d='m250.992 82.318h13.964v37.149h-13.964z' fill='#fdad9d'/></g><g><ellipse cx='240.572' cy='47.717' fill='#ffcbbe' rx='41.682' ry='49.166' transform='matrix(.89 -.456 .456 .89 4.732 115.032)'/></g><g><path d='m277.661 28.697c-10.828-21.115-32.546-32.231-51.522-27.689 10.933 4.421 20.864 13.29 27.138 25.524 12.39 24.162 5.829 52.265-14.654 62.769-2.583 1.325-5.264 2.304-8.003 2.96 10.661 4.31 22.274 4.391 32.387-.795 20.483-10.504 27.044-38.607 14.654-62.769z' fill='#fdad9d'/></g><g><path d='m296.072 296.122h-111.001v-144.174c0-22.184 17.984-40.168 40.168-40.168h30.666c22.184 0 40.168 17.984 40.168 40.168v144.174z' fill='#95d6a4'/></g><g><path d='m256.097 111.78h-24.384c22.077 0 39.975 17.897 39.975 39.975v144.367h24.384v-144.367c0-22.077-17.897-39.975-39.975-39.975z' fill='#78c2a4'/></g><g><path d='m225.476 41.375c0-8.811 7.143-15.954 15.954-15.954h34.401c-13.036-21.859-38.163-31.469-57.694-21.453-19.846 10.177-26.623 36.875-15.756 60.503 12.755-.001 23.095-10.341 23.095-23.096z' fill='#756e78'/></g><g><path d='m252.677 25.421h23.155c-11.31-18.964-31.718-28.699-49.679-24.408 10.591 4.287 20.23 12.757 26.524 24.408z' fill='#665e66'/></g><g><path d='m444.759 453.15-28.194-9.144c-3.04-.986-5.099-3.818-5.099-7.014v-4.69l-2.986-8.22h-61.669l-2.986 8.22v34.22c0 8.628 6.994 15.622 15.622 15.622h81.993c5.94 0 10.755-4.815 10.755-10.755v-8.008c.001-4.662-3.002-8.793-7.436-10.231z' fill='#aa7a63'/></g><g><path d='m444.759 453.15-28.194-9.144c-3.04-.986-5.099-3.818-5.099-7.014v-4.69l-2.986-8.22h-25.91v12.911c0 3.196 2.059 6.028 5.099 7.014l28.194 9.144c4.434 1.438 7.437 5.569 7.437 10.23v8.008c0 5.94-4.815 10.755-10.755 10.755h28.896c5.94 0 10.755-4.815 10.755-10.755v-8.008c0-4.662-3.003-8.793-7.437-10.231z' fill='#986b54'/></g><g><path d='m343.827 344.798v87.505h67.64v-123.053c0-20.65-16.74-37.39-37.39-37.39h-189.006v33.212c0 19.014 15.414 34.428 34.428 34.428h119.03c2.926 0 5.298 2.372 5.298 5.298z' fill='#5766cb'/></g><g><path d='m382.571 309.25v123.052h28.896v-123.052c0-20.65-16.74-37.39-37.39-37.39h-28.896c20.65 0 37.39 16.74 37.39 37.39z' fill='#3d4fc3'/></g><g><g><path d='m437.268 512h-108.548c-8.244 0-14.928-6.684-14.928-14.928v-107.221c0-11.247-9.15-20.399-20.398-20.399h-123.543c-8.244 0-14.928-6.684-14.928-14.928v-150.17h-22.748c-8.244 0-14.928-6.684-14.928-14.928s6.684-14.928 14.928-14.928h37.676c8.244 0 14.928 6.684 14.928 14.928v150.17h108.616c27.71 0 50.254 22.545 50.254 50.255v92.293h93.619c8.244 0 14.928 6.684 14.928 14.928s-6.684 14.928-14.928 14.928z' fill='#756e78'/></g></g><g><g><path d='m437.268 482.144h-15.115c8.244 0 14.928 6.684 14.928 14.928s-6.683 14.928-14.928 14.928h15.115c8.244 0 14.928-6.684 14.928-14.928s-6.684-14.928-14.928-14.928z' fill='#665e66'/></g><g><path d='m328.534 389.851v83.296c0 4.969 4.028 8.997 8.997 8.997h6.118v-92.293c0-27.755-22.5-50.255-50.255-50.255h-15.114c27.71 0 50.254 22.545 50.254 50.255z' fill='#665e66'/></g><g><path d='m169.664 189.426v150.17h15.115v-150.17c0-8.244-6.684-14.928-14.928-14.928h-15.115c8.245 0 14.928 6.684 14.928 14.928z' fill='#665e66'/></g></g><g><g><path d='m171.702 511.498c-61.701 0-111.898-50.197-111.898-111.898s50.197-111.898 111.898-111.898 111.898 50.197 111.898 111.898-50.197 111.898-111.898 111.898zm0-193.94c-45.238 0-82.042 36.804-82.042 82.042s36.804 82.042 82.042 82.042 82.042-36.804 82.042-82.042-36.804-82.042-82.042-82.042z' fill='#756e78'/></g></g><g><g><path d='m243.485 313.833c16.3 19.444 26.131 44.485 26.131 71.783 0 61.701-50.197 111.898-111.898 111.898-27.298 0-52.339-9.831-71.783-26.131 20.543 24.504 51.364 40.115 85.767 40.115 61.701 0 111.898-50.197 111.898-111.898 0-34.403-15.61-65.225-40.115-85.767z' fill='#665e66'/></g></g><g><path d='m384.583 259.81 13.927 12.767c8.319 7.626 13.447 18.117 14.353 29.366l.509 6.316c.283 3.513-3.591 5.82-6.545 3.898l-45.845-29.834z' fill='#ffcbbe'/></g><g><path d='m413.372 308.259-.509-6.316c-.906-11.249-6.034-21.74-14.353-29.366l-13.927-12.767-7.744 7.387 5.869 5.38c8.319 7.626 13.447 18.117 14.353 29.366l.328 4.072 9.438 6.142c2.954 1.921 6.828-.386 6.545-3.898z' fill='#fdad9d'/></g><g><g><path d='m366.869 290.965c-1.448 1.448-3.783 1.589-5.341.26-8.038-6.857-18.146-10.594-28.827-10.594h-69.416c-31.072 0-56.26-25.188-56.26-56.26v-63.312c0-12.367 10.025-22.392 22.392-22.392 12.367 0 22.392 10.025 22.392 22.392v63.312c0 6.338 5.138 11.476 11.476 11.476h69.415c22.462 0 43.657 8.238 60.136 23.284 1.672 1.526 1.716 4.151.115 5.752z' fill='#95d6a4'/></g></g><g><path d='m392.836 259.13c-16.479-15.047-37.674-23.284-60.136-23.284h-69.416c-6.338 0-11.476-5.138-11.476-11.476v-63.312c0-12.367-10.025-22.392-22.392-22.392-3.429 0-6.676.773-9.581 2.151 5.315 4.094 8.743 10.518 8.743 17.746v74.508c0 6.338 5.138 11.476 11.476 11.476h69.416c22.462 0 43.657 8.238 60.136 23.284 1.672 1.526 1.716 4.151.115 5.752l-13.663 13.663c1.907 1.181 3.739 2.503 5.469 3.979 1.558 1.329 3.893 1.188 5.341-.26l26.082-26.082c1.602-1.602 1.558-4.226-.114-5.753z' fill='#78c2a4'/></g></g></svg>
]]}
    local svg_size = { w = 20, h = 20}
    local svg = renderer.load_svg(notify.svg_texture, svg_size.w, svg_size.h)
    function notify:register_callback()
        if self.callback_registered then return end
        client.set_event_callback('paint_ui', function()
            local screen = {client.screen_size()}
            local color = {15, 15, 15}
            local d = 5;
            local data = self.data;
            for f = #data, 1, -1 do
                data[f].time = data[f].time - globals.frametime()
                local alpha, h = 255, 0;
                local _data = data[f]
                if _data.time < 0 then
                    table.remove(data, f)
                else
                    local time_diff = _data.def_time - _data.time;
                    local time_diff = time_diff > 1 and 1 or time_diff;
                    if _data.time < 0.5 or time_diff < 0.5 then
                        h = (time_diff < 1 and time_diff or _data.time) / 0.5;
                        alpha = h * 255;
                        if h < 0.2 then
                            d = d + 15 * (1.0 - h / 0.2)
                        end
                    end
                    local text_data = {renderer.measure_text('dc', _data.draw)}
                    local screen_data = {
                        screen[1] / 2 - text_data[1] / 2 + 3, screen[2] - screen[2] / 100 * 17.4 + d
                    }
                    renderer.rectangle(screen_data[1] - 30, screen_data[2] - 22, text_data[1] + 60, 2, 83, 126, 242, alpha)
                    renderer.rectangle(screen_data[1] - 29, screen_data[2] - 20, text_data[1] + 58, 29, color[1], color[2],color[3], alpha <= 135 and alpha or 135)
                    renderer.line(screen_data[1] - 30, screen_data[2] - 22, screen_data[1] - 30, screen_data[2] - 20 + 30, 83, 126, 242, alpha <= 50 and alpha or 50)
                    renderer.line(screen_data[1] - 30 + text_data[1] + 60, screen_data[2] - 22, screen_data[1] - 30 + text_data[1] + 60, screen_data[2] - 20 + 30, 83, 126, 242, alpha <= 50 and alpha or 50)
                    renderer.line(screen_data[1] - 30, screen_data[2] - 20 + 30, screen_data[1] - 30 + text_data[1] + 60, screen_data[2] - 20 + 30, 83, 126, 242, alpha <= 50 and alpha or 50)
                    renderer.text(screen_data[1] + text_data[1] / 2 + 10, screen_data[2] - 5, 255, 255, 255, alpha, 'dc', nil, _data.draw)
                    renderer.texture(svg, screen_data[1] - svg_size.w/2 - 5, screen_data[2] - svg_size.h/2 - 5, svg_size.w, svg_size.h, 255, 255, 255, alpha)
                    d = d - 50
                end
            end
            self.callback_registered = true
        end)
    end
    function notify:paint(time, text)
        local timer = tonumber(time) + 1;
        for f = self.maximum_count, 2, -1 do
            self.data[f] = self.data[f - 1]
        end
        self.data[1] = {time = timer, def_time = timer, draw = text}
        self:register_callback()
    end
    return notify
end)()

 GetHWID = function()
    local hwid_database = database.read('bluhcord') or { value = nil }
    if hwid_database.value == nil then
        local sid = client.random_int(1000000, 9999999)
        local charset = {}  do -- [0-9a-zA-Z]
            for c = 48, 57  do table.insert(charset, string.char(c)) end
            for c = 65, 90  do table.insert(charset, string.char(c)) end
            for c = 97, 122 do table.insert(charset, string.char(c)) end
            for c = 6, 17 do table.insert(charset, client.random_int(sid - client.random_int(sid - 2, sid * 0.5), sid -1)) end
        end
        local function randomString(length)
            if not length or length <= 0 then return '' end
            return randomString(length - 1) .. charset[client.random_int(1, #charset)]
        end
        hwid_database.value = randomString(24)
        database.write('bluhcord', hwid_database)
    end

    return hwid_database.value
end


 hwid = GetHWID()
for k, v in pairs(hwids) do
    if v == hwid then 
		username = k
		hwidz = v
	end
end

local activehwid = false

for k, v in pairs(hwids) do
    if v == hwid then 
        activehwid = true
		
    end
end

if activehwid == false then
    error('' .. hwid, 2)	
end

--[[client.delay_call(1, function()

	notify:paint(5, data)
end)

client.delay_call(2, function()
        notify:paint(5, data1) 
end)--]]


client.set_event_callback('net_update_end', function()
  
        if ui.get(xantares_legs) then
            entity.set_prop(entity.get_local_player(), 'm_flPoseParameter', 1, 0)
        end
end)


client.set_event_callback('pre_render', function()

    if ui.get(xantares_legs) then
		entity.set_prop(entity.get_local_player(), 'm_flPoseParameter', 1, 6)
    end
end)
notes = (function(b)local c=function(d,e)local f={}for g in pairs(d)do table.insert(f,g)end;table.sort(f,e)local h=0;local i=function()h=h+1;if f[h]==nil then return nil else return f[h],d[f[h]]end end;return i end;local j={get=function(k)local l,m=0,{}for n,o in c(package.cnotes)do if o==true then l=l+1;m[#m+1]={n,l}end end;for p=1,#m do if m[p][1]==b then return k(m[p][2]-1)end end end,set_state=function(q)package.cnotes[b]=q;table.sort(package.cnotes)end,unset=function()client.unset_event_callback('shutdown',callback)end}client.set_event_callback('shutdown',function()if package.cnotes[b]~=nil then package.cnotes[b]=nil end end)if package.cnotes==nil then package.cnotes={}end;return j end)('a_watermark')
client.set_event_callback('paint_ui', GetHWID)
client.set_event_callback('player_hurt', player_hurt)
client.set_event_callback('paint_ui', function()
    old_legs()
    best_indicators()
    on_paint_events()

	notes.set_state(ui.get(torretoyaw))
    notes.get(function(id)

		text =  ''

		local h, w = 18, renderer.measure_text(nil, text) + 8
		local x, y = client.screen_size() - 120, 10 + (25*id)
 
		   x = x - w - 10

		   renderer.text(x+110, y + 6, 255, 255, 255, 255, '', 0, text)
            
		   if image ~= nil then
			image:draw(x+75, y-10, nil, 72)
			end
            
            local mx, my = ui.menu_position()
		    local mw, mh = ui.menu_size()

            if ui.is_menu_open() then
                if image2 ~= nil then
                    image2:draw(mx+mw, my + 200, nil, 168)
                end

                if image3 ~= nil then
                    image3:draw(mx - 100, my + 200, nil, 168)
                end
            end
	end)
end)