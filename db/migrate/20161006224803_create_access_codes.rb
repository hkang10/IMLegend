class CreateAccessCodes < ActiveRecord::Migration
  def change
    create_table :access_codes do |t|
      t.string :code
    end
  end
end
