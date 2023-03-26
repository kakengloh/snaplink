# Service to track link visits
class LinkTracker
  def initialize(slug, attributes)
    @slug = slug
    @attributes = attributes
  end

  def execute
    link = Link.find_by_slug!(@slug)

    ActiveRecord::Base.transaction do
      link.with_lock do
        link.increment!(:clicks)
      end

      link.visits.create!(@attributes)
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.error(e)
      raise ActiveRecord::Rollback
    end
  end
end
