class CreateCoins < ActiveRecord::Migration[7.0]
  def change
    create_table :coins do |t|
      t.string :description
      t.string :acronym
      t.string :url_image

      t.timestamps #Registra o log das mudanças no banco
    end
  end
end
