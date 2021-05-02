Rails.application.routes.draw do
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

	post '/upload_file', to: 'csv#upload_file'
	get '/files_list', to: 'csv#files_list'
	get '/file/:file_id', to: 'csv#file'
end
