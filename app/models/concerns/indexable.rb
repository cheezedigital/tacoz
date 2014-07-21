module Indexable
  extend ActiveSupport::Concern

  include do
    after_update :update_search_index
  end

  def update_search_update
    IndexWorker.perform_async(self.id, self.class.name)
  end

end
