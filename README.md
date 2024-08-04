# TypewriterModule 1.1.3

## Example Usage:

```lua
local TypewriterModule = require(path)
local textlabel = path
local text = 'NPC: Hello, how are you doing?? Yeah.. same.'
local TypeObj = TypewriterModule.new(textlabel, text, 25, true)

TypewriterModule.Finished:Connect(function(session)
print(session.Text) 
end)
		
TypewriterModule.newSpecialChar(':')
TypeObj:SetSpecialCharYieldTime(0.1)
		
TypeObj:Typewrite()
TypeObj:Wait()
print('Completed!')
```

But what exactly happened in this code?

What is `TypingObject`?
**TypingObject** - is an object, created to use methods on.

With `TypingObject` you can:

* Typewrite
* Wait
* Cancel

AND *MORE*

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
*Please keep in mind that if you create 2 TypingObjects and use :Typewrite() method on them, object's \n thread will destroy.*

Further documentation can be found in the wiki!