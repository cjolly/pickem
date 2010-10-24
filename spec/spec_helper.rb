accuscore = File.read('./fixtures/accuscore.html')
FakeWeb.register_uri(:get, %r|http://insider\.espn\.go\.com\/nfl\/projections|, :response => accuscore)