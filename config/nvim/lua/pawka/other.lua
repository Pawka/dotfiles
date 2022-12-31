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
		},
        -- C
		{
			pattern = "(.*).c$",
			target = "%1.h",
			context = "header"
		},
		{
			pattern = "(.+).h",
			target = "%1.c",
			context = "code"
		}
	}
})
