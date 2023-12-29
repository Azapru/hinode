local hinode = {}

hinode.rect = {}
hinode.obj = {}

local rectangles = {}
local objects = {}
local objectImages = {}

-------------------------------------------------- hinode --------------------------------------------------

function hinode.load()
    love.window.setTitle("Hinode")
    print("Hinode loaded!")
end

function hinode.update(dt)
    
end

function hinode.draw()
    for i = 1, #rectangles, 1 do
        if rectangles[i].fill == true then
            love.graphics.rectangle("fill", rectangles[i].x, rectangles[i].y, rectangles[i].width, rectangles[i].height)
        else
            love.graphics.rectangle("line", rectangles[i].x, rectangles[i].y, rectangles[i].width, rectangles[i].height)
        end
    end

    for i = 1, #objects, 1 do
        love.graphics.draw(objectImages[objects[i].imageId], objects[i].x, objects[i].y, objects[i].r)
    end
end

-------------------------------------------------- rect --------------------------------------------------

-- Creates new rectangle object.
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@param fill boolean
function hinode.rect.new(fill, x, y, width, height)
    table.insert(rectangles, {fill=fill, x=x, y=y, width=width, height=height})
    return #rectangles
end

-- Returns a rectangle, allowing you to modify its properties.
---@param id integer
function hinode.rect.get(id)
    return rectangles[id]
end

-------------------------------------------------- obj --------------------------------------------------

-- Loads an image from a file.
---@param filepath string
function hinode.obj.loadImage(filepath)
    table.insert(objectImages, love.graphics.newImage(filepath))
    return #objectImages
end

-- Creates new object.
---@param imageId integer
---@param x integer
---@param y integer
function hinode.obj.new(imageId, x, y)
    table.insert(objects, {imageId=imageId, x=x, y=y, r=0})
    return #objects
end

-- Returns an object, allowing you to modify its properties.
---@param id integer
function hinode.obj.get(id)
    return objects[id]
end

return hinode