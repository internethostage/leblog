class CommentsMailer < ApplicationMailer

  def notify_post_owner(comment)
    @comment  = comment
    @post     = comment.post
    @owner    = @post.user
    mail(to: @owner.email, subject: "Your post got a comment!") 
  end

end
