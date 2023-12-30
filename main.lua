local hinode = require("hinode.hinode")

function love.load()
	hinode.load()

    Obj = hinode.rect.new(true, 32, 32, 128, 64)

    KeithImage = love.graphics.newImage("hinode/keith.png")
    Keith = hinode.obj.new(KeithImage, 256, 256)
end

function love.update(dt)
	hinode.update(dt)
end

function love.draw()
	hinode.draw()
end