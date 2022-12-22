local other = require('other-nvim')

other.setup({
    mappings = {
        -- Golang
		{
			pattern = "(.*).go$",
			target = "%1_test.go",
			context = "test"
		},
		{
			pattern = "(.+)_test.go$",
			target = "%1.go",
			context = "code"
		}
	}
})
