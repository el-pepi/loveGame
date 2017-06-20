require("Ball")
 
gravity = 20

ballHitForce = 15

ground = 470
leftWall = 50
rightWall = 720

score = 0

font = love.graphics.newFont(30)

ballStartSize = 1.3

sky = love.graphics.newImage("sprites/sky.png")
love.graphics.setBackgroundColor(133,226,142)

function love.load()
ball = newball()
love.graphics.setFont(font)
end

function love.update(dt)
ball.update(dt)
end

function love.draw()
love.graphics.draw(sky, 0, 0, 0, 1, 1, 0, 0)

ball.draw()
love.graphics.print('Score: ' .. score, 0, 0)
end

function love.mousepressed(x,y)
	ball.onTap(x,y)
end

function math.dist(x1,y1, x2,y2) return ((x2-x1)^2+(y2-y1)^2)^0.5 end
function math.dif(x1, x2) return ((x2-x1)^2)^0.5 end