class ChangePasswordToPasswordDigest < ActiveRecord::Migration[6.0]
  def change
  	change_table :customers do |t|
  		t.rename :password, :password_digest
  	end
  end
end
