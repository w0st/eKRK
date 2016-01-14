class ProgramyStudiowController < ApplicationController

  # Invoke like this: http://localhost:3000/programy_studiow/1.pdf
  # Where 1 is id of program_studiow
  def show
    respond_to do |format|
      # disable html view
      # format.html
      # only pdf view?
      format.pdf do
        render pdf: 'orders',
               encoding: 'utf8',
               layout: 'pdf' # uses views/layouts/pdf.erb
      end
    end
  end
end
