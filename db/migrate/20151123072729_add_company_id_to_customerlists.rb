class AddCompanyIdToCustomerlists < ActiveRecord::Migration
  def change
    add_reference :customerlists, :company, index: true, foreign_key: true
  end
end
