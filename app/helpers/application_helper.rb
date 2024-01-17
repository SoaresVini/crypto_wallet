module ApplicationHelper
    def data_br(data_us)
        data_us.strftime("%d/%m/%Y")
    end

    def ambiente_rails 
        Rails.env.development? ? "Desenvolvimento" : "Teste"
    end

    def locale(locale)
        locale == :en ? "Estados Unidos" : "Português do Brasil"
    end

end
