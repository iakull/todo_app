class Todo < ApplicationRecord
    belongs_to :projects, optional: true
end
