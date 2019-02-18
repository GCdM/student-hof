class Student < ApplicationRecord
    has_many :contributions
    has_many :projects, through: :contributions

    after_initialize :generate_slug, if: :new_record?

    def generate_slug
        new_slug = self.base_slug
        duplicates = Student.find_by_baseslug(new_slug)

        if duplicates.length > 0
            new_slug += '-' + (duplicates.length + 1).to_s
        end

        self.slug = new_slug
        self.save
    end

    def base_slug
        self.name.strip.downcase.gsub(/\W+/, '-')
    end

    def self.find_by_slug(search_slug)
        Student.all.find_by(slug: search_slug)
    end

    def self.find_by_baseslug(search_slug)
        Student.all.select do |student|
            student.base_slug === search_slug
        end
    end
end
