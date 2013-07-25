get '/' do
  @notes = Note.all
  erb :index
end

get '/note/:note_id' do
  @note = Note.find(params[:note_id])
  erb :note
end

get '/note/:id/edit' do
  @note = Note.find(params[:id])
  erb :edit
end

# get '/note/:id/delete' do
#   @note = Note.find(params[:id])
#   erb :delete
# end

post '/create' do
  @note = Note.create(params)
  redirect to '/'
end

post '/note/:id/delete' do
  @note = Note.find(params[:id])
  @note.delete
  redirect to ('/')
end

post '/note/:id/edit' do
  @note = Note.find(params[:id])
  @note.update_attributes(subject:params[:subject], text:params[:text])
  redirect to("/note/#{params[:id]}")
end