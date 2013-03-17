class RenameCurentLoginColumn < ActiveRecord::Migration

  def change
    change_table :users do |u|
      u.rename :curent_login_at, :current_login_at
    end
  end

end
