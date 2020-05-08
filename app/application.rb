
class Application
  @@items = [Item.new("Banana", 1.29), Item.new("Avocado", 10.0)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)



    if req.path.match(/items/)
      # binding.pry
      search = req.path.split("/items/").last
      if item = @@items.find{|i| i.name == search}
        resp.write item.price
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
    
  end
end