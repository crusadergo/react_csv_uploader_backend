class CreateCsv < ActiveRecord::Migration[6.1]
	def change
		create_table :csv do |t|
			t.binary :file, limit: 20.megabyte
			t.string :filename
			t.string :content_type
			t.string :headers

			t.timestamps
		end
	end
end
