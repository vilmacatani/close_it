require "httparty"
require 'json'

class CrunchbaseApi

  def self.organization_summary

    key = "https://api.crunchbase.com/v3.1/odm-organizations?user_key=38db4d15fdad030d92cdd22e20b64a56"
    response = HTTParty.get(key,
              headers: {
                'X-cb-user-key' => '0b5041bde0103ab6e54fd62b44897169',
                'Content-Type' => 'application/json'
              })

    data = JSON.parse(response.body)
  end

end


# class OutlookApi
#   # this url lets you grant a user consent for an API permission
#   # https://login.microsoftonline.com/e2e7ffba-4d13-406e-b24f-914520995aa8/oauth2/v2.0/authorize?client_id=23a747d7-babb-47c7-b320-b270eb47ad9a&response_type=token&scope=https://graph.microsoft.com/Mail.Read.Shared&state=12345&nonce=678910&response_mode=form_post

#   # research inbox all messsages
#   def self.research_emails(token)
#     response = HTTParty.get("https://graph.microsoft.com/v1.0/users/research@independentresearchforum.com/messages?top=60",
#                             # bcf7e833-49bb-4a98-8080-54729fe7f5f5
#                             headers: {
#                               'Accept' => 'application/json',
#                               'Authorization' => "Bearer #{token}"
#                             })
#     JSON.parse(response.body)
#   end
# end
