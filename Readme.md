SNU_ART Rails!!

# To Run

1. git clone https://github.com/lbyunsml/web_programming_team1/

2. git checkout new_snu_art

In `/snu_art`

3. `bundle install`

4. `rails db:migrate`

5. `rails db:reset`

6. `rails server`

7. localhost:3000/ 으로 접속

# Routes

artist

  |-- _errors.html.erb : error 템플릿

  |-- _nav.html.erb : navigation bar 템플릿
  
  |-- index.html.erb : main page
  
  |-- show.html.erb : artist/[:artist_id] : artist_id에 해당되는 아티스트의 페이지
  
  |-- new.html.erb : 새로운 아티스트 등록

artist/[:artist_id]/artwork/

  |-- index.html.erb : dummy, 들어가면 artist/[:artist_id]로 자동 redirect된다.
  
  |-- show.html.erb : artwork/[:id] : id에 해당되는 artwork.
  
  |-- new.html.erb : artist_id가 owner인 새로운 artwork 등록

category

  |-- index.html.erb : 카테고리 페이지를 보여준다. cat이라는 parameter를 Get방식으로 받는다.
  
sessions

  |-- /login : 해당 아이디 패스워드가 validate하면 세션을 시작한다.
  
  |-- /logout : 세션을 종료한다.

# Examples

http://localhost:3000/ : 메인페이지

http://localhost:3000/artist/1 : artist 1의 페이지

http://localhost:3000/artist/9/artwork/65 : 64번 작품의 페이지

http://localhost:3000/category?cat=metal : metal에 대한 카테고리

# 역할분담

기획 : 변승무, 박지수

자료 수집 : 김진모, 변승무

정적 페이지 제작 : 김진모, 변승무, 박지수, 김종석

이미지 업로드 기능 : 박지수

로그인 기능 : 김종석



# 개발노트

------- 명령어 정리 -------

`rails new snu_art`

모델추가

	`rails generate model Comment commenter:string body:text article:references`
    
    위치 app/models
    
디비 생성

	`rake db:migrate`

config/routes.rb:

    `resources :artist do

        resources :artwork
	
     end`
    
라우트 생성

	`rake routes`
    
controller 제작

	`rails generate controller Comment`
    
------- 디비 더미데이터 만들기 -------

db/seeds.rb에 더미데이터 넣기

디비 넣기

	`rake db:seed'
    
이때, 이미 들어있는 데이터도 다시 집어넣으므로, 한번 집어 넣은 것은 comment처리를 하자
    
	`rake db:reset`

디비를 seed안의 것으로 reset 한다. 이것을 쓰자.

db/developent.sqlite3

  sqlite를 뜯어볼 수 있는 프로그램(Ex.DB browser for SQLite)을 사용해서 modify가능


-------- 잡다 ----------

`rails generate controller category index` 하면 /category 를 다루는 컨트롤러와 index.html.erb가 생기고 routes.rb에도 자동으로 category/index가 생긴다. 근데 /category/index로 가야한다;;

`get 'category/' => 'category#index'` 이렇게 하면 된다! 직접 controller지정!!

Category에서 get방식으로 파라미터를 받음. 현재 photo, metal, oriental이 아니면 metal으로 자동으로 리다이렉트함.


`rails generate model Artwork name:string img_path:string description:string category:string artist:references`

:back의 경우 링크로 입력한경우에는 Nil을 가지게 된다. 따라서 링크를 마구 눌러 들어가는 경우를 exception하는 작업시 처리는 `root_path`로 redirect시켰다.

------- password --------

Artist의 로그인 아이디의 format체크 추가, password_digest 추가

Gemfile에  `gem 'bcrypt', '~> 3.1.7'` 추가.

bundle install

`rails generate migration add_password_digest_to_'databaseName' password_digest:string`추가

이후 rails db:migrate로 클래스모델 업데이트

------- image --------

paperclip gem 설치

`rails g paperclip class attachment`