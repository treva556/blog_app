Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
       origins 'http://localhost:5173' # 'https://your-frontend-domain.com' # Add allowed frontend origins here
      resource '*',
               headers: :any,
               methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
  end