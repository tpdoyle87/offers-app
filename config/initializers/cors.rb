# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://127.0.0.1:5173', 'http://localhost:3000' # Add your front-end origin here

    resource '*',
             headers: :any,
             expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'],
             methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
