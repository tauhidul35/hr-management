module Admins
  class AttendancesController < Admins::ApplicationController
    def index
      @attendances = AttendanceRecord.all
    end

    def form; end

    def upload
      unless params[:file].respond_to?(:read)
        flash[:error] = 'File did not selected or bad file.'
        redirect_back fallback_location: root_url, allow_other_host: false
        return
      end

      save_record(params[:file].read)

      redirect_back(fallback_location: root_path,
                    flash: { success: 'Successfully added.' })
    end

    private

    def save_record(contents)
      contents.each_line do |line|
        data = line.strip.split(/ /)

        next unless data.first.to_i.to_s == data.first.to_s

        AttendanceRecord.find_or_create_by(
          emp_id: data[0].to_i,
          date: data[1],
          time: data[2]
        )
      end
    end
  end
end
