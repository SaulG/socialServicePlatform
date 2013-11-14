module PruebaHelper
    def get_programs_available
        @programs = Program.all
    end
end
