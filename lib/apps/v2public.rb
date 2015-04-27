module API
  class AppV2Public < Grape::API
    version :v2, using: :path
    resources :files do
      get "/:id/download" do
        file = Asset[params[:id]]
        path = file.file_url.gsub("public/","")

        redirect path
      end
    end
  end
end