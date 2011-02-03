if Rails.env.development?
ActionView::Helpers::AssetTagHelper.register_javascript_expansion   :jquery => %w(jquery jquery-ui rails)
else
ActionView::Helpers::AssetTagHelper.register_javascript_expansion   :jquery => 
  %w(http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js
   http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.8/jquery-ui.min.js   
   rails)
end
