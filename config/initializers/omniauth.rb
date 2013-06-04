require 'json'  # Work around - remove in production

def ominiauth_wrapper(app_id, app_secret)

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook,  app_id, app_secret, :image_size => 'large'
    end
end

OmniAuth.config.logger = Rails.logger
filename = Rails.root.to_s + "/public/extras/vars.json"
if File.exists?(filename)
    OmniAuth.config.logger.info "FACEBOOK Will use JSON"
    vars_hash = JSON.parse( IO.read(filename) )


    OmniAuth.config.logger.info "APP_ID %s \n SECRET_ID %s" % ([vars_hash["app_id"], vars_hash["app_secret"]])
    ENV['FACEBOOK_APP_ID'] = vars_hash["app_id"]
    ENV['FACEBOOK_SECRET'] = vars_hash["app_secret"]
else
    OmniAuth.config.logger.info "FACEBOOK Will use environment variables"
end

ominiauth_wrapper(ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'])


