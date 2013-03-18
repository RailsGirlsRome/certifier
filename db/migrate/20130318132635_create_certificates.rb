class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
