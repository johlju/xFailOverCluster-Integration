@{
    AllNodes = @(
        @{
            NodeName = '*'

            PSDscAllowDomainUser = $true
        },

        @{
            NodeName  = 'san01'

            Path      = 'c:\file.txt'
            Contents  = 'this is some text'
            GroupName = 'Group1'
        }

        @{
            NodeName = 'dc01'

            GroupName = 'Group1'
        }
    )
}
