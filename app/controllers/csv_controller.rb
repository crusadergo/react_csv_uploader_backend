class CsvController < ApplicationController
    def upload_file
        file = params["csv"]

        return render(json: {message: "It's not CSV format: #{file.content_type}"}, status: 500) unless file.content_type == 'application/octet-stream'

        csv = Csv.create(file: file.tempfile.read, filename: file.original_filename, content_type: file.content_type, headers: file.headers)

        render(json: {message: "File '#{file.original_filename}' successfully uploaded!", file: csv}, status: :ok)
    end

    def files_list
        data = []
        Csv.all.each do |csv|
            data << { id: csv.id, file: csv.file, filename: csv.filename }
        end
        render(json: {message: "Files list", files: data }, status: :ok)
    end

    def file
        file_id = params["file_id"]

        csv = Csv.find(file_id)

        render(json: {message: 'Csv file', id: csv.id, file: csv.file, filename: csv.filename}, status: :ok)
    end
end
