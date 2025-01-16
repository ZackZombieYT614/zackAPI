-- be careful please, 
-- there are some instructions in the README.md if you are trying to make it work

local zackapi = {}

tick = 0
checkT = false

--Typing code
errorT = {
    "",
    {text = "Error: ZackAPI - could not find sound for typing", color = "red"}
}
local soundT, volumeT, pitchT, delayT
function zackapi.typing(snd,vol,ptch,dly)
    if vol == nil then
        volumeT = .5
    else
        volumeT = vol
    end
    if ptch == nil then
        pitchT = 1
    else
        pitchT = ptch
    end
    if dly == nil then
        delayT = 0
    else
        delayT = dly
    end
    soundT = snd
    checkT = true
end
function events.char_typed()
    if checkT == true then
        if host:isChatOpen() then
            pings.type(soundT,volumeT,pitchT,delayT)
        end
    end
end
function pings.type(soundT,volumeT,pitchT,delayT)
    if not player:isLoaded() then return end
    if soundT == nil or soundT == "" then
        printJson(toJson(errorT))
    else
        if delay_check == true then
            sounds:playSound(soundT,player:getPos(),volumeT,pitchT)
            delay_check = false
        end
    end
end

--Enter code
errorE = {
    "",
    {text = "Error: ZackAPI - could not find sound for the enter key", color = "red"}
}
local soundE, volumeE, pitchE
checkE = false
function zackapi.enter(snd,vol,ptch)
    if vol == nil then
        volumeE = .5
    else
        volumeE = vol
    end
    if ptch == nil then
        pitchE = 1
    else
        pitchE = ptch
    end
    soundE = snd
    checkE = true
end
function pings.enterSound()
    if checkE == true then
        if soundE == nil or soundE == "" then
            printJson(toJson(errorE))
        else
            sounds:playSound(soundE,player:getPos(),volumeE,pitchE)
        end
    end
end
local enter = keybinds:newKeybind("enter sound", "key.keyboard.enter", true)
enter.press = pings.enterSound

--Backspace code
errorB = {
    "",
    {text = "Error: ZackAPI - could not find sound for the backspace key", color = "red"}
}
local soundB, volumeB, pitchB
checkB = false
function zackapi.backspace(snd,vol,ptch)
    if vol == nil then
        volumeB = .5
    else
        volumeB = vol
    end
    if ptch == nil then
        pitchB = 1
    else
        pitchB = ptch
    end
    soundB = snd
    checkB = true
end
function pings.bckSound()
    if checkB == true then
        if soundB == nil or soundB == "" then
            printJson(toJson(errorB))
        else
            sounds:playSound(soundB,player:getPos(),volumeB,pitchB)
        end
    end
end
local backspace = keybinds:newKeybind("backspace sound", "key.keyboard.backspace", true)
backspace.press = pings.bckSound

--Escape code
function pings.escf()
    --i'm getting there i wanna add other stuff to it but i wanted to get this released :p
end
local esc = keybinds:newKeybind("enter sound", "key.keyboard.escape")
esc.press = pings.escf

--timing code
function events.tick()
    if delayT ~= 0 then
        tick = tick + 1
        if tick == delayT then
            tick = 0
            delay_check = true
        end
    else
        delay_check = true
    end
end

return zackapi