﻿Describe "Split-String Unit Tests" -Tag "CI" {
	It "Should properly replace in strings" {
		"abc,def" | Split-String "," | Should -Be "abc", "def"
		"abc,def" | Split-String "\W" | Should -Be "abc", "def"
		"abc,def" | Split-String "\W" -DoNotUseRegex | Should -Be "abc,def"
		"abc (def) ghi" | Split-String "(def)" | Should -Be "abc (", "def", ") ghi"
		"abc (def) ghi" | Split-String "(def)" -DoNotUseRegex | Should -Be "abc ", "", "", "", "", " ghi"
		"aBcbd" | Split-String "b" | Should -Be "a", "c", "d"
		"aBcbd" | Split-String "b" -Options None | Should -Be "aBc", "d"
		"a,b,c,d,e" | Split-String "," -Count 2 | Should -Be "a", "b,c,d,e"
		"a,b,c,d,e" | Split-String "," -Count 4 | Should -Be "a", "b", "c", "d,e"
		"a,b,c,d,e" | Split-String "," -Count 2 -DoNotUseRegex | Should -Be "a", "b,c,d,e"
		"a,b,c,d,e" | Split-String "," -Count 4 -DoNotUseRegex | Should -Be "a", "b", "c", "d,e"
	}
}