class Student < ActiveRecord::Base
    attr_accessible :user_id, :enrollment, :institution_name, :institution_id, :status_progress_id
    belongs_to :user
    has_and_belongs_to_many :programs
    validates :enrollment, presence: true
    before_save do
        :check_if_institution_exists_and_save_id
        :default_values
    end

    def check_if_institution_exists_and_save_id
        institution_db = Institution.find_by_name(@institution_name)
        if institution_db
            self.institution_id = institution_db.id
         else
            institution = create_institution(:name => @institution_name)
            self.institution_id = institution.id
        end
    end
    def default_values
        self.status_progress_id ||= StatusProgress.find_by_name('seleccion').id
    end
    def institution_name
        @institution_name
    end
    def institution_name=(name)
        @institution_name = name
    end
end
