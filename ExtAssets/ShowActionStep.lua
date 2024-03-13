function PlayerActionStep()
  local actionStep = (emu.read(0x049C, cpu) & 0x38) >> 3
  emu.drawString(16,32, "Player action step: " .. actionStep, 0xFFFFFF)
end

emu.addEventCallback(PlayerActionStep, emu.eventType.endFrame)
emu.displayMessage("Script", "Show player action step")
