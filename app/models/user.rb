class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  rolify
  ROLES = [:assistant, :supervisor, :auditor, :advanced, :admin  ]

  scope :has_role, lambda{|role| includes(:roles).where(:roles => { :name=> role })}

end
