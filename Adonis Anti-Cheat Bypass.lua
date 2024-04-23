repeat task.wait() until game:IsLoaded()
task.wait(3)

local GC, Raw = getgc(true), clonefunction(rawget)

for i = 1,#GC do
    local V = GC[i];

    if pcall(function() return Raw(V, "indexInstance") end) and type(Raw(V, "indexInstance")) == "table" and Raw(V, "indexInstance")[1] == "kick" then
        V.tvk = {"kick", function()
            rconsolewarn("Attempted Adonis Kick")
            return game:WaitForChild("")
        end};
	end;
end;

rconsoleprint("Adonis Anti-Cheat bypass is now ready.")
