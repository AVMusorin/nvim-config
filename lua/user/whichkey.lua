local status_ok, which_key = pcall(require, "which_key")
if not status_ok then
  return
end

which_key.setup {}
