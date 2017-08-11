class ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_review

  def create
    unless Report.already_reported?(@review.id, current_user.id)
      @report = @review.reports.new
      @report.user = current_user

      respond_to do |format|
        format.js { increment_report_count if @report.save }
      end
    end
  end

  private
    def increment_report_count
      @review.report_count += 1
      @review.save
    end

    def set_review
      @review = Review.find(params[:review_id])
    end
end
