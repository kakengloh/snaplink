class CreateSlugSequence < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      CREATE SEQUENCE slug_seq;
    SQL
  end

  def down
    execute <<-SQL
      DROP SEQUENCE slug_seq;
    SQL
  end
end
