class CsvController < ApplicationController
    def upload_file
        file = params["csv"]

        return render(json: {message: "It's not CSV format: #{file.content_type}"}, status: 500) unless file.content_type == 'application/octet-stream'

        csv = Csv.create(file: file.tempfile, filename: file.original_filename, content_type: file.content_type, headers: file.headers)

        render(json: {message: "File '#{file.original_filename}' successfully uploaded!", file: csv}, status: :ok)
    end
end
