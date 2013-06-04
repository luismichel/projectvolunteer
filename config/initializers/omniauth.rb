
def ominiauth_wrapper(app_id, app_secret)

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook,  app_id, app_secret, :image_size => 'large'
    end
end

OmniAuth.config.logger = Rails.logger
filename = Rails.root.to_s + "/config/initializers/vars.volunteer.txt"
if File.exists?(filename)
    OmniAuth.config.logger.info "FACEBOOK Will use file"
    vars = Array.new
    File.foreach(filename) do |line|
        vars << line.chop if line.length > 1
    end
    OmniAuth.config.logger.info "APP_ID %s \n SECRET_ID %s" % ([vars[0], vars[1]])
    ENV['FACEBOOK_APP_ID'] = vars[0]
    ENV['FACEBOOK_SECRET'] = vars[1]
else
    OmniAuth.config.logger.info "FACEBOOK Will use environment variables"
end

ominiauth_wrapper(ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'])


