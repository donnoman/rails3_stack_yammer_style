Sass::Plugin.options[:template_location] = './app/stylesheets'
Sass::Plugin.remove_template_location('./app/stylesheets')

Sass::Plugin.add_template_location(
  Rails.root.join('./app/stylesheets').to_s,
  Rails.root.join('./tmp/stylesheets').to_s)
