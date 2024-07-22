-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

-- Make a stateful module
local game_state = {}
local X = "X"
local O = "O"
local EMPTY = "_"
local SELECTED = "selection"

local state = {
	turn = 0;
	grid = {}
}

for i = 1, 3 do
	local row = {}
	for j = 1, 3 do
		row[j] = EMPTY
	end
	state.grid[i] = row
end

function game_state.get_turn()
	return state.turn
end

function game_state.get_grid()
	return state.grid
end

function game_state.print_grid()
	for i = 1, 3 do
		print(state.grid[i][1] .. " " .. state.grid[i][2] .. " " .. state.grid[i][3])
	end
end

function game_state.next_turn()
	state.turn = state.turn == 0 and 1 or 0
end

function game_state.set_position(x, y)
	if state.grid[y][x] == EMPTY then
		state.grid[y][x] = SELECTED
		
	elseif state.grid[y][x] == SELECTED then
		if state.turn == 0 then
			state.grid[y][x] = X
		elseif state.turn == 1 then
			state.grid[y][x] = O
		end
		game_state.next_turn()
		-- TODO: Message next turn
	end
	return state.grid[y][x]
end

function game_state.reset_position(x, y)
	state.grid[y][x] = EMPTY
end

-- It is more efficient to evaluate the move for a larger grid but that's beyond the scope
-- local function evaluate_row(grid, row_index, col_index)
-- 	for i = 1, 2 do
-- 		if grid[row_index][col_index] ~= grid[row_index] then
-- 			return EMPTY
-- 		end
-- 	end
-- 	return row[1]
-- end
-- 
function game_state.evaluate_winner()
-- 	-- Check rows
-- 	for i = 1, 3 do
-- 		local winner = evaluate_row(state.grid[i])
-- 		if winner ~= EMPTY then
-- 			return winner
-- 		end
-- 	end
-- 	-- Check columns
-- 	for i = 1, 3 do
-- 		for j = 1, 2 do
-- 			if state.grid[j][i] ~= state.grid[j + 1][i] then
-- 			end
-- 		end
-- 	end
-- 	-- Check diagonals
end

return game_state