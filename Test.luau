--[[
    @Author: Bytegeist (@roblox_user_5618502527)
    
    @Description: This is a publicly released template I created recently
    @Description: for OOP libraries in Roblox.

    @Example:
    ```luau
        local Test = require(path.to.Test)
        Test()
    ```
]]
--!strict
--!optimize 2


--[[ @section Types ]]
type InputCallbackType = <T>(self: Test, input: T) -> (Test)
type OutputCallbackType = (self: Test) -> (Test)

type UtilitiesSchema
= {
    __call: OutputCallbackType,

    __add: InputCallbackType,
    __sub: InputCallbackType,

    __mul: InputCallbackType,
    __div: InputCallbackType
}

type TestSchema
= {
    [number]: any,

    a1: "1a",
    b2: "2b",
    c3: "3c"
}

type Test = setmetatable
<
    TestSchema,

    {
        __call: OutputCallbackType,

        __add: InputCallbackType,
        __sub: InputCallbackType,

        __mul: InputCallbackType,
        __div: InputCallbackType,

        __index: { This: "..." }
    }
>
--[[ @end_section Types ]]


--[[ @section Variables ]]
local Utilities = {} :: UtilitiesSchema
local Constructor = {}

local Test: TestSchema
= {
    a1 = "1a",
    b2 = "2b",
    c3 = "3c"
}
--[[ @end_section Variables ]]


--[[
    @NOTE: Section documentation, not function-specific.

    Usage: Lorem ipsum dolor sit amet, consectetur adipiscing elit,
    param    input    <T>?
    Return: Test
]]
--[[ @section Utilities ]]
function Utilities:__call(): (Test)
    print(self)

    return self
end

function Utilities:__add<T>(input: T): Test
    table.insert(self, input)

    return self
end

function Utilities:__sub<T>(input: T): Test
    table.insert(self, input)

    return self
end

function Utilities:__mul<T>(input: T): Test
    table.insert(self, input)

    return self
end

function Utilities:__div<T>(input: T): Test
    table.insert(self, input)

    return self
end
--[[ @end_section Utilities ]]


--[[ @section Constructor ]]
--[[
    Usage: Create a new test.
    Return: Test
]]
function Constructor:__call(): Test
    local NewTest = setmetatable(Test,
        {
            __call = Utilities.__call,

            __add = Utilities.__add,
            __sub = Utilities.__sub,

            __mul = Utilities.__mul,
            __div = Utilities.__div,

            __index = { This = "..." }
        }
    )

    -- Trying out functionality.
    do
        NewTest += "[+] Added"
        NewTest -= "[-] Added"

        NewTest *= "[*] Added"
        NewTest /= "[/] Added"

        NewTest()
    end

    return NewTest
end

setmetatable(Test, { __call = Constructor.__call })
--[[ @end_section Constructor ]]


table.freeze(Test)
return Test
