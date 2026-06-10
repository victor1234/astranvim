-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
local s = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.33.4-standalone-strict/"
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    ---@diagnostic disable: missing-fields
    config = {
      yamlls = {
        settings = {
          yaml = {
            schemas = {
              [s .. "namespace-v1.json"] = { "apps/**/namespace.yaml" },
              [s .. "deployment-apps-v1.json"] = { "apps/**/deployment.yaml" },
              [s .. "service-v1.json"] = { "apps/**/service.yaml" },
              [s .. "persistentvolumeclaim-v1.json"] = { "apps/**/storage.yaml" },
              [s .. "ingress-networking-v1.json"] = { "apps/**/ingress.yaml" },
            },
          },
        },
      },
    },
  },
}
