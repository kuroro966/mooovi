class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
        has_one_attached :image #Userのﾚｺｰﾄﾞと画像が結び付く？登録時の <%= f.file_field :image %>でアップしてる画像。
          
        validates :nickname, presence: true #nickname情報が無い場合はエラーになるようにする
        
        has_many :reviews

end
