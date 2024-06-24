local lapis = require("lapis")
local app = lapis.Application()
local db = require("lapis.db")
local cjson = require("cjson")
app:enable("etlua")
app.layout = require "views.layout"

app:get("/", function(self)
  self.page_title = "Hello, World!"
  self.welcome_message = "Welcome to my dynamic Lapis page!"
  print("Page Title:", self.page_title)       -- Debugging statement
  print("Welcome Message:", self.welcome_message) -- Debugging statement
  return { render = "index" }
end)

app:get("/list", function(self)
  return { render = "list" }
end)

app:get("/basic", function(self)
  return { render = "basic" }
end)

app:get("/query", function(self)
  local res, err = db.query("select * from DATABASECHANGELOG")
  if not res then
    return { json = { error = err } }
  end
  self.results = res
  return { render = "query" }
end)


return app



