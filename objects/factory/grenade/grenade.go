components {
  id: "grenade"
  component: "/objects/factory/grenade/grenade.script"
}
components {
  id: "trail_maker"
  component: "/hyper_trails/trail_maker.script"
  properties {
    id: "use_world_position"
    value: "true"
    type: PROPERTY_TYPE_BOOLEAN
  }
  properties {
    id: "segment_length_max"
    value: "10.0"
    type: PROPERTY_TYPE_NUMBER
  }
}
components {
  id: "trail_mesh"
  component: "/hyper_trails/models/trail_mesh.mesh"
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
    x: 0.025
    y: 0.025
  }
}
