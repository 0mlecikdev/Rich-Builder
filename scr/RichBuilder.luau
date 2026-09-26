local RichBuilder = {}

RichBuilder.__index = RichBuilder

export type Builder = typeof(setmetatable(
	{} :: {
		Parts: { string },
	},
	RichBuilder
	))

function RichBuilder.new(): Builder
	return setmetatable({
		Parts = {}
	}, RichBuilder)
end

function RichBuilder:text(text: string): Builder
	table.insert(self.Parts, text)
	
	return self	
end

function RichBuilder:bold(text: string): Builder
	table.insert(self.Parts, `<b>{text}</b>`)

	return self	
end

function RichBuilder:italic(text: string): Builder
	table.insert(self.Parts, `<i>{text}</i>`)

	return self	
end

function RichBuilder:strikethrough(text: string): Builder
	table.insert(self.Parts, `<s>{text}</s>`)

	return self	
end

function RichBuilder:underline(text: string): Builder
	table.insert(self.Parts, `<u>{text}</u>`)

	return self	
end


function RichBuilder:color(color: Color3, text: string): Builder
	local color = "#" .. color:ToHex()
	
	table.insert(self.Parts, `<font color="{color}">{text}</font>`)
	
	return self
end

function RichBuilder:size(size: number, text: string): Builder
	table.insert(self.Parts, `<font size="{size}">{text}</font>`)

	return self
end

function RichBuilder:transparency(transparency: number, text: string): Builder
	table.insert(self.Parts, `<font transparency="{transparency}">{text}</font>`)

	return self
end

function RichBuilder:Build(): string
	return table.concat(self.Parts)
end

return RichBuilder
