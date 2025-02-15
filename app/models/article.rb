class Article < ApplicationRecord
    include Visible
  
    has_many :comments, dependent: :destroy
  
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }

    # 検索可能なカラムを許可
    def self.ransackable_attributes(auth_object = nil)
      %w[title body status created_at updated_at]
    end
    
    # 検索可能なアソシエーション（関連）を許可
    def self.ransackable_associations(auth_object = nil)
      [] # アソシエーションを使わない場合は、これでOK
    end
  end