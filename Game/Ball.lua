ballSize = 1
newball = function()
	ball = {}
	ball.x = 500
	ball.y = 100
	
	ball.vel = {}
	ball.vel.x = 0
	ball.vel.y = 0
	
	ball.image = love.graphics.newImage("sprites/ball.png")
	
	shadow = {}
	shadow.img = love.graphics.newImage("sprites/shadow.png")
	shadow.width = shadow.img:getWidth()
	shadow.height = shadow.img:getHeight()
	shadow.size = 1
	
	ball.width = ball.image:getWidth()
	ball.height = ball.image:getHeight()
	
	ball.rot = 0
	
	ballSize = ballStartSize
	
	ball.update = function(dt)
		ball.vel.y = ball.vel.y + dt * gravity
		
		ball.y = ball.y + ball.vel.y
		if ball.y > ground then
			ball.y = ground
			ball.vel.y = ball.vel.y * -0.5
			score = 0
			ballSize = ballStartSize
		end
		if ball.x > rightWall then
			ball.x = rightWall
			ball.vel.x = ball.vel.x * -0.5
		end
		if ball.x < leftWall then
			ball.x = leftWall
			ball.vel.x = ball.vel.x * -0.5
		end
		
		ball.x = ball.x + ball.vel.x * dt
		
		ball.rot = ball.rot + ball.vel.x * dt
		
		shadow.size = ball.y * 0.002
		if shadow.size < 0.1 then
			shadow.size = 0.1
		end
	end
	
	ball.draw = function()
		love.graphics.draw(shadow.img , ball.x, ground + 70 , 0,shadow.size,shadow.size,shadow.width/2,shadow.height/2)

		love.graphics.draw(ball.image, ball.x, ball.y, ball.rot * 0.01, ballSize, ballSize, ball.width/2, ball.height/2)
	end
	
	ball.onTap = function(x,y)
		if math.dist(x, y, ball.x, ball.y) < (ball.width * ballSize)/2 then
			ball.vel.y = -ballHitForce
			ball.vel.x = (ball.x - x) * 20
			score = score + 1
			ballSize = ballSize - 0.05
		end
	end
	
	return ball
end
