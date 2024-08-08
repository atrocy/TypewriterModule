# TypewriterModule 1.2.5

## Instructions:
You can get the [TypewriterModule](https://create.roblox.com/store/asset/18773924561/TypewriterModule) from Creator Hub! <br/>

Or.. you could download the luau scripts and insert them in studio!
(Make sure FastSignal is located inside of TypewriterModule with Deferred and Immediate Module Scripts in it.)

## Example Usage:

```lua
local TypewriterModule = require(path)
local textlabel = path
local text = 'NPC: Hello, how are you doing?? Yeah.. same.'
local TypeObj = TypewriterModule.new(textlabel, text, 25, true)

TypewriterModule.Finished:Connect(function(obj)
print(obj.Text) 
end)
		
TypewriterModule.newSpecialChar(':')
TypeObj:SetSpecialCharYieldTime(0.1)
		
TypeObj:Typewrite()
TypeObj:Wait()
print('Completed!')
```

But what exactly happened in this code?

What is `TypingObject`? <br/>
**TypingObject** - is an object, created to use methods on.

With `TypingObject` you can:

* Typewrite
* Wait
* Cancel

AND **MORE**

# Creating TypingObject

```lua
local TypewriterModule = require(path)

local TextLabel = script.Parent
local Text = 'nello guys hehe'
local CharactersPerSecond = 15
local YieldOnSpecialCharacters = true

local TypeObj = TypewriterModule.new(TextLabel, Text, CharactersPerSecond, YieldOnSpecialCharacters)
```

Variables are pretty self explanatory to which arguments TypingObject requires lol.

### NOTE
*Please keep in mind that if you create 2 TypingObjects and use :Typewrite() method on them, object* **NO** *longer be avaible.*

Further documentation can be found in the wiki!