. $PSScriptRoot\..\Scripts\Greeting.ps1

Describe "Greeting" {
    It "Should return 'Hello, {Name}.'" {
        $Result = Greet -Name "Bob"

        $Result | Should -Be "Hello, Bob."
    }

    it "Should return 'Hello, my friend.' if {Name} is null" {
        $Result = Greet -Name $null

        $Result | Should -Be "Hello, my friend."
    }

    # Let's add a failing test
    It "{True} should be {False}" {
        $True | Should -Be $False
    }
}