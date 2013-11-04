# encoding: utf-8
module MongoidIntegerId::Id
  extend ActiveSupport::Concern

  included do
    field :site_id, type: Integer

    scope :without_site_id, where(:site_id.exists => false)

    before_validation :generate_site_id, unless: "site_id.present?"

    index({ site_id: 1 }, unique: true, background: true, name: "site_id_index")
    validates :site_id, uniqueness: true, presence: true
  end

  module ClassMethods
    def generate_new_site_id
      all.without_options.desc(:site_id).only(:site_id).limit(1).first.try(:site_id).to_i + 1
    end

    def fill_missing_site_ids
      all.without_site_id.order_by(id: :asc).only(:id).map do |obj|
        generate_new_site_id.tap { |new_site_id| obj.update_attribute(:site_id, new_site_id) }
      end
    end
  end

  protected

    def generate_site_id
      self.site_id = self.class.generate_new_site_id
    end
end
