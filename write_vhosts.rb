def compile(template, server_name:, proxy_to:)
  template
    .gsub(/SERVER_NAME/,  server_name)
    .gsub /PROXY_TO/,     proxy_to
end

template   = "vhost.conf.template"
output_tpl = "vhost.conf"

# proxy_rules = "localhost > localhost:9292" # sample rules

proxy_rules = ENV["PROXY_RULES"]
raise "PROXY_RULES not set" if !proxy_rules || proxy_rules.empty?

template = File.read template

output = ""

rules = proxy_rules.split(/\s+\|\s+/)
rules.each do |rule|
  server_name, proxy_to = rule.split /\s+>\s+/
  content = compile template, server_name: server_name, proxy_to: proxy_to
  output << "#{content}\n"
end

puts "Template:"
puts output

File.open output_tpl, "w" do |file|
  file.write output
end
