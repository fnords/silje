# Description: Jekyll plugin to replace Markdown image syntax with HTML markup, written to work combined with Jekyll Picture Tag
# https://gist.github.com/YJPL/48718e28d2b2fda3476aceac018c8f26#file-img_tag_tansform-rb

Jekyll::Hooks.register :documents, :pre_render do |document, payload|
  docExt = document.extname.tr('.', '')
  # only process if we deal with a markdown file
  if payload['site']['markdown_ext'].include? docExt
    newContent = document.content.gsub(/!\[(.*)\]\(([^\)]+)\)(?:{:([^}]+)})*/, '{% picture default \2 --alt \1 --link \2 %}')
    document.content = newContent
  end
end
