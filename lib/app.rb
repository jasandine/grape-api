module API 
  class App < Grape::API
    use Rack::Config do |env|
      env['api.tilt.root'] = File.join Dir.pwd, "lib/views"
    end

    resource :files do 
      post '/', rabl: "assets/item" do
        @asset = Asset.new params[:file]
        @asset.save

        @asset.inspect
      end
    end
  end
end