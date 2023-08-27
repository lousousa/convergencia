return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 10,
  height = 6,
  tilewidth = 128,
  tileheight = 128,
  nextlayerid = 4,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "tileset-predio",
      firstgid = 1,
      class = "",
      tilewidth = 128,
      tileheight = 128,
      spacing = 0,
      margin = 0,
      columns = 1,
      image = "../images/game/tileset-predio.png",
      imagewidth = 128,
      imageheight = 128,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 128,
        height = 128
      },
      properties = {},
      wangsets = {},
      tilecount = 1,
      tiles = {}
    },
    {
      name = "tileset-parede",
      firstgid = 2,
      class = "",
      tilewidth = 128,
      tileheight = 128,
      spacing = 0,
      margin = 0,
      columns = 4,
      image = "../images/game/tileset-parede.png",
      imagewidth = 512,
      imageheight = 256,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 128,
        height = 128
      },
      properties = {},
      wangsets = {},
      tilecount = 8,
      tiles = {}
    },
    {
      name = "tileset-portoes",
      firstgid = 10,
      class = "",
      tilewidth = 128,
      tileheight = 128,
      spacing = 0,
      margin = 0,
      columns = 6,
      image = "../images/game/tileset-portoes.png",
      imagewidth = 768,
      imageheight = 512,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 128,
        height = 128
      },
      properties = {},
      wangsets = {},
      tilecount = 24,
      tiles = {}
    },
    {
      name = "checkpoint",
      firstgid = 34,
      class = "",
      tilewidth = 128,
      tileheight = 128,
      spacing = 0,
      margin = 0,
      columns = 1,
      image = "../images/game/checkpoint.png",
      imagewidth = 128,
      imageheight = 128,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 128,
        height = 128
      },
      properties = {},
      wangsets = {},
      tilecount = 1,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 10,
      height = 6,
      id = 1,
      name = "layer1",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
        2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 10,
      height = 6,
      id = 3,
      name = "layer2",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 22, 23, 24, 0, 0, 0, 0,
        0, 0, 0, 28, 29, 30, 0, 0, 0, 0,
        0, 0, 34, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
