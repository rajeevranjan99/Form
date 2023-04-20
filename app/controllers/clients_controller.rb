class ClientsController < ApplicationController
  def index
    @client=Client.all

  end
  def show
    @client=Client.find(params[:id])
  end

  def new
    @client=Client.new
    @address=@client.addresses.new
  end

def create
  @client=Client.new(client_params)
  @adderess=@client.addresses.new(address_params)
  if @client.save
    redirect_to @client
  else
      render :new, status: :unprocessable_entity
  end
end


  def edit
    @client=Client.find(params[:id])
  end

  def update
    @client=Client.find(params[:id])
    if @client.update(client_params)
      redirect_to @client
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to clients_path, status: :see_other
  end

    private
      def client_params
        params.require(:client).permit(:name, :phone)
      end
      def address_params
        params[:client].require(:address).permit(:city, :pincode)
      
      end

end
