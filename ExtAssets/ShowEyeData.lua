function EyeData()
  emu.drawString(16, 4, "camX: " .. emu.read(0x0685, cpu))
  local objectOffset = 255
  for objectTypeAddr = 0x048F, 0x049B, 1 do
    local objectType = emu.read(objectTypeAddr, cpu)
    if( objectType == 0x18 ) then
      objectOffset = objectTypeAddr - 0x048F
      local actionStep = (emu.read(0x049C + objectOffset, cpu) & 0x38) >> 3
      local xyPosition = emu.read(0x041A + objectOffset, cpu) .. "," .. emu.read(0x0441 + objectOffset, cpu)
      emu.drawString(16, 16, "Eye action step: " .. actionStep, 0xFFFFFF)
      emu.drawString(16, 28, "Eye position: " .. xyPosition, 0xFFFFFF)
      
    end
  end
  if( objectOffset == 255 ) then
    emu.drawString(16, 16, "Eye not found", 0xFFFFFF)
  end
end


emu.addEventCallback(EyeData, emu.eventType.endFrame)
emu.displayMessage("Script", "Show eye data")
