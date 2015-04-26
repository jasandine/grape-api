collection @assets

attributes :title, :id, :file


# not necissary anymore?
# child(:file) { |file| file.file.url rescue "N/A" }