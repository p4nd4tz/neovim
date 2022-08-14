local status_ok, inlay_hints = pcall(require, "inlayhints")
if not status_ok then
  return
  print("inlayhints not found")
end

inlay_hints.setup()
