# http://railscasts.com/episodes/291-testing-with-vcr

VCR.configure do |c|
  c.cassette_library_dir = Rails.root.join("spec", "vcr")
  c.stub_with :fakeweb
  c.filter_sensitive_data('<TR_SECRET>') { TASKRABBIT['secret'] }
  c.filter_sensitive_data('<TR_KEY>') { TASKRABBIT['key'] }
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.around(:each, :vcr) do |example|
    name = example.metadata[:full_description].split(/\s+/, 2).join("/").underscore.gsub(/[^\w\/]+/, "_")
    options = example.metadata.slice(:record, :match_requests_on).except(:example_group)
    VCR.use_cassette(name, options) { example.call }
  end
end
