class ContactsController < ApplicationController
  
  def index
    @contact = Contact.new
    @all_contacts = Contact.all.length
  end
  
  def create
    @contact = Contact.new(params[:contact])
  
    logger.info(@contact)
    
    respond_to do |format|
      if @contact.save
        format.html { redirect_to(root_url, :notice => 'Added.') }
        format.xml  { render :xml => @contact, :status => :created, :location => @contact }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
