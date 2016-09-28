puts "Глава 12. Графические Интерфейсы Для Ruby"

puts
puts "12.1. Ruby/Tk"

puts
puts "12.1.1. Обзор"

puts
puts "12.1.2. Простое Оконное Приложение"

#   require 'tk'
 
#   root = TkRoot.new() { title "Today's Date" }
#   str = Time.now.strftime("Today is \n%B %d, %Y")
#   lab = TkLabel.new(root) do
#    text str
#    pack("padx" => 15, "pady" => 10, "side" => "top")
#   end
#   btn_OK = TkButton.new do
#   	text "OK"
#   	command (proc {puts "User speak OK"})
#   	pack("side" => "left")
#   end
#   Tk.mainloop

 puts
 puts "Листинг 12.1. Имитация Термостата"

# require 'tk'

# Top = {'side' => 'top', 'padx' => 5, 'pady' => 5}
# Left = {'side' => 'left', 'padx' => 5, 'pady' => 5}
# Bottom = {'side' => 'bottom', 'padx' => 5, 'pady' => 5}

# temp = 74

# root = TkRoot.new {title "Термостат"}

# top = TkFrame.new(root) {background "#606060"}
# bottom = TkFrame.new(root)

# tlab = TkLabel.new(top) do
# 	text temp.to_s
# 	font "{Arial} 54 {bold}"
# 	foreground "green"
# 	background "#606060"
# 	pack Left
# end

#TkLabel.new(top) do
#	text "o"
#	font "{Arial} 14 {bold}"
# 	foreground "green"
# 	background "#606060"
# 	pack Left.update({'anchor' => 'n'})
# end

# TkButton.new(bottom) do
# 	text " Up "
# 	command proc {tlab.configure("text" => (temp+=1).to_s)}
# 	pack Left
# end

# TkButton.new(bottom) do
# 	text "Down"
# 	command proc {tlab.configure("text" => (temp-=1).to_s)}
# 	pack Left
# end

# top.pack Top
# bottom.pack Bottom

# Tk.mainloop

 puts
 puts "12.1.4. Текстовые Поля"

 puts "Листинг 12.2. Имитация Telnet-Клиента"

 #require "tk"
 
  # def packing(padx, pady, side=:left, anchor=:n)
  #  { "padx" => padx, "pady" => pady,
  #    "side" => side.to_s, "anchor" => anchor.to_s }
  # end
 
  # root = TkRoot.new() { title "Telnet session" }
  # top = TkFrame.new(root)
  # fr1 = TkFrame.new(top)
  # fr1a = TkFrame.new(fr1)
  # fr1b = TkFrame.new(fr1)
  # fr2 = TkFrame.new(top)
  # fr3 = TkFrame.new(top)
  # fr4 = TkFrame.new(top)
 
  # LabelPack = packing(5, 5, :top, :w)
  # EntryPack = packing(5, 2, :top)
  # ButtonPack = packing(15, 5, :left, :center)
  # FramePack = packing(2, 2, :top)
  # FramelPack = packing(2, 2, :left)
 
  # var_host = TkVariable.new
  # var_port = TkVariable.new
  # var_user = TkVariable.new
  # var_pass = TkVariable.new
 
  # lab_host = TkLabel.new(fr1a) do
  #  text "Host name"
  #  pack LabelPack
  # end
 
  # ent_host = TkEntry.new(fr1a) do
  #  textvariable var_host
  #  font "{Arial} 10"
  #  pack EntryPack
  # end
 
  # lab_port = TkLabel.new(fr1b) do
  #  text "Port"
  #  pack LabelPack
  # end
 
  # ent_port = TkEntry.new(fr1b) do
  #  width 4
  #  textvariable var_port
  #  font "{Arial} 10"
  #  pack EntryPack
  # end
 
  # lab_user = TkLabel.new(fr2) do
  #  text "User name"
  #  pack LabelPack
  # end
 
  # ent_user = TkEntry.new(fr2) do
  #  width 21
  #  font "{Arial} 12"
  #  textvariable var_user
  #  pack EntryPack
  # end
 
  # lab_pass = TkLabel.new(fr3) do
  #  text "Password"
  #  pack LabelPack
  # end
 
  # ent_pass = TkEntry.new(fr3) do
  #  width 21
  #  show "*"
  #  textvariable var_pass
  #  font "{Arial} 12"
  #  pack EntryPack
  # end
 
  # btn_signon = TkButton.new(fr4) do
  #  text "Sign on"
  #  command proc {} # Ничего не делает!
  #  pack ButtonPack
  # end
 
  # btn_cancel = TkButton.new(fr4) do
  #  text "Cancel"
  #  command proc { exit } # Просто выход.
  #  pack ButtonPack
  # end
 
  # top.pack FramePack
  # fr1.pack FramePack
  # fr2.pack FramePack
  # fr3.pack FramePack
  # fr4.pack FramePack
  # fr1a.pack FramelPack
  # fr1b.pack FramelPack
 
  # var_host.value = "addison-wesley.com"
  # var_user.value = "debra"
  # var_port.value =23
 
  # ent_pass.focus
  # foo = ent_user.font
 
  # Tk.mainloop

   puts
   puts "12.1.5. Прочие Виджеты"

  #    require 'tk'
 
  # root = TkRoot.new { title "Checkbutton demo" }
  # top = TkFrame.new(root)
 
  # PackOpts = { "side" => "top", "anchor" => "w" }
 
  # cb1var = TkVariable.new
  # cb2var = TkVariable.new
  # cb3var = TkVariable.new
 
  # cb1 = TkCheckButton.new(top) do
  #  variable cb1var
  #  text "Информатика"
  #  command { puts "Button 1 = #{cb1var.value}" }
  #  pack PackOpts 
  # end
 
  # cb2 = TkCheckButton.new(top) do
  #  variable cb2var
  #  text "Музыка"
  #  command { puts "Button 2 = #{cb2var.value}" }
  #  pack PackOpts
  # end
 
  # cb3 = TkCheckButton.new(top) do
  #  variable cb3var
  #  text "Литература"
  #  command { puts "Button 3 = #{cb3var.value}" }
  #  pack PackOpts
  # end
 
  # top.pack PackOpts
 
  # Tk.mainloop
   
