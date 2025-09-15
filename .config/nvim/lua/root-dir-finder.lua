local path_lua = require("path")
local RootDirFinder = { cond = false, may_contain_f = false, t = {}, f = {} }

function RootDirFinder:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function RootDirFinder:check_cond_file_t()
	local cond = false
	local next_f, t, cur_key = pairs(self.t)
	local cur_val = nil
	repeat
		cur_key, cur_val = next_f(t, cur_key)
		cond = cond or (path_lua.exists(cur_val or "") and path_lua.isfile(cur_val or ""))
	until cond == true or cur_key == nil
	return cond
end

function RootDirFinder:check_cond_file_f()
	local cond = false
	local next_f, t, cur_key = pairs(self.f)
	local cur_val = nil
	repeat
		cur_key, cur_val = next_f(t, cur_key)
		cond = cond or (path_lua.exists(cur_val or "") and path_lua.isfile(cur_val or ""))
	until cond == true or cur_key == nil
	return cond
end

function RootDirFinder:find_root_dir(dir)
	local sanitized_dir = dir or ""
	if not path_lua.isdir(sanitized_dir) then
		return nil
	end
	if path_lua.chdir(sanitized_dir) == nil then
		return nil
	end
	local file_t = self:check_cond_file_t()
	local file_f = self:check_cond_file_f()
	self.file_t = file_t
	self.file_f = file_f
	if file_f and not file_t then
		return nil
	elseif file_t and (self.may_contain_f or not file_f) then
		return sanitized_dir
	end
	if sanitized_dir ~= "/" and path_lua.chdir(sanitized_dir .. "/" .. "..") then
		return self:find_root_dir(path_lua.currentdir())
	end
	return nil
end

return RootDirFinder
