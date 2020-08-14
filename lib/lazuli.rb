require 'vacuum'
require 'erb'
require 'parseconfig'

class Config
  def initialize
    path = File.join(
      File.expand_path("~"),
      ".lazuli.conf"
    )
    @config = ParseConfig.new(path)
  end
  def get_access_key 
    return @config['access_key']
  end
  def get_secret_key 
    return @config['secret_key']
  end
  def get_partner_tag 
    return @config['partner_tag']
  end
end

class AmazonConnector
  def fetch_items(keyword, access_key, secret_key, partner_tag)
    request = Vacuum.new(marketplace: 'DE',
                         access_key: access_key,
                         secret_key: secret_key,
                         partner_tag: partner_tag)

    response = request.search_items(title: keyword, keyword: keyword, resources: [
      'ItemInfo.ProductInfo',
      'ItemInfo.Title',
      'Offers.Listings.Price',
      'Images.Primary.Large',
    ])

    data = JSON.parse(response, symbolize_keys: true)
    return data["SearchResult"]["Items"]
  end
end

class TemplateGenerator
  def initialize(template_filename, article, dest_filename)
    read_template_from_file(template_filename)
    output = generate_template(article)
    write_output(dest_filename, output)
  end
  def read_template_from_file(template_filename)
    file = File.open(template_filename)
    @template = file.read()
  end
  def generate_template(article)
    price = article["Offers"]["Listings"][0]["Price"]["Amount"]
    details_page_url = article["DetailPageURL"]
    image_url = article["Images"]["Primary"]["Large"]["URL"]
    title = article["ItemInfo"]["Title"]["DisplayValue"]
    brand = "default"
    date = Time.new.to_s
    renderer = ERB.new(@template)
    return renderer.result(binding)
  end
  def write_output(filename, output)
    file = File.open(filename, "w")
    file.write(output)
  end
end

class CLI 
  def print_choices(items)
    index = 1
    items.each do |item|
      puts index.to_s + ". " + (item["ItemInfo"]["Title"]["DisplayValue"])[0..50]
      index += 1
    end
    return items
  end

  def prompt(prompt)
    puts "[*] " + prompt + ": "
    return gets.gsub("\n", '')
  end
  
  def dialog()
    config = Config.new 

    template = prompt("Template file")
    query = prompt("Query")

    items = AmazonConnector. new.fetch_items(
      query.to_s,
      config.get_access_key,
      config.get_secret_key,
      config.get_partner_tag,
    )
    print_choices(items)

    selected_index = prompt("Index of product").to_i
    output_file = prompt("Output destination")
    TemplateGenerator. new(template, items[selected_index - 1], output_file)
  end
end
