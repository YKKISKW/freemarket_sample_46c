json.user_name  @comment.user.nickname
json.created_time  time_ago_in_words(@comment.created_at)
json.text  @comment.comment


