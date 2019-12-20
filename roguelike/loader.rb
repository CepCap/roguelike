loader = Zeitwerk::Loader.new

Dir.glob('*').select { |f| File.directory? f }.each do |dir|
  loader.push_dir(dir)
end

loader.setup
