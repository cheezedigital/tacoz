class IndexWorker
  include Sidekiq::Worker
  #IndexWorker.perform_async(3, "MenuItem")
  def perform(id, record_class_name)
    @record = record_class_name.safe_constantize.find(id)
    @record.update_pg_search_document
  end

end
