class MusicRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_music_record, only: [:show, :edit, :update, :destroy]

  def index
    @music_records = MusicRecord.order(:created_at).page(params[:page]).per(10)
  end
  def new
    @music_record = MusicRecord.new
  end

  def create
    @music_record = MusicRecord.new(music_record_params)
    if @music_record.save
      redirect_to @music_record, notice: 'Music record was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @music_record.update(music_record_params)
      redirect_to @music_record, notice: 'Music record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @music_record.destroy
    redirect_to music_records_url, notice: 'Music record was successfully destroyed.'
  end

  def book
    # TODO: Implement the book action
  end

  private

  def set_music_record
    @music_record = MusicRecord.find(params[:id])
  end

  def music_record_params
    params.require(:music_record).permit(:title, :artist, :genre, :release_date)
  end

  def ensure_admin
    unless current_user.has_role?(:admin)
      redirect_to root_path, alert: 'Only admins can perform this action.'
    end
  end
end