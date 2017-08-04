#
Describe DummyTest {
    Context 'When dummy test runs' {
        It 'Should always return success' {
            $true | Should Be $true
        }
    }
}
