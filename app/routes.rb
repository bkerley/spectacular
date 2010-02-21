route '/', HelloController, :index
route /too+t/, TootController, :toot
route //, ErrorController, :not_found