puts "Листинг 12.4. Переключатели В Tk"

#   require 'tk'
 
#   root = TkRoot.new() { title "Radiobutton demo" }
#   top = TkFrame.new(root)
 
#   PackOpts = { "side" => "top", "anchor" => "w" }
 
#   major = TkVariable.new
 
#   b1 = TkRadioButton.new(top) do
#    variable major
#    text "Информатика"
#    value 1
#    command { puts "Major = #{major.value}" }
#    pack PackOpts
#   end
 
#   b2 = TkRadioButton.new(top) do
#    variable major
#    text "Музыка"
#    value 2
#    command { puts "Major = #{major.value}" }
#    pack PackOpts
#   end
 
#   b3 = TkRadioButton.new(top) do
#    variable major
#    text "Литература"
#    value 3
#    command { puts "Major = #{major.value}" }
#    pack PackOpts
#   end
 
#   top.pack PackOpts
 
#   Tk.mainloop

   puts
   puts "12.2. Ruby/GTK2"

puts
puts "12.2.2. Простое Оконное Приложение"

#$KCODE = "U"
#require "gtk2"
#Gtk.init

#window = Gtk::Window.new("Today's Date")
#window.signal_connect("destroy") {Gtk.main_quit}
#str = Time.now.strftime("Today os \n%B %d, %Y")
#window.add(Gtk::Label.new(str))
#window.set_default_size(200, 200)
#window.show_all
#Gtk.main

puts
puts "12.2.3. Кнопки"
puts "Листинг 12.5. Кнопки В GTK"

#$KCODE = "U"
#require "gtk2"

#class SampleWindow < Gtk::Window

#  def initialize
#    super("Ruby/GTK2 Sample")
#    signal_connect("destroy") {Gtk.main_quit}

#    entry = Gtk::Entry.new

#    button = Gtk::Button.new("All Caps!")
#    button.signal_connect("clicked") {
#     entry.text = entry.text.upcase
#    }

#    box = Gtk::VBox.new
#    box.add(Gtk::Label.new("Text: "))
#    box.add(entry)
#    box.add(button)
#    add(box).show_all
#  end
#end

#Gtk.init
#SampleWindow.new
#Gtk.main

puts
puts "12.2.4. Текстовые Поля"
puts "Листинг 12.6. Текстовый Редактор В GTK"

#$KCODE = "U"
#require "gtk2"

#class TextWindow < Gtk::Window

#  def initialize
#    super("Ruby/GTK2 Text Sample")
#    signal_connect("destroy") {Gtk.main_quit}
#    set_default_size(200,100)
#    @text = Gtk::TextView.new
#    @text.wrap_mode = Gtk::TextTag::WRAP_WORD

#    @buffer = @text.buffer
#    @buffer.signal_connect("changed") {
#      @status.text = "Lenght: " + @buffer.char_count.to_s
#    }

