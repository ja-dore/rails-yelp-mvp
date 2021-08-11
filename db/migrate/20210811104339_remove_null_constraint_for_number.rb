class RemoveNullConstraintForNumber < ActiveRecord::Migration[6.0]
  def change
    change_column_null :restaurants, :phone_number, true
  end
end
