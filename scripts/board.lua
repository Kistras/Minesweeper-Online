local M = {}

local E_CLEAR = 1
local E_MINE = 2

local function initialize_board(x_size, y_size, mines, tilemap_url)
	local tbl = {
		x_size = x_size,
		y_size = y_size,
		mines = mines,
		tilemap = tilemap_url
	}
	for x = 1, x_size do
		tbl[x] = {}
		for y = 1, y_size do
			tbl[x][y] = {
				type = E_CLEAR,
				open = false,
				display = 10 -- Unlocked tile
			}
		end
	end
	return tbl
end

local function place_mines(tbl, x_size, y_size, mines)
	local total_cells = x_size * y_size
	if mines > total_cells then
		error("Number of mines exceeds the number of cells")
	end

	local cells = {}
	for x = 1, x_size do
		for y = 1, y_size do
			table.insert(cells, {x = x, y = y})
		end
	end

	for i = total_cells, 2, -1 do
		local j = math.random(1, i)
		cells[i], cells[j] = cells[j], cells[i]
	end

	for i = 1, mines do
		local cell = cells[i]
		tbl[cell.x][cell.y]["type"] = E_MINE
		tbl[cell.x][cell.y]["display"] = 11 -- Mine
		end
end

local function add_numbers(tbl, x_size, y_size)
	for x = 1, x_size do
		for y = 1, y_size do
			if tbl[x][y]["type"] == E_CLEAR then
				local mine_counter = 0
				for dx = -1, 1 do
					for dy = -1, 1 do
						local fx = x + dx
						local fy = y + dy
						if fx > 0 and fx <= x_size and fy > 0 and fy <= y_size and tbl[fx][fy]["type"] == E_MINE then
							mine_counter = mine_counter + 1
						end
					end
				end
				if mine_counter > 0 then
					tbl[x][y]["display"] = mine_counter
				end
			end
		end
	end
end

function M.generate_board(x_size, y_size, mines, tilemap_url)
	local tbl = initialize_board(x_size, y_size, mines, tilemap_url)
	place_mines(tbl, x_size, y_size, mines)
	add_numbers(tbl, x_size, y_size)
	return tbl
end

function M.draw_board(board)
	for x = 1, board["x_size"] do
		for y = 1, board["y_size"] do
			tilemap.set_tile(board["tilemap"], "1", x, y, board[x][y]["open"] and board[x][y]["display"] or 9)
		end
	end
end

local function update_tiles(board, tiles)
	for x, yval in pairs(tiles) do
		for y, val in pairs(yval) do
			tilemap.set_tile(board["tilemap"], "1", x, y, board[x][y]["open"] and board[x][y]["display"] or 9)
		end
	end
end

function M.click_board(board, nx, ny, combo)
	local score = 0
	local combo_broken = false
	if not board[nx] or not board[nx][ny] then return {score=0, combo_broken=false} end
	if board[nx][ny]["open"] then return {score=0, combo_broken=false} end

	local tiles = {}
	tiles[nx] = {}
	tiles[nx][ny] = true
	local tiles_to_update = {{nx, ny}}
	while #tiles_to_update > 0 do
		local new_tiles_to_update = {}
		for key, tile in pairs(tiles_to_update) do
			local x = tile[1]
			local y = tile[2]

			if not board[x][y]["open"] then
				board[x][y]["open"] = true
				if board[x][y]["type"] == E_CLEAR then
					score = score + 2^combo
				elseif board[x][y]["type"] == E_MINE then
					score = score - math.max(1, 2^(combo-1))
					combo_broken = true
				end

				if board[x][y]["display"] == 10 then -- Unlocked tile
					for dx = -1, 1 do
						for dy = -1, 1 do
							local fx = x + dx
							local fy = y + dy
							if fx > 0 and fx <= board["x_size"] and fy > 0 and fy <= board["y_size"] -- Is inbounds
							and (tiles[fx] == nil or tiles[fx][fy] == nil) and not board[fx][fy]["open"] then
								if not tiles[fx] then tiles[fx] = {} end
								tiles[fx][fy] = true
								table.insert(new_tiles_to_update, {fx, fy})
							end
						end
					end
				end
			end
		end
		tiles_to_update = new_tiles_to_update
	end
	update_tiles(board, tiles)
	return {score=score, combo_broken=combo_broken or score == 0}
end

return M
