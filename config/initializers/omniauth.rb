Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Rails.application.secrets.twitter_api_key,
                     Rails.application.secrets.twitter_api_secret

  provider :linkedin, Rails.application.secrets.linkedin_api_key,
                      Rails.application.secrets.linkedin_api_secret

  provider :github, Rails.application.secrets.github_api_key,
                    Rails.application.secrets.github_api_secret,
                    scope: "user:email,user:follow"
end
