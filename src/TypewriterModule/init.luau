--[[
	Made by cheez1i!!!!(aka Romazka57/atrocy)
	
	[ UPDATE 1.2.6 ]
		Added:	
				
			[ OBJECT UPDATES ]
				Canceled and Finished properties were renamed to _canceled and _finished
				they are now consindered PRIVATE, you should NOT modify them
				
		Fixes:
			Some code fixes
			Doc/Example fix
			Removed Trove Module (was planned to use)
			
	
	# Typewriter
	Easy, simple, typewriter effect!
	With features like: Canceling, Resuming, Yielding on special characters... AND MORE!
	
	[ Example Usage ]
		local TypewriterModule = require(path)
		local textlabel = script.Parent
		local text = 'NPC: Hello, how are you doing?? Yeah.. same.'
		local TypeObj = TypewriterModule.new(textlabel, text, 25, nil, true)

		TypewriterModule.Finished:Connect(function(obj)
			print(obj.Text)
		end)
		
		TypewriterModule.newSpecialChar(':')
		TypeObj:SetSpecialCharYieldTime(0.1)
		
		TypeObj:Typewrite()
		TypeObj:Wait()
		print('Completed!')
		
	[ Typewriter API ]
	
		[ MODES ]
		
			'Create' => DEFAULT, Clears off the TextLabel, typewrites without continuing the last text.
			'Continue' => Continues on typewriting the last text, doesn't clear off the TextLabel.
			
		[ SET DEFAULTS FUNCTIONS ]
			
			Typewriter.newSpecialChar(character: string) -> ()
				Description:
					Adds a new special character to the table.
				Note:
					If a special character gets hit, it yields way more time, depends.. on what yield time is set.
					Default yield time for special characters is 0.5
					
					
			Typewriter.SetDefaultSpecialCharYieldTime(time: number) -> ()
				Description:
					Sets a yield time for special characters for typewriter.
					
					
			Typewriter.SetDefaultContinueSpace(Enabled: boolean)
				Description:
					Sets if ContinueSpace is default-ly enabled for Typewriting.
		
		[ FUNCTIONS ]
		
			Typewriter.new(TextLabel, text: string, CharactersPerSecond: number, Sound: Sound?, yieldOnSpecialChar: boolean?) -> TypewriterObject
				Description:
					Creates a new TypewriterObject
				Note:
					yieldOnSpecialChar is NOT required!
					if set to true, will wait more, if hit on a special char.
					adding new special characters, or setting more time to yield on them could be find further in the doc.
					If CharactersPerSecond is set to -1 the typewriting will be VERY fast.-
					-If you want to write the text instantly, use FinishText method, which could be find further in the doc.
					
		
			TypewriterObject:Typewrite(Mode: string?, Sound: Sound?, ContinueSpace: boolean?) -> ()
				Description:
					Typewrites the text you provided for the object.
					
					Sound will play as each letter gets typewritten in the text.
					
					ContinueSpace only applies if the chosen Mode is Continue.
					ContinueSpace adds a space to the old text, merging the new written text.
					
					Triggers Finished event after finishing typewriting.
				Note:
					If the Mode argument is not provided, it'll use the default option: Create.
					ContinueSpace's default value is false.
				
				
			TypewriterObject:Destroy() -> ()
				Description:
					Destroys the TypewriterObject.
				Note:
					Triggers Finished event.
			
			
			TypewriterObject:Clear() -> ()
				Description:
					Clears the TextLabel
				Note:
					Triggers Finished event.
					
					
			TypewriterObject:Cancel() -> ()
				Description:
					Cancels the typewriting, means that the text will stop on typing.
			
			
			TypewriterObject:Resume() -> ()
				Description:
					Resumes, if the object was canceled, will resume and continue on typing.
					
					
			TypewriterObject:IsActive() -> boolean
				Description:
					Returns if the object is active, do be exact, if it is canceled or not.
					
					
			TypewriterObject:Wait(waitAfterFinish: number) -> yields
				Description:
					Yields the code until the object is finished typewriting.
					TypingObject finishes typing and THEN waiting for the how much time you provided.
					
			TypewriterObject:SetText(text: string) -> ()
				Description:
					Sets a new Text for the object so it could be Typewrited again.
				Note:
					If object is typewriting, it'll yield the code until its finished, then it sets the new value for text.
					DEFAULT: ''
					
			
			TypewriterObject:SetCharactersPerSec(CharsPerSec: number) -> ()
				Description:
					Sets a new CPS for the object.
				Note:
					If object is typewriting, it'll yield the code until its finished, then it sets the new value for CPS.
					DEFAULT: 25

			
			TypewriterObject:SetTimeBetweenTyping(time: number) -> ()
				Description:
					Sets a time between typing.
					Almost the same as SetCharactersPerSec method but you actually set the time, instead of it being calculated.
				Note:
					If object is typewriting, it'll yield the code until its finished, then it sets the new value for CPS.
					DEFAULT: 0.04
					
					
			TypewriterObject:SetMode(Mode: string) -> ()
				Description:
					Sets a new Mode for the object.
				Note:
					If object is typewriting, it'll yield the code until its finished, then it sets the new value for text.
					Set the mode using Typewriter.TypeModes.MODENAME!
					DEFAULT: 'Create'
					
			
			TypewriterObject:SetSound(Sound: Sound) -> ()
				Description:
					Sets a new text for the object so it could be Typewrited again.
				Note:
					If object is typewriting, it'll yield the code until its finished, then it sets the new value for text.
					If you did not provide the sound, it will return end/fail. 
				
					
			TypewriterObject:SetContinueSpaceEnabled(Enabled: boolean) -> ()
				Description:
					Enables/Disables ContinueSpace.
				Note:
					If object is typewriting, it'll yield the code until its finished, then it enables/disables ContinueSpace
					DEFAULT: true	
			
			
			TypewriterObject:SetSpecialCharYieldEnabled(time: number) -> ()
				Description:
					Enables/Disables SpecialCharYield
				Note:
					If object is typewriting, it'll yield the code until its finished, then it enables/disables SpecialCharYield
			
			
			TypewriterObject:SetContinueSpaceEnabled(Enabled: boolean) -> ()
				Description:
					Sets a new yield time for the object so it could be Typewrited again.
				Note:
					If object is typewriting, it'll yield the code until its finished, then it sets the new value for yield time.
			
			
			TypewriterObject:FinishText() -> ()
				Description:
					Finishes the whole text, in addition stops typewriting, of course.
				Note:
					Triggers Finished Event
			
			
		[ EVENTS ]
			READ THIS!!!
			NOTE: Put events on the top of your script, as an example, after requiring the module.
			
				  Why is that?
				  
				  If you put it on the bottom, the objects will yield the code and the connectors wont be able
				  to get triggered.
		
			Typewriter.Finished:Connect(object) -> TypewriterObject
				Description:
					Gets triggered when a TypewriterObject finishes Typewriting, returning itself.
			
			
			Typewriter.Canceled:Connect(object) -> TypewriterObject
				Description:
					Gets triggered when a TypewriterObject cancels, returning itself.
				Note:
					Canceled only returns a session with the parameters you provided.
					What does this mean?
					If you used Mode Continue, it wont return obj.Text with the previous text, only with the text parameter-
					-YOU provided.

			
			Typewriter.Resumed:Connect(object) -> TypewriterObject
				Description:
					Gets triggered when a TypewriterObject resumes, returning itself.


			Typewriter.Paused:Connect(object, pauseTime) -> TypewriterObject, number
				Description:
					Gets triggered when a TypewriterObject pauses, returning itself.
			

			Typewriter.Destroying:Connect(object) -> TypewriterObject
				Description:
					Gets triggered when a TypewriterObject destroys, returning itself.
				Note:
					 ̶M̶o̶s̶t̶ ̶l̶i̶k̶e̶l̶y̶ ̶g̶o̶i̶n̶g̶ ̶t̶o̶ ̶r̶e̶t̶u̶r̶n̶ ̶a̶ ̶T̶y̶p̶e̶w̶r̶i̶t̶e̶r̶O̶b̶j̶e̶c̶t̶ ̶t̶h̶a̶t̶ ̶o̶n̶l̶y̶ ̶c̶o̶n̶t̶a̶i̶n̶s̶ ̶a̶ ̶d̶e̶a̶d̶ ̶t̶h̶r̶e̶a̶d̶.̶ ̶N̶o̶t̶ ̶v̶e̶r̶y̶ ̶u̶s̶e̶f̶u̶l̶.̶.̶
					 Now returns the full object :)
					
			
		[ TEXT COMMANDS ]
			
			[p:number]
				Description:
					Pauses the text for the amount of time you provided.
				Note:
					Triggers Paused event.
		
				
		

]]
local Packages = script.Packages

