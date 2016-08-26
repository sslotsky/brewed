require 'csv'
require 'upsert/active_record_upsert'

def process_csv(filename)
  full_path = File.join(Rails.root, 'lib', 'ingredient_data', filename)
  CSV.foreach(full_path, headers: true) { |line| yield line }
end

process_csv('fermentables.csv') do |f|
  Fermentable.upsert({ name: f['name'].strip }, ppg: f['ppg'].to_i, color: f['color'].to_i, created_at: Time.now, updated_at: Time.now)
end

process_csv('hops.csv') do |h|
  Hop.upsert({ name: h['name'].strip }, alpha: h['alpha'].to_f, created_at: Time.now, updated_at: Time.now)
end

process_csv('yeasts.csv') do |y|
  Yeast.upsert({ name: y['name'].strip }, attenuation: y['attenuation'].to_f, created_at: Time.now, updated_at: Time.now)
end

process_csv('extras.csv') do |e|
  Extra.upsert({ name: e['name'].strip }, created_at: Time.now, updated_at: Time.now)
end