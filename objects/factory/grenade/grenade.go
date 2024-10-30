components {
  id: "grenade"
  component: "/objects/factory/grenade/grenade.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"grenade\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/objects/textures/main.atlas\"\n"
  "}\n"
  ""
  scale {
    x: 0.1
    y: 0.1
  }
}
