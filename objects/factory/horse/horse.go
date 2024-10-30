components {
  id: "horse"
  component: "/objects/factory/horse/horse.script"
}
embedded_components {
  id: "horse_name"
  type: "label"
  data: "size {\n"
  "  x: 128.0\n"
  "  y: 32.0\n"
  "}\n"
  "pivot: PIVOT_S\n"
  "text: \"THE HORSEST HORSE\\n"
  "\"\n"
  "  \"TO EVER HORSE\"\n"
  "font: \"/objects/fonts/ui_so_smol.font\"\n"
  "material: \"/builtins/fonts/label-df.material\"\n"
  ""
  position {
    y: 46.0
  }
}
embedded_components {
  id: "horse_sprite"
  type: "sprite"
  data: "default_animation: \"horse\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "size {\n"
  "  x: 360.0\n"
  "  y: 360.0\n"
  "}\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/objects/textures/horses.atlas\"\n"
  "}\n"
  ""
  scale {
    x: 0.25
    y: 0.25
  }
}
