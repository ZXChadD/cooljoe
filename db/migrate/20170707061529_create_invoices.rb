class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.references :provider, foreign_key: true
      t.references :joblisting, foreign_key: true
      t.string :invoice_ref, null:false
      t.decimal :price, precision: 10, scope: 2,  null:false
      t.integer :status, null:false, default: 1

      t.timestamps
    end
  end
end
