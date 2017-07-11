class AddJobDescriptionToInvoices < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :job_description, :text, null: false
  end
end
