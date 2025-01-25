require "rqrcode"

user_choice = ""

while user_choice != "I'm done" 
  if user_choice != "I'm done"
    puts "What would you like to create today?"
    puts "1 = visit a site; 2 = join a network; 3 = send a message; 4 = exit program"
    user_choice = gets.chomp
    if user_choice == "1"
      puts "please enter a URL"
      user_input = gets.chomp
      qrcode = RQRCode::QRCode.new(user_input)
      png = qrcode.as_png({:size => 500})
      IO.binwrite("usergeneration.png", png.to_s)
      puts "QR generated. Please scan now!"
    elsif user_choice == "2"
      puts "please enter the network's name and then password" 
      wifi_name = gets.chomp
      wifi_password = gets.chomp
      wifi_entry = "WIFI:T:WPA;S: #{wifi_name};P: #{wifi_password};;"
      qrcode = RQRCode::QRCode.new(wifi_entry)
      png = qrcode.as_png({:size => 500})
      IO.binwrite("usergeneration.png", png.to_s)
    elsif user_choice == "3"
      puts "please enter the recipient's phone number and then the message content"
      phone_number = gets.chomp 
      message = gets.chomp
      phone_entry = "SMSTO: #{phone_number}: #{message}"
      qrcode = RQRCode::QRCode.new(phone_entry)
      png = qrcode.as_png({:size => 500})
      IO.binwrite("usergeneration.png", png.to_s)
    elsif user_choice == "4"
      puts "thanks for coming by"
      exit
    elsif user_choice == "I'm done"
      puts "thanks for coming by"
      exit
    else
      puts "we don't recognize that input. please try again"
    end
  end
end
