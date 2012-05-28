class Tracking < ActiveRecord::Base
  attr_accessible :filetype, :ftpcomplete, :ftpqueue, :ftpstart, :importcomplete, :importqueue, :importstart, :notes, :sourcefile
end
