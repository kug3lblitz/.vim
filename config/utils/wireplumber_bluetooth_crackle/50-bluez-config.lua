--wp_list.insert(wp.config.rules, {
  --matches = {
    --{ { "node.name", "matches", "bluez*"} }
  --},
  --apply_properties = {
    --["audio.format"] = "S16LE"
  --}
--})

wp_list.insert(wp.config.rules, {
  matches = {
    {
      { "node.name", "equals", "bluez_output.10_94_97_69_21_E6.1" }
    }
  },
  apply_properties = {
    ["audio.format"] = "S16LE"
  }
})
