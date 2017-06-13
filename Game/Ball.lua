newball = function()
	ball = {}
	ball.x = 500
	ball.y = 100
	
	ball.vel = {}
	ball.vel.x = 0
	ball.vel.y = 0
	
	ball.image = love.graphics.newImage("sprites/ball.png")
	
	ball.width = ball.image:getWidth()
	ball.height = ball.image:getHeight()
	
	ball.update = function(dt)
		ball.vel.y = ball.vel.y + dt * gravity
		
		ball.y = ball.y + ball.vel.y
		
		ball.x = ball.x + ball.vel.x * dt;
	end
	
	ball.draw = function()
		love.graphics.draw(ball.image, ball.x, ball.y, 0, 1, 1, ball.width/2, ball.height/2)
	end
	
	ball.onTap = function(x,y)
		if math.dist(x, y, ball.x, ball.y) < 65 then
			ball.vel.y = -ballHitForce
			ball.vel.x = (ball.x - x) * 20
		end
	end
	
	return ball
end
