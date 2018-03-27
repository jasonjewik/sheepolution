--! file: example.lua

--accessible by main.lua because it is a global variable by default
test = 20;
--not accessible because we add 'local' in front of it
local exam = 0;

return exam;
