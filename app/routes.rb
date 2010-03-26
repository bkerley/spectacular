route '/', HelloController, :index
route '/accept', HelloController, :accept
route /too+t/, TootController, :toot
route //, ErrorController, :not_found
