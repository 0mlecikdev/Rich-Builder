# Rich Builder

![Luau](https://img.shields.io/badge/Luau-000000?style=for-the-badge&logo=roblox&logoColor=white)

Rich Builder is a tool for creating custom rich-text elements in Roblox

## Example

```luau
const RichBuilder = require("@game/ReplicatedStorage/Packages/RichBuilder")

local text = PlayerHUD:WaitForChild("Template")
text.RichText = true
text.Text = RichBuilder.new()
	:text("Hello ")
	:color(Color3.fromRGB(255, 0, 0), " World!")
	:Build()
```
