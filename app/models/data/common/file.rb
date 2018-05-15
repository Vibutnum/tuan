class Data::Common::File < ActiveRecord::Base
  self.table_name = 'data_common_files'
  
  class << self
    def banners(file_id)
      JSON.parse(self.find(file_id).content) rescue []
    end
  end
end