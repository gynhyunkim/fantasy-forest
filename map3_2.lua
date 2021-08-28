-----------------------------------------------------------------------------------------
--
-- map3_2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local cx, cy = display.contentWidth * 0.5, display.contentHeight * 0.5
	

	local ground_line = graphics.newOutline(2, "image/image2/2-1.png")
	local layer_img = {"image/image2/2-5.png", "image/image2/2-4.png", "image/image2/2-3.png",
	"image/image2/2-2.png", "image/image2/2-1.png"}
	local layer = {}

	for i = 1, 5 do
		layer[i] = display.newImageRect(layer_img[i], 1280, 720)
		layer[i].x, layer[i].y = cx, cy
		sceneGroup:insert(layer[i])
	end

	local test = display.newImageRect("image/item/깨진램프.png", 200, 200)
	test.x, test.y = cx, cy
	sceneGroup:insert(test)

-- 네로 캐릭터
	local nero_sheet = graphics.newImageSheet("image/char/nero_sprites4.png", { width = 100, height = 166, numFrames = 4})
	local sequences_nero = {
		{
			name = "walkRight",
			frames = { 1, 2 },
			time = 300,
			loopCount = 0,
			loopDirection = "forward"
		},
		{
			name = "walkLeft",
			frames = { 3, 4 },
			time = 300,
			loopCount = 0,
			loopDirection = "forward"
		}
	}
	local nero = display.newSprite(nero_sheet, sequences_nero)
	nero.x, nero.y = 20, display.contentHeight * 0.8
	sceneGroup:insert(nero);

	-- 방향키 입력시 움직이는 이벤트리스너
	local function move2( event )
		if (event.phase == "down") then
			if (event.keyName == "right") then
				nero:setSequence("walkRight")
				nero:play()
				transition.moveBy(nero, {x = 1280 - nero.x, time = (1280 - nero.x) * 7})
			elseif (event.keyName == "left") then
				nero:setSequence("walkLeft")
				nero:play()
				transition.moveBy(nero, {x = -nero.x, time = nero.x * 7})
			end
		elseif (event.phase == "up") then
			transition.cancel(nero) -- 이동 정지
			nero:pause()
			if (nero.x <= 0) then
				Runtime:removeEventListener("key", move)
				composer.gotoScene("map3_1")
			elseif (nero.x >= 1150) then
				Runtime:removeEventListener("key", move2)
				composer.gotoScene("map3_3")
			end
		end
	end

	Runtime:addEventListener("key", move2)
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		composer.removeScene("map3_2")
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene