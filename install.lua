local url = "https://raw.githubusercontent.com/AhmadAlSad1/CraftOS-Chest-Monitor/main/chest_monitor.lua"
local installPath = "/chest_monitor.lua"
local startupPath = "/startup.lua"

print("Downloading chest_monitor.lua...")
local response = http.get(url)
if response then
    local file = fs.open(installPath, "w")
    file.write(response.readAll())
    file.close()
    response.close()
    print("Download complete.")
else
    error("Failed to download chest_monitor.lua.")
end

print("Creating startup.lua...")
local file = fs.open(startupPath, "w")
file.write("shell.run(\"" .. installPath .. "\")")
file.close()
print("startup.lua created.")

print("Installation complete.")