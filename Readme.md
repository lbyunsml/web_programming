Rails!!

artist
  |-- _nav.html.erb : navigation bar 템플릿
  |-- index.html.erb : main page
  |-- show.html.erb : artist/[:id] : id에 해당되는 아티스트의 페이지
  |-- new.html.erb : 현재 등록되어있는 아티스트들을 보여준다.
  
artist/artist_id/artwork : 현재 artist_id에 해당되는 그림들을 모두 보여준다.

category
  |-- index.html.erb : 모든 Artwork를 보여준다.

Example site
localhost:3000/
http://localhost:3000/artist/new : 현재 db에 있는 artist들의 것을 보여주는 페이지 
http://localhost:3000/artist/1 : artist 1의 페이지
http://localhost:3000/artist/1/artwork : artist1이 그린 그림들 목록
http://localhost:3000/category?cat=metal : metal에 대한 카테고리



------ 명령어 정리 -------

`rails new snu_art`
모델추가
	`rails generate model Comment commenter:string body:text article:references`
디비 생성
	`rake db:migrate`
config/routes.rb:
	resources :articles do
		resources :comments
	end
라우트 생성
	`rake routes`
controller 제작
	`rails generate controller Comment`
    
------- 디비 더미데이터 만들기 -------

db/seeds.rb에 더미데이터 넣기

디비 넣기
	`rake db:seed`
    이때, 이미 들어있는 데이터도 다시 집어넣으므로, 한번 집어 넣은 것은 comment처리를 하자

db/developent.sqlite3
  sqlite를 뜯어볼 수 있는 프로그램(Ex.DB browser for SQLite)을 사용해서 modify가능


-------- 잡다 ----------

`rails generate controller category index` 하면 /category 를 다루는 컨트롤러와 index.html.erb가 생기고 routes.rb에도 자동으로 category/index가 생긴다. 근데 /category/index로 가야한다;;

get 'category/' => 'category#index' 이렇게 하면 된다! 직접 controller지정!!

Category에서 get방식으로 파라미터를 받음. 현재 photo, metal, oriental이 아니면 metal으로 자동으로 리다이렉트함.


`rails generate model Artwork name:string img_path:string description:string category:string artist:references`

