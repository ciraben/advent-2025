require_relative "solve/helpers"

save_path = ARGV[0]

input = data "9"

coords = input.strip.split.map { |e| e.sub /\,/, " " }
max_width = coords.map { |e| e.split.first.to_i }.max
max_height = coords.map { |e| e.split.last.to_i }.max
coords_text = coords.join " L"

svg_boilerplate = <<TEXT
<svg height="#{max_height + 20}" width="#{max_width + 20}" xmlns="http://www.w3.org/2000/svg">
  <path d="M#{coords_text} Z"
  style="fill:none;stroke:black;stroke-width:20" />
</svg>
TEXT

html_boilerplate = <<TEXT
<html>
<body>
  <img src="#{save_path}" style="width:100%">
</body>
</html>
TEXT

File.open(save_path, "w") do |f|
    f.write(svg_boilerplate)
end

File.open(save_path, "w") do |f|
    f.write(html_boilerplate)
end