local Signal = require(Packages.Signal)

local typewriter = {}
typewriter.__index = typewriter
typewriter.Version = '1.2.6'

local DEFAULT_SPECIAL_CHARS = { --default special characters, you can modify this.
	',','.','!','?'
}

local settings = {
	DEFAULT_SPECIAL_CHAR_YIELD = 0.5,
	DEFAULT_CONTINUE_SPACE = true
}

local running = {}

typewriter.TypeModes = {
	Create = 'Create',
	Continue = 'Continue'
}

typewriter.Finished = Signal.new()
typewriter.Canceled = Signal.new()

typewriter.Paused = Signal.new()
typewriter.Resumed = Signal.new()

typewriter.Destroying = Signal.new()

--event fire functions
local function Finish(session)
	typewriter.Finished:Fire(session)
end

local function onCancel(session)
	typewriter.Canceled:Fire(session)
end

local function Pause(session, time: number)
	typewriter.Paused:Fire(session, time)
end

local function onResume(session)
	typewriter.Resumed:Fire(session)
end

local function onDestroy(session)
	typewriter.Destroying:Fire(session)
end

local function atPause(text: string, index: number) --use when u hit on [ character
	local p = text:sub(index+1, index+1) == 'p'
	local column = text:sub(index+2, index+2) == ':'
	-- local closingbracket
	local pauseValue

	if column then
		local closebracketpos = text:find(']', index+2) --we need to recieve a position to sub for a pause value
		if closebracketpos == nil then return nil, true, nil end
		closebracketpos -= 1

		pauseValue = text:sub(index+3, closebracketpos)
		if pauseValue then return pauseValue, true, 4+pauseValue:len() end
	end

	return nil, false, nil --if not column
end

local function isSpecialChar(character: string) : boolean
	return table.find(DEFAULT_SPECIAL_CHARS, character) ~= nil
end


local function setNilToObject(object)
	for i, v in object do
		if typeof(v) == 'thread' then
			if coroutine.status(v) ~= 'running' or coroutine.status(v) ~= 'suspended' then continue end
			coroutine.close(v)
		end
		object[i] = nil
	end
end

local function destroySession(object)
	for i, obj in running do
		if obj.TextLabel ~= object.TextLabel and not obj._thread then continue end
		--destroy the object itself
		onDestroy(object)
		setNilToObject(object)
		
		--get it out of running table idiot
		-- typewriter.Cancel(obj)
		obj:Cancel()
		coroutine.close(obj._thread)
		obj._thread = nil
		obj = nil
		object = nil
		table.remove(running, i)
	end
end

local function updateSessionThread(object)
	for _, obj in running do
		if obj._thread ~= object._thread then continue end
		obj._thread = object._thread
		return
	end
	
	table.insert(running, object)
end

local function checkIfOtherRunning(object)
	for _, obj in running do
		if obj.TextLabel ~= object.TextLabel or not obj._thread or obj == object then continue end
		return obj
	end
	
	return nil
end

local function checkIfObjectRunning(object)
	for _, obj in running do
		if obj ~= object then continue end
		return true
	end

	return false
end

-- Module Functions
function typewriter.new(TextLabel: TextLabel, Text: string, CharsPerSec: number, Sound: Sound, yieldOnSpecialChars: boolean?)
	TextLabel = TextLabel or Instance.new('TextLabel')
	Text = Text or ''
	CharsPerSec = CharsPerSec or 25
	Sound = Sound or nil
	yieldOnSpecialChars = yieldOnSpecialChars or false
	
	local self = setmetatable({}, typewriter)
	
	self.TextLabel = TextLabel
	self.Text = Text
	self.Time = 1/CharsPerSec
	self.Sound = Sound

	self.SpecialCharYield = yieldOnSpecialChars
	self.SpecialCharYieldTime = settings.DEFAULT_SPECIAL_CHAR_YIELD

	self._thread = false

	self._canceled = false
	self._finished = false
	
	return self
end

function typewriter.SetDefaultCharYieldTime(time: number)
	if not time then return end
	time = math.abs(time) or settings.DEFAULT_SPECIAL_CHAR_YIELD
	settings.DEFAULT_SPECIAL_CHAR_YIELD = time
end

function typewriter.SetDefaultContinueSpace(Enabled: boolean)
	-- Why cant we just do ContinueSpace = ContinueSpace or true?
	-- Because if Enabled is set to false it will turn into true, due to roblox's logic
	if Enabled == nil or typeof(Enum) ~= 'boolean' then Enabled = settings.DEFAULT_CONTINUE_SPACE end
	settings.DEFAULT_CONTINUE_SPACE = Enabled
end

function typewriter.newSpecialChar(char: string)
	if not table.find(DEFAULT_SPECIAL_CHARS, char) then
		table.insert(DEFAULT_SPECIAL_CHARS, char)
	else
		warn(char..' has been already registered in the module.')
	end
end

--[[

Modes:

	Create --DEFAULT, clears the textlabel and typewrites
	Continue --continues the text that has been written.

]]

function typewriter:Typewrite(Mode: string?, ContinueSpace: boolean?)
	if not self.TextLabel or not self.Text or not self.Time then return end
	if self._finished then self._finished = false end
	
	-- Why cant we just do ContinueSpace = ContinueSpace or true?
	-- Because if Enabled is set to false it will turn into true, due to roblox's logic
	if ContinueSpace == nil or typeof(ContinueSpace) ~= 'boolean' then ContinueSpace = settings.DEFAULT_CONTINUE_SPACE end
	--gotta add ~= nil cuz self.ContinueSpace is a boolean!!!
	if self.ContinueSpace ~= nil or self.ContinueSpace == false then ContinueSpace = self.ContinueSpace end
	
	Mode = Mode or typewriter.TypeModes.Create
	if self.Mode then Mode = self.Mode end
	
	if not typewriter.TypeModes[Mode] then Mode = 'Create' end
	
	local oldText = self.TextLabel.Text or ''

	if Mode == typewriter.TypeModes.Continue and ContinueSpace then oldText = oldText..' ' end
	
	local isRunning = checkIfOtherRunning(self)
	if isRunning ~= nil then destroySession(isRunning) end

	if self._thread then if coroutine.status(self._thread) == 'running' or coroutine.status(self._thread) == 'suspended' then coroutine.close(self._thread) end end

	local thread = coroutine.create(function()
		for i = 1, #self.Text do
			if self._finished then break end
			local currentText = string.sub(self.Text, 1, i)
			local currentChar = string.sub(self.Text, i, i)

			if currentChar == '[' then --time to check if its a pausing command
				local pauseValue, paused, pauseLen = atPause(self.Text, i)
				pauseValue = tonumber(pauseValue)
				pauseLen = tonumber(pauseLen) or 0
				if paused then
					self.Text = self.Text:sub(1, i-1)..self.Text:sub(i+pauseLen, -1)
					currentText = string.sub(self.Text, 1, i)
					currentChar = string.sub(self.Text, i, i)
					if pauseValue then Pause(self, pauseValue) task.wait(pauseValue) end
				end
			end

			local yield = isSpecialChar(currentChar)
				
			if Mode == typewriter.TypeModes.Create then 
				self.TextLabel.Text = currentText 
			elseif typewriter.TypeModes.Continue then
				self.TextLabel.Text = oldText..currentText 
			end

			if self.Sound and self.Sound:IsA('Sound') then self.Sound:Play() end
			
			--[[  after destroying, self can turn into an empty table and fire it through the signal
				                           |                  
				                          THIS        ]]
			if i >= #self.Text and #self == 0 then self.Text = self.TextLabel.Text self._finished = true Finish(self) end
			
			if self.Time ~= -1 and (not yield or not self.SpecialCharYield) then task.wait(self.Time) end
			if self.SpecialCharYield and yield then task.wait(self.SpecialCharYieldTime) end
			if self._canceled then coroutine.yield() end
		end
	end)
	
	self._thread = thread
	self.Mode = Mode
	-- if you want to add this use :SetContinueSpaceEnabled.
	
	--self.ContinueSpace = ContinueSpace
	--table.insert(running, self)
	updateSessionThread(self)
	
	coroutine.resume(thread)
end

function typewriter:Destroy()
	if self.TextLabel then 
		self._finished = true

		destroySession(self)
		for i, obj in running do
			if obj._thread ~= self._thread then continue end
			running[i] = nil
			return
		end
		
	end
end

function typewriter:Clear()
	if self.TextLabel then
		self._finished = true
		Finish(self)
		self.TextLabel.Text = ''
	end
end

function typewriter:Cancel()
	--checking if self has more than 0 contents just in case if it is destroying
	if self._thread and not self._canceled and #self > 0 then self._canceled = true onCancel(self) end
end

function typewriter:Resume()
	if self._thread and self._canceled then self._canceled = false coroutine.resume(self._thread) onResume(self) end
end

function typewriter:IsActive()
	return self._canceled == false
end

function typewriter:Wait(waitAfterFinishing: number?)
	repeat task.wait()
		
	until self._finished

	if typeof(waitAfterFinishing) == 'number' then task.wait(waitAfterFinishing) end
	return self
end

function typewriter:SetText(text: string)
	if checkIfObjectRunning(self) then self:Wait() end
	self.Text = text or ''
end

function typewriter:SetCharactersPerSecond(CharsPerSec: number)
	if checkIfObjectRunning(self) then self:Wait() end
	CharsPerSec = CharsPerSec or 25
	self.Time = 1/CharsPerSec
end

function typewriter:SetTimeBetweenTyping(time: number) -- almost what SetCharacterPerSecond does, but u set the time, SCPS method automatically does that
	if checkIfObjectRunning(self) then self:Wait() end
	self.Time = time or 1/25
end

function typewriter:SetMode(Mode: string)
	if checkIfObjectRunning(self) then self:Wait() end
	self.Mode = Mode or typewriter.TypeModes.Create
end

function typewriter:SetContinueSpaceEnabled(Enabled: boolean)
	if checkIfObjectRunning(self) then self:Wait() end
	-- Why cant we just do Enabled = Enabled or true?
	-- Because if Enabled is set to false it will turn into true, due to roblox's logic
	if Enabled == nil or typeof(Enabled) ~= 'boolean' then Enabled = true end
	self.ContinueSpace = Enabled
end

function typewriter:SetSound(Sound: Sound)
	if not Sound:IsA('Sound') then return end
	if checkIfObjectRunning(self) then self:Wait() end
	self.Sound = Sound
end

function typewriter:SetSpecialCharYieldTime(time: number)
	if checkIfObjectRunning(self) then self:Wait() end
	time = math.abs(time) or settings.DEFAULT_SPECIAL_CHAR_YIELD
	self.SpecialCharYieldTime = time
end

function typewriter:SetSpecialCharYieldEnabled(Enabled: boolean)
	if checkIfObjectRunning(self) then self:Wait() end
	-- Why cant we just do Enabled = Enabled or true?
	-- Because if Enabled is set to false it will turn into true, due to roblox's logic
	if Enabled == nil or typeof(Enabled) ~= 'boolean' then Enabled = true end
	self.SpecialCharYield = Enabled
end

function typewriter:FinishText()
	if checkIfObjectRunning(self) then
		local textLabelText = self.TextLabel.Text
		if self.ContinueSpace then textLabelText = textLabelText..' ' end
		
		if not self.Mode or self.Mode == typewriter.TypeModes.Create then
			self.TextLabel.Text = self.Text
		elseif self.Mode == typewriter.TypeModes.Continue then --fixing the FinishText to be compatible with Continue Mode
			self.TextLabel.Text = textLabelText..self.Text
		end
		
		self._finished = true
		Finish(self)
	end
end

return typewriter
