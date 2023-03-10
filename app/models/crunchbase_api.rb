require "httparty"
require 'json'
require "uri"
require "net/http"
require "cgi"

class CrunchbaseApi

  def self.organization_summary
    user_key = "38db4d15fdad030d92cdd22e20b64a56"
    limit = 10
    industry = CGI.escape("Delivery")
    url = "https://api.crunchbase.com/api/v4/autocompletes?query=#{industry}&collection_ids=categories&limit=#{limit}&user_key=#{user_key}"
    response = HTTParty.get(url,
              headers: {
                'Accept' => 'application/json'
              })
  end
end

# airbnb uuid: bcb617c3-9e43-d5b0-1d14-82b795f2642f

# curl -X 'GET' \
#   'https://api.crunchbase.com/api/v4/autocompletes?query=energy&collection_ids=categories,category_groups&user_key=38db4d15fdad030d92cdd22e20b64a56' \
#   -H 'accept: application/json'

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

# require "uri"
# require "net/http"

# url = URI("https://api.crunchbase.com/api/v4/autocompletes?query=renewable%20energy&collection_ids=categories%2Ccategory_groups&limit=10&user_key=38db4d15fdad030d92cdd22e20b64a56")

# https = Net::HTTP.new(url.host, url.port)
# https.use_ssl = true

# request = Net::HTTP::Get.new(url)
# request["accept"] = "application/json"

# response = https.request(request)
# puts response.read_body
