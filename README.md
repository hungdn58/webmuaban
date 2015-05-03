# webmuaban
Bài thực hành môn công nghệ phần mềm của nhóm Ruby

#Các thành viên : 
 1-Cao Minh Lâm
             2-Đỗ Ngọc Hùng (Nhóm trưởng)
             3-Trần Đồng Hưng
             4-Vũ Ngọc Đức

#Đề tài : Trang web cần mua.
#Ngôn ngữ : Ruby 2.0.0 (ngôn ngữ chính); html,css(ngôn ngữ phụ - dùng để thiết kế, làm đẹp giao diện)
#Framework : Rails - version 4.2.0

#Điều kiện để chạy chương trình mạng local : Máy phải cài Ruby on Rails(bất kì phiên bản) và một công cụ đê chạy server client(vd: MySQL Server, Wampserver, Xamp,...)

#Cách chạy chương trình(phải cài các phần mềm trên trước):
- Mở Command Prompt, trỏ vào thư mục project
- Gõ lần lượt các lệnh: bundle install -> rake db:migrate -> rails s
- Sau đó mở trình duyệt web gõ địa chỉ 'localhost:3000'
Đến đây là có thể thử các tính năng của chương trình rồi.

#Link demo sản phẩm: https://tattantat.herokuapp.com

#Cách chạy test với Rspec:
- Các test nằm trong thư mục spec
- Mở Command Prompt, trỏ vào thư mục project
- Gõ lần lượt các lệnh : rake db:migrate RAILS_ENV=test -> bundle exec rspec
(Cái này nếu nó hiện ra một loạt dòng lệnh thì cứ chờ nó chạy hết sẽ thấy nó báo kết quả ở đoạn cuối)

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

#Mục tiêu sprint 3 : Tạo form đăng sản phẩm cần mua.      

#User story: As a registered user, I want to post something I want to buy, so that everyone can see and contact to me.

.Feature: Post
   In order to post something
   As a registered user
   I want to see the page contains my post

   Scenario: Post
      Given I have logged in into the website
      And I have entered my name and the product that I want to buy in each field
      When I press the button 'Create Post'
      Then the result should be the page with my post and the comment field

#Mục tiêu sprint 4 :
- Hoàn thiện chức năng Send email (email confirm account và forgot password).
- Hoàn thiện Test cho project
- Cài đặt Test coverage report

#User story: 
+ As a registered user, I want to receive an email confirm my account when I created account successfully, so that I can verify my account and continue shopping.
+ As a registered user, I want to receive an email reset password when I forgot my password, so that I can change my password and sign in to my account.

#Link video báo cáo : 
+ Sprint 2 : https://youtu.be/BEtk1sjzyrA
+ Sprint 3 : https://www.youtube.com/watch?v=A1XocFFuISo&feature=youtu.be

#Link biên bản họp: 
+ Lần 1 : https://docs.google.com/document/d/1sgWrxIkFCB3A7lOqx869b3K8gExd5ncLFZ7RKTwixwM/edit?usp=sharing
+ Lần 2 : https://docs.google.com/document/d/1GKUS6HM4G-Mtw6YxD6T_6YXxQ2uf3WCXNuV_cQgM5wI/edit?usp=sharing
+ Lần 3 : https://docs.google.com/document/d/1VLB88cEn9HrtZrLx1JrV8ehFrQ-i2AWLzRmaUHxOqzw/edit?usp=sharing