#    @buffer.create_tag('notice',
#      'font' => "Times Bold Italic 18",
#      'foreground' => "red")

#    @status = Gtk::Label.new

#    scroller = Gtk::ScrolledWindow.new
#    scroller.set_policy(Gtk::POLICY_AUTOMATIC, Gtk::POLICY_NEVER)
#    scroller.add(@text)

#    box = Gtk::VBox.new
#    box.add(scroller)
#    box.add(@status)
#    add(box)

#    iter = @buffer.start_iter
#    @buffer.insert(iter, "This is an editor")
#    iter.offset = 5
#    @buffer.insert(iter, "really", "notice")

#    show_all
#  end
#end

#Gtk.init
#TextWindow.new
#Gtk.main

puts
puts "12.2.5. Прочие Виджеты"
puts "Листинг 12.7. Заказ Билета На Самолет"

#$KCODE = "U"
#require 'gtk2'

#class TicketWindow < Gtk::Window

#  def initialize
#    super("Purchase Ticket")
#    signal_connect("destroy") {Gtk.main_quit}

#    dest_model = Gtk::ListStore.new(String, String)
#    dest_view = Gtk::TreeView.new(dest_model)
#    dest_column = Gtk::TreeViewColumn.new("Destination",
#      Gtk::CellRendererText.new,
#      :text => 0)
#    dest_view.append_column(dest_column)
#    country_column = Gtk::TreeViewColumn.new("Country",
#      Gtk::CellRendererText.new,
#      :text => 1)
#    dest_view.append_column(country_column)
#    dest_view.selection.set_mode(Gtk::SELECTION_SINGLE)
#    [["Cairo", "Egypt"], ["New York", "USA"], ["Tokyo", "Japan"]].each do |destination, country|
#      iter = dest_model.append
#      iter[0] = destination
#      iter[1] = country
#    end
#    dest_view.selection.signal_connect("changed") do
#      @city = dest_view.selection.selected[0]
#    end

#    @round_trip = Gtk::CheckButton.new("Round Trip")

#    purchase = Gtk::Button.new("Purchase")
#    purchase.signal_connect("clicked") {cmd_purchase}
#    @result = Gtk::Label.new

#    @coach = Gtk::RadioButton.new("Coach class")
#    @business = Gtk::RadioButton.new(@coach, "Business class")
#    @first = Gtk::RadioButton.new(@coach, "First class")

#    flight_box = Gtk::VBox.new
#    flight_box.add(dest_view).add(@round_trip)
#
#    seat_box = Gtk::VBox.new
#    seat_box.add(@coach).add(@business).add(@first)
#
#    top_box = Gtk::HBox.new
#    top_box.add(flight_box).add(seat_box)
#
#    main_box = Gtk::VBox.new
#    main_box.add(top_box).add(purchase).add(@result)

#    add(main_box)
#    show_all
#  end

#  def cmd_purchase
#    text = @city
#    if @first.active?
#      text += ": first class"
#    elsif 
#      @business.active?
#      text += ": business class"
#    elsif 
#      @coach.active?
#      text += ": coach"
#    end
#    text += ", round trip " if @round_trip.active?
#    @result.text = text
#  end
#end


#Gtk.init
#TicketWindow.new
#Gtk.main

puts "Листинг 12.8. Пример Меню В GTK"

#$KCODE = "U"
#require "gtk2"

#class MenuWindow < Gtk::Window
#  def initialize
#    super("Ruby/GTK2 Menu Sample")
#    signal_connect("destroy") {Gtk.main_quit}

#    file_exit_item = Gtk::MenuItem.new("_Exit")
#    file_exit_item.signal_connect("activate") {Gtk.main_quit}

#    file_menu = Gtk::Menu.new
#    file_menu.add(file_exit_item)

#    file_exit_item = Gtk::MenuItem.new("_File")
#    file_exit_item.submenu = file_menu

#    menubar = Gtk::MenuBar.new
#    menubar.append(file_exit_item)
#    menubar.append(Gtk::MenuItem.new("_Nothing"))
#    menubar.append(Gtk::MenuItem.new("_Useless"))

 #   tooltips = Gtk::Tooltips.new
#    tooltips.set_tip(file_exit_item, "Exit the app", "")

#    box = Gtk::VBox.new
#    box.pack_start(menubar, false, false, 0)
#    box.add(Gtk::Label.new("Try the menu and tooltips"))
#    add(box)
#    set_default_size(300,100)
#    show_all
#  end
#end

#Gtk.init
#MenuWindow.new
#Gtk.main

puts
puts "12.3. FXRuby (FOX)"

