ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :uid

  form do |f|
    f.inputs "The stuff..." do
      f.input :email
      f.input :uid
    end
    para "Press cancel to return to the list without saving."
    actions
  end
end
