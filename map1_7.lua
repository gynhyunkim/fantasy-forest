-----------------------------------------------------------------------------------------
--
-- map1_7.lua
-- (오솔길) -> 장미정원_카드병정 화해
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	print("1_7")
	local bg = display.newImageRect("image/image1/garden.png", 1280, 720)
	bg.x, bg.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(bg)
	
	local door = display.newImageRect("image/image1/door.png", 200, 200)
	door.x, door.y = display.contentWidth*0.1, display.contentHeight*0.78
	sceneGroup:insert(door)

	-- 카드병정 --
	local black1 = display.newImageRect("image/char/black_02.png", 140, 215)
	black1.x, black1.y = bg.x*1.22, bg.y*1.53
	sceneGroup:insert(black1)

	local red1 = display.newImageRect("image/char/red_04.png", 140, 267)
	red1.x, red1.y = bg.x*1, bg.y*1.53
	sceneGroup:insert(red1)

	-- 네로 움직이는 모습 --
	local nero_sheet = graphics.newImageSheet("image/char/nero_sprites4.png", { width = 738 / 3, height = 648 * 0.5, numFrames = 6})
	local sequences_nero = {
		{
			name = "walkRight",
			frames = { 1, 2},
			time = 300,
			loopCount = 0,
			loopDirection = "forward"
		},
		{
			name = "walkLeft",
			frames = { 5, 6 },
			time = 300,
			loopCount = 0,
			loopDirection = "forward"
		}
	}
	local nero = display.newSprite(nero_sheet, sequences_nero)
	nero.x, nero.y = display.contentWidth * 0.22, display.contentHeight * 0.72

	-- 1층 --
	local b1 = { }
	local b1Group = display.newGroup()

	for i = 1, 9 do
		b1[i] = display.newImageRect(b1Group,"image/image1_2/6.png", 100, 100) 
		b1[i].x, b1[i].y = bg.x + 100 * i, bg.y
	end

	b1Group.x, b1Group.y = b1Group.x - 725, b1Group.y + 345

	-- img 5: 계단 시작(2, 3층 순) --
	local b2 = { }

	for i = 1, 2 do
		b2[i] = display.newImageRect("image/image1_2/5.png", 100, 100) 
	end

	b2[1].x, b2[1].y = display.contentWidth*0.712, display.contentHeight*0.85
	b2[2].x, b2[2].y = display.contentWidth*0.865, display.contentHeight*0.72

	-- img 6: 2층 계단 중간 --
	local b3 = display.newImageRect("image/image1_2/6.png", 100, 100) 
	b3.x, b3.y = display.contentWidth*0.79, display.contentHeight*0.85

	-- img 6: 3층 계단 중간 --
	local b4 = { }
	for i = 1, 2 do
		b4[i] = display.newImageRect("image/image1_2/6.png", 100, 100) 
	end
	b4[1].x, b4[1].y = display.contentWidth*0.943, display.contentHeight*0.72
	b4[2].x, b4[2].y = display.contentWidth*1.02, display.contentHeight*0.72

	-- img 7: 층 사이 이음새 --
	local b5 = { }

	for i = 1, 2 do
		b5[i] = display.newImageRect("image/image1_2/7.png", 100, 100) 
	end

	b5[1].x, b5[1].y = display.contentWidth*0.712, display.contentHeight*0.98
	b5[2].x, b5[2].y = display.contentWidth*0.865, display.contentHeight*0.85


	-- img 1: 흰 블록 채워넣기  --
	local b6 = { } 
	local b6Group = display.newGroup()

	for i = 1, 4 do
		b6[i] = display.newImageRect(b6Group,"image/image1_2/1.png", 100, 100) 
		b6[i].x, b6[i].y = bg.x + 100 * i, bg.y
	end

	b6Group.x, b6Group.y = b6Group.x + 272, b6Group.y + 350

	local b7 = { }
	for i = 1, 2 do
		b7[i]= display.newImageRect("image/image1_2/1.png", 100, 100) 
	end

	b7[1].x, b7[1].y = display.contentWidth*0.95, display.contentHeight*0.85
	b7[2].x, b7[2].y = display.contentWidth*1.02, display.contentHeight*0.85

	-- 풀 --
	local grass1 = display.newImageRect("image/image1/grass1.png", 110, 110)
	grass1.x, grass1.y = display.contentWidth*0.19, display.contentHeight*0.84

	local grass2 = display.newImageRect("image/image1/grass1.png", 110, 110)
	grass2.x, grass2.y = display.contentWidth*0.32, display.contentHeight*0.84

	local grass3 = display.newImageRect("image/image1/grass2.png", 110, 110)
	grass3.x, grass3.y = display.contentWidth*0.35, display.contentHeight*0.84

	local grass4 = display.newImageRect("image/image1/grass4.png", 110, 110)
	grass4.x, grass4.y = display.contentWidth*0.54, display.contentHeight*0.84
	
	-- 색 없는 장미 --
	local rose = { }
	local roseGroup = display.newGroup()

	for i = 1, 2 do
		rose[i] = display.newImageRect(roseGroup, "image/image1_2/rose1.png", 200, 100)
		rose[i].x, rose[i].y = bg.x + 195 * i, bg.y - 92 * i
	end

	roseGroup.x = roseGroup.x + 135
	roseGroup.y = roseGroup.y + 243

	sceneGroup:insert(door)
	sceneGroup:insert(grass1)
	sceneGroup:insert(grass2)
	sceneGroup:insert(grass3)
	sceneGroup:insert(grass4)
	sceneGroup:insert(b1Group)
	sceneGroup:insert(b3)
	sceneGroup:insert(b6Group)
	for i = 1, 2 do
		sceneGroup:insert(b2[i])
		sceneGroup:insert(b4[i])
		sceneGroup:insert(b5[i])
		sceneGroup:insert(b7[i])
	end
	sceneGroup:insert(roseGroup)
	sceneGroup:insert(nero)

	local text1 = display.newImageRect("image/char/text1.png", 1150, 340)
	text1.x, text1.y = display.contentWidth * 0.5, display.contentHeight * 0.75
	text1.alpha = 0
	sceneGroup:insert(text1)

	local rName, bName, black2, black3, red2, red3, text
	-- 카드병정 대화 --
	local function textScene()
		-- 대화창 이름 --
		rName = display.newText("하트 3", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
		rName.alpha = 0

		bName = display.newText("스페이드 5", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
		sceneGroup:insert(bName)
		bName.alpha = 0

		black2 = display.newImageRect("image/char/black_01.png", 370, 360)
		black2.x, black2.y = bg.x*1.55, bg.y*0.77
		sceneGroup:insert(black2)
		black2.alpha = 0

		black3 = display.newImageRect("image/char/black_03.png", 420, 380)
		black3.x, black3.y = bg.x*1.5, bg.y*0.743
		black3.alpha = 0

		red2 = display.newImageRect("image/char/red_03.png", 360, 400)
		red2.x, red2.y = bg.x*0.5, bg.y*0.57
		sceneGroup:insert(red2)
		red2.alpha = 0

		red3 = display.newImageRect("image/char/red_05.png", 360, 400)
		red3.x, red3.y = bg.x*0.5, bg.y*0.57
		red3.alpha = 0

		-- 대사 --
		text = { }
		text[1] = display.newText("3! 우는 것마저도 아름다운 나의 사랑. 그러나 사랑하는 그대가 슬퍼하는 건 원하지 않소.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
		text[2] = display.newText("거짓만을 말하는 당신의 입은 믿지 않겠어요.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
		text[3] = display.newText("그런데, 왜 그렇게 젖은 채로 온 거죠?", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
		text[4] = display.newText("(체셔의 조언을 듣고 강가에서 입수하고 온 5)", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
		text[5] = display.newText("모르겠소? 나의 몸을 적신 것은 그대의 눈물이오.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
		text[6] = display.newText("그대의 눈물이 나의 몸을 적시고, 그대의 숨이 멎으면 나의 숨도 끊어질 것이오.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
		text[7] = display.newText("하트 3, 그대가 나의 몸을 움직이게 하는 심장이기에!", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
		text[8] = display.newText(" ", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
		text[9] = display.newText(" ", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)

		text[1]:setFillColor(0)
		text[1].alpha = 0

		for i = 2, 9 do
			text[i].alpha = 0
			text[i]:setFillColor(0)
		end

		transition.fadeIn( black2, { time = 900 } )
		transition.fadeIn( red2, {  time = 900 } )
		transition.fadeIn( text1, {  time = 900 } )
		transition.fadeIn( bName, { time = 900 } )
		transition.fadeIn( text[1], { time = 900 } )
	end

	local flag = 0
	---- 방향키 입력시 움직이는 이벤트리스너 --
	local function move( event )
		if (event.phase == "down") then
			if (event.keyName == "right") then
				nero:setSequence("walkRight")
				nero:play()
				if (nero.x < 490) then
					transition.moveBy(nero, { x = 490 - nero.x, time = (490 - nero.x) * 7 })
				else
					transition.moveBy(nero, { x = 1280 - nero.x, time = (1280 - nero.x) * 7 })
				end
				
			elseif (event.keyName == "left") then
				nero:setSequence("walkLeft")
				nero:play()
				transition.to(nero, {x = nero.x - 1000, time = 7000})
			end
		elseif (event.phase == "up") then
			transition.cancel(nero) -- 이동 정지
			nero:pause()
			if (nero.x == 490 and flag ~= 1) then
				flag = 1
				Runtime:removeEventListener("key", move)
				textScene()
			end
		end
	end

	Runtime:addEventListener("key", move)

	-- 탭 하면 다음 text --
	local j = 2
	local function nextText()
		-- 대사에 따라 이름 변경 --
		if j == 2 or j == 3 or j == 8 then
			bName.alpha = 0
			rName.alpha = 1
		elseif j == 4 then
			bName.alpha = 0
			rName.alpha = 0
		else
			rName.alpha = 0
			bName.alpha = 1
		end

		if j == 1 then
			text[j].alpha = 0
		end

		if j > 1 then
			text[j - 1].alpha = 0
		end

		-- 호소하는 5의 모습 --
		if j == 5 or j == 6 or j == 7 then
			black2.alpha = 0
			black3.alpha = 1
		end

		if j == 8 then
			red2.alpha = 0
			red3.alpha = 1
		end

		if j == 9 then
			transition.fadeOut( bName, {  time = 900 } )
			transition.fadeOut( black3, {  time = 900 } )
			transition.fadeOut( red3, {  time = 900 } )
			transition.fadeOut( text1, {  time = 900 } )

			text1:removeEventListener("tap", nextText)
			
			composer.removeScene("map1_7")
			composer.gotoScene("map1_8", { effect = "fade", time = 900 })
		end

		if j < 9 then
			text[j].alpha = 1
			j = j + 1
		end
	end

	text1:addEventListener("tap", nextText)
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
		-- Called when the scene is now off screen
		composer.removeScene("map1_7")
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