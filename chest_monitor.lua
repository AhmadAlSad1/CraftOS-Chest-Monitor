function print_inventory_on_monitor(chest, monitor)
    monitor.clear()

    local items = chest.list()

    local x, y = 1, 1

    for _, item in pairs(items) do
        local name = string.gsub(item.name, "minecraft:", "")
        local count = item.count

        monitor.setCursorPos(x, y)
        monitor.write(count .. "x " .. name)

        y = y + 1
    end
end

while true do
    local monitor = peripheral.find("monitor")
    local chest = peripheral.find("chest")

    if monitor and chest then
        print_inventory_on_monitor(chest, monitor)
    else
        print("Monitor or chest not found!")
    end

    sleep(10)
end