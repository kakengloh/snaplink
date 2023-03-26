# frozen_string_literal: true

# Service to generate unique slug by hashing PostgreSQL sequence
class SlugGenerator
  HASH_SALT = 'SHORT_LINK_SLUGS'

  def execute
    result = ActiveRecord::Base.connection.execute("SELECT nextval('slug_seq')")
    Hashids.new(HASH_SALT, 6).encode(result.values)
  end
end
