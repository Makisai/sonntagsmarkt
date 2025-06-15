class PrintoutsController < ApplicationController
  def show
    respond_to do |format|
      format.html
      format.pdf do
        html_content = render_to_string(
          template: "printouts/show",
          layout: "layouts/pdf",
          formats: [:html],)
        pdf = Grover.new(html_content, browser_ws_endpoint:, format: "A3", print_background: true, focus: "#loaded")

        send_data pdf.to_pdf, filename: "Printout.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  def browser_ws_endpoint
    if Rails.env.production?
      # Use the production WebSocket endpoint
    else
      "ws://localhost:3001/chrome"
    end
  end
end
