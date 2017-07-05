class CatRentalRequest < ActiveRecord::Base
  validates_presence_of CatRentalRequest.attribute_names - ["id", "created_at", "updated_at"]
  validates_inclusion_of :status, :in => %w(APPROVED DENIED PENDING)
  validate :does_not_overlap_approved_request

  belongs_to :cat


  def overlapping_requests
    CatRentalRequest.where.not("cat_rental_requests.end_date <= :start_date or start_date >= :end_date", start_date: self.start_date, end_date: self.end_date)
    .where("cat_id = #{self.cat_id}")
    .where.not(id: self.id)
    # .where("id != :id", id: self.id)
  end

  def overlapping_approved_requests
    self.overlapping_requests.where("status = 'APPROVED'")
  end

  def does_not_overlap_approved_request
    unless overlapping_approved_requests.empty?
      errors.add(:overlapping_approved_requests, "There are overlapping approved requests")
      return errors
    end
  end

  def approve!
    overlapping_requests.each do |request|
      request.update(status: "DENIED")
    end
    self.update(status: "APPROVED")
  end

  def deny!
    self.update(status: "DENIED")
  end

end
