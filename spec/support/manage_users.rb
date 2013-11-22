def create_users
  foo = User.create(email: 'foo@example.com', password: 'foo')
  foo.playlists.create(name: 'rock', state: 'public')
  foo.playlists.first.songs <<  Song.create(name: 'Foxy',
                                            description: "The artist is Oblast",
                                            url: 'http://www.youtube.com/watch?v=a_rflWF-iBg')

  foo.playlists.first.songs << Song.create(name: "Cause we've ended as lovers",
                                           description: "The artist is Jeff Beck",
                                           url: 'http://www.youtube.c')

  foo.playlists.create(name: 'country', state: 'public')
  foo.playlists.last.songs << Song.create(name: 'Golden Age',
                                          description: "The artist is Beck",
                                          url: 'http://www.youtube.com/watch?v=Y6zAT15vaFk')

end
