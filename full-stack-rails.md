### Challenges
As a developer, I have been commissioned to create an application where a user can see and create blog posts.

- As a developer, I can create a full-stack Rails application.
  - providing solution to this question alongside the next question.
- As a developer, my blog post can have a title and content.
  - Create a new Rails app in the appropriate folder: $ rails new blog_post_challenge -d postgresql -T
  - $ cd blog_post_challenge
  - Create a database: $ rails db:create
  - Add the dependencies for RSpec:
  - $ bundle add rspec-rails
  - $ rails generate rspec:install
  - Generate the model with appropriate columns and data types:
  - $ rails g model BlogPost title:string content:text
  - $ rails db:migrate
  - Generate the controller:
  - $ rails generate controller BlogPost
  - Begin the rails server: $ rails server
  - In a browser navigate to: http://localhost:3000
  - Open an additional tab in the terminal
  - $ code .

- As a developer, I can add new blog posts directly to my database.
  - $ rails c
  > BlogPost.create title:"Create a FullStack Post", content:"We will need to create a controller method-->then a route-->then a view. Keep track of other steps in the README. Make a plan before running code. Try to understand the process. Be consistent with the data."

  > BlogPost.create title:"Remember to Take Breaks", content:"We are learning a lot of coding techniques. Time goes really fast when you are having fun. Times especially excels when you are seeing the application responds as you expected. So people fear that the knowledge will escape them if they leave the screen. Oh contrar, allowing your brain to have a break is very helpful and often allows you to be more effective and efficient."

  > exit

- As a user, I can see all the blog titles listed on the home page of the application.
```ruby
  # controller method
  def index
    @blog_posts = BlogPost.all
  end

  # route with an alias
  get 'blog_posts' => 'blog_post#index', as: 'blog_posts'

  # view
  # Create index.html.erb
  <h1>BlogPost Challenge</h1>

  <ul>
    <% @blog_posts.each do |blog_post| %>
      <li>
        <%= blog_post.title %>
      </li>
    <% end %>
  </ul>
```

- As a user, I can click on the title of a blog and be routed to a page where I see the title and content of the blog post I selected.
  - involves show controller method and the views for show and index
```ruby
  # controller method
  def show
    @blog_post = BlogPost.find(params[:id])
  end

  # routes with an alias
  get 'blog_posts/:id' => 'blog_post#show', as: 'blog_post'

  # views
  # create show.html.erb
  <h2><%= @blog_post.title %></h>
  <h3><%= @blog_post.content %></h3>

  # modify index.html.erb
  <li>
    <%= link_to blog_post.title, blog_post_path(blog_post) %>
  </li>
```

- As a user, I can navigate from the show page back to the home page.
```ruby
  # modify show.html.erb
  <br/>
  <%= link_to 'Home Page', blog_posts_path %>
```

- As a user, I see a form where I can create a new blog post.
```ruby
  # controller method
    def new
      @blog_post = BlogPost.new
    end

  # route
  # kept getting an error message that `id of new could not be found`
  # cleared error by moving the new route above the show route

  # view
  # Create new.html.erb
  <h3>Add a New Blog Post</h3>
  <%= form_with url: '/blog_posts', local: true do |form| %>

    <%= form.label :title %>
    <%= form.text_field :title %>

    <br>
    <%= form.label :content %>
    <%= form.text_field :content %>

    <br>
    <%= form.submit 'Add Blog Post' %>
  <% end %>
```

- As a user, I can click a button that will take me from the home page to a page where I can create a blog post.
```ruby
  # update index.html.erb
    <br/>
    <%= link_to 'Add a Blog Post', new_blog_post_path %> 

  # controller
  def create
    @blog_post = BlogPost.create(
      title: params[:title],
      content: params[:content]
    )
  end

  # routes
  post 'blog_posts' => 'blog_post#create'

```

- As a user, I can navigate from the form back to the home page.
  ```ruby
  <br/>
  <%= link_to 'Home Page', blog_posts_path %>
  ```

