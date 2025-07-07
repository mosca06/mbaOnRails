class StoriesController < ApplicationController
  before_action :set_story, only: %i[ show edit update destroy publish ]

  # GET /stories or /stories.json
  def index
    @stories = StoryQuery.call(params)
  end

  # GET /stories/1 or /stories/1.json
  def show
  end

  # GET /stories/new
  def new
    @story_form = StoryForm.new
  end

  # GET /stories/1/edit
  def edit
  end

  # POST /stories or /stories.json
  def create
    @story_form = StoryForm.new(story_params)

    respond_to do |format|
      if @story_form.save
        format.html { redirect_to stories_path, notice: "Story was successfully created." }
        format.json { render :show, status: :created, location: stories_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @story_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1 or /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_record_params)
        format.html { redirect_to @story, notice: "Story was successfully updated." }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1 or /stories/1.json
  def destroy
    @story.destroy!

    respond_to do |format|
      format.html { redirect_to stories_path, status: :see_other, notice: "Story was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def publish
    StoryPublisher.call(@story)
    redirect_to story_path(@story), notice: "Conto publicado!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def story_params
      params.require(:story_form).permit(:title, :body)
    end

    def story_record_params
      params.require(:story).permit(:title, :body)
    end
end
