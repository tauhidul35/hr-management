class AttendancesController < ApplicationController
  def index; end

  def form; end

  def upload
    file_data = params[:file]
    if file_data.respond_to?(:read)
      contents = file_data.read
    elsif file_data.respond_to?(:path)
      contents = File.read(file_data.path)
    else
      logger.error "Bad file_data: #{file_data.class.name}: #{file_data.inspect}"
    end

    contents.each_line do |line|
      data = line.strip.split(/ /)

      next unless data.first.to_i.to_s == data.first.to_s

      AttendanceRecord.find_or_create_by(
        emp_id: data[0].to_i,
        date: data[1],
        time: data[2]
      )
    end

    redirect_back(fallback_location: root_path)
  end

  private

  def integer?(string)
    Integer(string)
    true
  rescue
    false
  end
end