- As a user, I can click a button that will submit my blog post to the database.
  - created as part of new form
- As a user, I when I submit my post, I am redirected to the home page.
```ruby
  # Modify new method to allow changes to occur
    <%= form_with model: @blog_post do |form| %>

  # Update create method with strong params and redirects
  def create
    @blog_post = BlogPost.create(blog_post_params)
    if @blog_post.valid?
      redirect_to blog_posts_path
    else
      redirect_to new_blog_post_path
    end
  end

  private
  def blog_post_params
    params.require(:blog_post).permit(:title, :content)
  end
```


### Stretch Challenges
- As a user, I can delete my blog post.
  - website I used for research [Destroy Method](https://learn.co/lessons/delete-forms-rails)
```ruby
  # controller method
  def destroy
    @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy
    redirect_to blog_posts_path
  end

  # route
  delete 'blog_posts/:id' => 'blog_post#destroy', as: 'delete_blog_post'

  # update show.html.erb
  <br/>
  <%= button_to 'Delete Blog Post', blog_post_path(@blog_post), method: :delete %>
```

- As a user, I can update my blog post.
```ruby
  # controllers
  def edit
    @blog_post = BlogPost.find(params[:id])
  end

  def update
    @blog_post = BlogPost.find(params[:id])
    @blog_post.update(blog_posts_params)
    if @blog_post.valid?
      redirect_to blog_post_path(@blog_post)
    else
      redirect_to edit_blog_post_path
    end
  end

  # routes
  get '/blog_posts/:id/edit' => 'blog_post#edit', as: 'edit_blog_post'
  patch '/blog_posts/:id' => 'blog_post#update'

  # views
  # modify show.html.erb
  <br/>
  <br/>
  <%= link_to 'Edit a Blog Post', edit_blog_post_path(@blog_post) %>
  <br/>
  <br/>
  <%= button_to 'Delete Blog Post', blog_post_path(@blog_post), method: :delete %>
  <br/>
  <br/>
  <%= link_to 'Home Page', blog_posts_path %>
    
  # create edit.html.erb
  <h3>Edit a Blog Post</h3>
  <%= form_with model: @blog_post, method: :patch do |form| %>

    <%= form.label :title %>
    <%= form.text_field :title %>

    <br>
    <br>
    <%= form.label :content %>
    <%= form.text_field :content %>

    <br>
    <br>
    <%= form.submit 'Save Changes to Blog Post' %>
  <% end %>

  <br/>
  <%= link_to 'Home Page', blog_posts_path %>
```

- As a developer, I can ensure that all blog posts have titles and content for each post.
```ruby
# spec/models/blog_post_spec.rb
  it 'is not valid without titles and content' do
    post = BlogPost.create content:"Making interesting content for this blog post."
    entry = BlogPost.create title:"Creating Titles"
    expect(post.errors[:title]).to_not be_empty
    expect(entry.errors[:content]).to_not be_empty
  end

# run test - $ rspec spec/models/blog_post_spec.rb

# app/models/blog_post.rb
  validates :title, :content, presence: true

# run test - $ rspec spec/models/blog_post_spec.rb  
```

- As a developer, I can ensure that all blog post titles are unique.
```ruby
# test
  it 'does not allow duplicate titles' do
    post = BlogPost.create title:"Creating Titles", content:"Making interesting content for this blog post."
    entry = BlogPost.create title:"Creating Titles", content:"More content"
    expect(entry.errors[:title]).to_not be_empty
  end
# validation
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
```

- As a developer, I can ensure that blog post titles are at least 10 characters.
```ruby
# test
  it 'is not valid if title is less than 10 characters' do
    post = BlogPost.create title:"New Title", content:"Making interesting content for this blog post."
    expect(post.errors[:title]).to_not be_empty
  end
# update title validation
  validates :title, presence: true, uniqueness: true, length: { minimum: 10 }
```