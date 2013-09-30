require 'open-uri'
class CollectionsController < ApplicationController


# WHEN INTERNET COMES BACK: <% page = Nokogiri::HTML(open(collection.link)) %>  <%= page.title %>j
  before_filter :authenticate_user! , :get_student
  # GET /collections
  # GET /collections.json
  def index
    @collections = @user.collections
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @collections }
    end
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
    @collection = @user.collections.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @collection }
    end
  end

  # GET /collections/new
  # GET /collections/new.json
  def new
    @collection = Collection.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @collection }
    end
  end

  # GET /collections/1/edit
  def edit
    @collection = Collection.find(params[:id])
  end

  # POST /collections
  # POST /collections.json
  def create
    @collection = Collection.new(params[:collection])
    @collection.user_id = current_user.id

    respond_to do |format|
      if @collection.save
        format.html { redirect_to @collection, notice: 'Collection was successfully created.' }
        format.json { render json: @collection, status: :created, location: @collection }
      else
        format.html { render action: "new" }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /collections/1
  # PUT /collections/1.json
  def update
    @collection = Collection.find(params[:id])

    respond_to do |format|
      if @collection.update_attributes(params[:collection])
        format.html { redirect_to @collection, notice: 'Collection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  def mail
    @collection = Collection.find(params[:id])

    Mail.defaults do
        delivery_method :smtp, { :address   => "smtp.sendgrid.net",
                           :port      => 587,
                           :domain    => "galiro.com",
                           :user_name => "galiro",
                           :password  => "",
                           :authentication => 'plain',
                           :enable_starttls_auto => true }
    end

    
          pie = @collection
          
    

    mail = Mail.deliver do
      to 'eldurotaduro@gmail.com'
      from 'Your Name <name@domain.com>'
      subject 'This is the subject of your email'
      text_part do
        body pie.name

      end
      html_part do
        content_type 'text/html; charset=UTF-8'
        body '<b>Hello world in HTML</b>'
      end
    end


  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy

    respond_to do |format|
      format.html { redirect_to collections_url }
      format.json { head :no_content }
    end
  end

  private
      # get_student converts the student_id given by the routing # into an @student object, for use here and in the view. 
      def get_student
       @user = current_user
      end
end
