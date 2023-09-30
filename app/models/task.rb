class Task < ApplicationRecord   
    validates :title, presence: true
    validates :body, presence: true

    VALID_STATUSES = ['pending', 'in_progress', 'finished']

    validates :status, inclusion: { in: VALID_STATUSES }
    
    def empty?
        Task.count == 0
    end    
    
    def form_button_text
        if id.nil?
            "Criar Tarefa"
        else
            "Salvar Alterações" 
        end   
    end

    def status_color        
        case status
        when "pending"
            "warning"
        when "in_progress"
            "primary"
        when "finished"
            "success"
        end
    end

    def formatted_status
        case status
        when "pending"
            "Pendente"
        when "in_progress"
            "Em andamento"
        when "finished"
            "Concluída"
        end        
    end
end