puts "12.3.2. Простое Оконное Приложение"

#require "fox16"

#include Fox
#application = FXApp.new
#main = FXMainWindow.new(application, "Today's Date")
#str = Time.now.strftime("&Today is %B %d, %Y")
#button = FXButton.new(main, str)
#button.connect(SEL_COMMAND) {application.exit}
#application.create 
#main.show(PLACEMENT_SCREEN)
#application.run 

puts "12.3.3. Кнопки"
puts "Листинг 12.9. Обновление Состояния Интерфейса В FOX"
#require 'fox16'
#include Fox

#class TwoButtonUpdateWindow < FXMainWindow

#  def initialize(app)
#    super(app, "Update Example", nil, nil, DECOR_TITLE | DECOR_CLOSE)

#    @button_one = FXButton.new(self, "Enable Button2")
#    @button_one_enabled = true

#    @button_two = FXButton.new(self, "Enable Button1")
#    @button_two.disable
#    @button_two_enabled = false

#    @button_one.connect(SEL_COMMAND, method(:onCommand))
#    @button_two.connect(SEL_COMMAND, method(:onCommand))
#    @button_one.connect(SEL_UPDATE, method(:onUpdate))
#    @button_two.connect(SEL_UPDATE, method(:onUpdate))
#  end

#  def onCommand(sender, sel, ptr)
#    @button_one_enabled = !@button_one_enabled
#    @button_two_enabled = !@button_two_enabled
#  end

#  def onUpdate (sender, sel, ptr)
#    @button_one_enabled?
#    @button_one.enable : @button_one.disable
#    @button_two_enabled?
#    @button_two.enable : @button_two.disable
#  end
#end

#application = FXApp.new
#main = TwoButtonUpdateWindow.new(application)
#application.create
#main.show(PLACEMENT_SCREEN)
#application.run 

puts
puts "12.3.4. Текстовые Поля"
      
puts "12.3.5. Прочие Виджеты"

#require 'fox16'
#include Fox

#application = FXApp.new
#main = FXMainWindow.new(application, "Simple Menu")
#menubar = FXMenuBar.new(main, LAYOUT_SIDE_TOP | LAYOUT_FILL_X)
#filemenu = FXMenuPane.new(main)
#quit_cmd = FXMenuCommand.new(filemenu, "&Quit\tCtl-Q")
#quit_cmd.connect(SEL_COMMAND) {application.exit}
#FXMenuTitle.new(menubar, "&File", nil, filemenu)
#application.create
#main.show(PLACEMENT_SCREEN)
#application.run

puts "Листинг 12.10. Переключатели В FOX"

#require 'fox16'

#include Fox

#class RadioButtonHandlerWindow <FXMainWindow
#  def initialize(app)
#    super(app, "Radio Button Handler", nil, nil, DECOR_TITLE | DECOR_CLOSE)

#    choices = ["good", "better", "best"]
#    default_choice = 0
#    @choice = FXDataTarget.new{default_choice}

#    group = FXGroupBox.new(self, "Radio Test Group", LAYOUT_SIDE_TOP | FRAME_GROOVE | LAYOUT_FILL_X)

#     choices.each_with_index do |choice, index|
#      FXRadioButton.new(group, choice,
#       @choice, FXDataTarget::ID_OPTION+index,
#       ICON_BEFORE_TEXT |
#       LAYOUT_SIDE_TOP)
#    end
#  end
#end

#application = FXApp.new
#main = RadioButtonHandlerWindow.new(application)
#application.create
#main.show(PLACEMENT_SCREEN)
#application.run

puts
puts "Листинг 12.12. Виджет FXList"

#require 'fox16'

#include Fox

#class ListHandlerWindow < FXMainWindow

#  def initialize(app)
#    super(app, "list Handler", nil, nil, DECOR_TITLE | DECOR_CLOSE)

#    @list = FXList.new(self, nil, 0, LIST_EXTENDEDSELECT | LAYOUT_FILL_X)

#    @list.connect(SEL_COMMAND) do |sender, sel, pos|
#      puts pos.to_s + " => " + @names[pos]
#    end

#    @names = ["Chuck", "Sally", "Franklin",
#      "Schroeder", "Woodstock",
#      "Matz", "Lucy"]
#    @names.each {|name| @list << name}
#  end
#end

#application = FXApp.new
#main = ListHandlerWindow.new(application)
#application.create
#main.show(PLACEMENT_SCREEN)
#application.run 

puts "Листинг 12.13. Модальные И Немодальные Диалоги"

#require 'fox16'

#include Fox

