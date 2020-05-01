Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['1079606655799-m982cafqivbnlpa5m0lh61nsniejgall.apps.googleusercontent.com'], ENV['HjvTCLuoP2oIVxfDKHYzfOIo']
  end