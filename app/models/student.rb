class Student < User
    attr_accessible :enrollment, :institution_name
    validates :enrollment, :institution_name, presence: true
    has_one :institution
    def institution_name
        category.try(:name)
    end
    def institution_name=(name)
        self.category = Category.find_or_create_by_name(name) if name.present?
    end
end
