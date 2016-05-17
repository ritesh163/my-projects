require 'will_paginate/collection'


@post  = array.sort_by{|e| e.id}
@posts = @posts.paginate(:page => params[:page], :per_page => 10)