local facebookSharing = require "plugin.facebookSharing"
local widget = require("widget")
local json = require("json")
facebookSharing.init()

print(facebookSharing.canShow("image"))

local bg = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
bg:setFillColor( 0,0,.9 )

local title = display.newText( {text = "Facebook Sharing", fontSize = 25} )
title.x, title.y = display.contentCenterX, 50
title:setFillColor(.5)

local function fbLis(e)
    print(json.encode(e))
end

local showShareLink
showShareLink = widget.newButton( {
        x = display.contentCenterX,
        y = display.contentCenterY,
        id = "showShareLink",
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        label = "Share Link To Facebook",
        onEvent = function ( e )
                if (e.phase == "ended") then
                        facebookSharing.show({url = "https://solar2dmarketplace.com"}, fbLis)
                end
        end
} )

local showShareVideo
showShareVideo = widget.newButton( {
        x = display.contentCenterX,
        y = display.contentCenterY+50,
        id = "showShareVideo",
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        label = "Share Video To Facebook",
        onEvent = function ( e )
                if (e.phase == "ended") then
                        facebookSharing.show({video=system.pathForFile("test.mp4")}, fbLis)
                end
        end
} )

local showSharePhotos
showSharePhotos = widget.newButton( {
        x = display.contentCenterX,
        y = display.contentCenterY+100,
        id = "showSharePhotos",
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        label = "Share Photos To Facebook",
        onEvent = function ( e )
                if (e.phase == "ended") then
                        facebookSharing.show({photos={system.pathForFile("test1.png"), system.pathForFile("test2.png")}}, fbLis)
                end
        end
} )

local showSharePhotosAndVideo
showSharePhotosAndVideo = widget.newButton( {
        x = display.contentCenterX,
        y = display.contentCenterY+150,
        id = "showSharePhotosAndVideo",
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        label = "Photos/Video To Facebook",
        onEvent = function ( e )
                if (e.phase == "ended") then
                        facebookSharing.show(
                        {
                            photos={system.pathForFile("test1.png"), system.pathForFile("test2.png")},
                            video=system.pathForFile("test.mp4"),
                            hashtag="#solar2d"
                        }, fbLis)
                end
        end
} )
