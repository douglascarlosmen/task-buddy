class Task < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true

    VALID_STATUSES = ['pending', 'in_progress', 'finished']

    validates :status, inclusion: { in: VALID_STATUSES }
end
