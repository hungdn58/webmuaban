# webmuaban
Bài thực hành môn công nghệ phần mềm của nhóm Ruby

#Các thành viên : 1-Cao Minh Lâm
				 2-Đỗ Ngọc Hùng (Nhóm trưởng)
				 3-Trần Đồng Hưng
				 4-Vũ Ngọc Đức

#Đề tài : Trang web cần mua.
#Ngôn ngữ : Ruby 2.0.0 (ngôn ngữ chính); html,css(ngôn ngữ phụ - dùng để thiết kế, làm đẹp giao diện)
#Framework : Rails - version 4.2.0

#Điều kiện để chạy chương trình lần này : Máy phải cài Ruby on Rails(bất kì phiên bản) và một công cụ đê chạy server client(vd: MySQL Server, Wampserver, Xamp,...)
(Do chưa tìm được host nên chương trình mình vẫn chạy trên client server cho nên mới phải cài các phần mềm trên)

#Cách chạy chương trình(phải cài các phần mềm trên trước):
- Mở Command Prompt, trỏ vào thư mục project
- Gõ lần lượt các lệnh: bundle install -> rake db:seed -> rails s
- Sau đó mở trình duyệt web gõ địa chỉ 'localhost:3000'
Đến đây là có thể thử các tính năng của chương trình rồi.

#Cách chạy test:
- Mở Command Prompt, trỏ vào thư mục project
- Gõ lần lượt các lệnh : rake db:migrate ENV['RAILS_ENV'] ||= 'test' -> rake test
(Do ở sprint này nhóm vẫn làm theo kiểu code trước test sau nên khi chạy test vẫn có lỗi và nhóm sẽ sửa lỗi nhanh nhất có thể)

#Mục tiêu sprint 2 : Tạo form đăng nhập và đăng kí

#User story: As a registered user, I want to subscribe to the webite, so that I can buy anything I want.

.Feature: Login
   In order to subcribe to the website
   As a registered user
   I want to see the welcome page

   Scenario: Log in
      Given I have entered my user name into the User name field
      And I have entered my email into the Email field
      When I press Login
      Then the reult should be the welcome page on screen

.Feature: Sign up
   In order to create new user
   As a new user
   I want to see the notification

   Scenario: Create user
      Given I have entered my user name  and email to each field
      And I have entered the password and pasword confirmation to each field
      When I press Create User
      Then the result should be the page with the notify that I have successful create new user


#Link video báo cao : https://youtu.be/BEtk1sjzyrA

#Link biên bản họp: 
+ Lần 1 : https://docs.google.com/document/d/1sgWrxIkFCB3A7lOqx869b3K8gExd5ncLFZ7RKTwixwM/edit?usp=sharing
+ Lần 2 : https://docs.google.com/document/d/1GKUS6HM4G-Mtw6YxD6T_6YXxQ2uf3WCXNuV_cQgM5wI/edit?usp=sharing
Biên bản lần 3 sẽ được cập nhật ngay sau khi họp xong 