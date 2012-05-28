class CreateTrackings < ActiveRecord::Migration
  def change
    create_table :trackings do |t|
      t.string :sourcefile
      t.string :filetype
      t.text :notes
      t.datetime :ftpqueue
      t.datetime :ftpstart
      t.datetime :ftpcomplete
      t.datetime :importqueue
      t.datetime :importstart
      t.datetime :importcomplete

      t.timestamps
    end
  end
end
