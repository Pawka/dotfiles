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
        -- Golang: Protobuf
		{
			pattern = "(.*).pb.go$",
			target = "%1.proto",
			context = "code"
		},
		{
			pattern = "(.*).proto$",
			target = "%1.pb.go",
			context = "header"
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
		},
        -- bash/bats
		{
			pattern = "(.+).sh$",
			target = "%1.bats",
			context = "test"
		},
		{
			pattern = "(.+).bats$",
			target = "%1.sh",
			context = "code"
		},
	}
})
