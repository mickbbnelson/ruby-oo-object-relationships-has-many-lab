require "pry"

class Author
    attr_accessor :name

    def initialize(name)
        @name = name
        @posts = []
    end

    def add_post(post)
        @posts << post
        post.author = self
    end

    def posts
        Post.all.select {|post| post.author == self}
    end

    def add_post_by_title(name)
        post = Post.new(name)
        post.author = self
    end

    def self.post_count
        Post.all.size
    end
end