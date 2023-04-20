class PersonController < ApplicationController
end
params = ActionController::Parameters.new({
    person: {
      name: "Francesco",
      age:  22,
      role: "admin"
    }
  })
  
  permitted = params.require(:person).permit(:name, :age)