#class NonModalDialogBox < FXDialogBox

#  def initialize(owner)
#    super(owner, "Test of Dialog Box", DECOR_TITLE | DECOR_BORDER)

#    text_options = JUSTIFY_RIGHT | FRAME_SUNKEN | FRAME_THICK | LAYOUT_SIDE_TOP
#    @text_field = FXTextField.new(self, 20, nil, 0, text_options)
#    @text_field.text = ""

#    layout_options = LAYOUT_SIDE_TOP | FRAME_NONE |
#      LAYOUT_FILL_X | LAYOUT_FILL_Y |
#      PACK_UNIFORM_WIDTH
#     layout = FXHorizontalFrame.new(self, layout_options)

#    options = FRAME_RAISED | FRAME_THICK | LAYOUT_RIGHT | LAYOUT_CENTER_Y
#    hide_btn = FXButton.new(layout, "&Hide", nil, nil, 0, options)
#    hide_btn.connect(SEL_COMMAND) {hide}
#  end

#  def text
#    @text_field.text
#  end
#end

# class ModalDialogBox < FXDialogBox
 
#    def initialize(owner)
     # Сначала вызвать инициализатор базового класса.
#     super(owner, "Test of Dialog Box",
#      DECOR_TITLE|DECOR_BORDER)
 
#     text_options = JUSTIFY_RIGHT | FRAME_SUNKEN |
#      FRAME_THICK | LAYOUT_SIDE_TOP
#     @text_field = FXTextField.new(self, 20, nil, 0,
#      text_options)
#     @text_field.text = ""
 
#     layout.options = LAYOUT_SIDE_TOP | FRAME_NONE |
#      LAYOUT_FILL_X | LAYOUT_FILL_Y |
#      PACK_UNIFORM_WIDTH
#     layout = FXHorizontalFrame.new(self, layout_options)
 
#     options = FRAME_RAISED | FRAME_THICK |
#      LAYOUT_RIGHT | LAYOUT_CENTER_Y
 
#     cancel_btn = FXButton.new(layout, "&Cancel", nil,
#      self, 0, options)
#     cancel_btn.connect(SEL_COMMAND) do
#      app.stopModal(self, 0)
#      hide
#     end
 
#     accept_btn = FXButton.new(layout, "&Accept", nil,
#      self, 0, options)
#     accept_btn.connect(SEL_COMMAND) do
#      app.stopModal(self, 1)
#      hide
#     end
#    end
 
#    def text
#     @text_field.text
#    end
#   end

#class DialogTestWindow < FXMainWindow

#  def initialize(app)
#     # Сначала инициализировать базовый класс.
#     super(app, "Dialog Test", nil, nil,
#      DECOR_ALL, 0, 0, 400, 200)
 
#     layout_options = LAYOUT_SIDE_TOP | FRAME_NONE |
#      LAYOUT_FILL_X | LAYOUT_FILL_Y |
#      PACK_UNIFORM_WIDTH
#     layout = FXHorizontalFrame.new(self, layout_options)
#     button_options = FRAME_RAISED | FRAME_THICK |
#      LAYOUT_CENTER_X | LAYOUT_CENTER_Y
#     nonmodal_btn = FXButton.new(layout, "&Non-Modal Dialog...", nil,
#      nil, 0, button_options)
#     nonmodal_btn.connect(SEL_COMMAND) do
#      @non_modal_dialоg.show(PLACEMENT_OWNER)
#     end
 
#     modal_btn = FXButton.new(layout, "&Modal Dialog...", nil,
#      nil, 0, button_options)
#     modal_btn.connect(SEL_COMMAND) do
#      dialog = ModalDialogBox.new(self)
#      if dialog.execute(PLACEMENT_OWNER) == 1
#       puts dialog.text
#      end
#     end
 
#     getApp.addTimeout(1000, method(:onTimer))
#     @non_modal_dialog = NonModalDialogBox.new(self)
#  end

#  def onTimer(sender, sel, ptr)
#    text = @non_modal_dialog.text
#    unless text == @previous
#      @previous = text
#      puts @previous
#    end
#    getApp.addTimeout(1000, method(:onTimer))
#  end

#  def create
#    super
#    show(PLACEMENT_SCREEN)
#  end
#end

#application = FXApp.new
#DialogTestWindow.new(application)
#application.create
#application.run

puts
puts "12.4. QtRuby"

puts
puts "12.4.2. Простое Оконное Приложение"

# Гем не работает с Вин8, нужна версия mswin32.

puts 
puts "12.5. Другие Библиотеки Для Создания Графических Интерфейсов"
