function Invoke-PrivateCommand {
        [CmdletBinding()]
        [Alias('IPC')]
        param (
            [Parameter(
                Position = 0,
                ValueFromPipelineByPropertyName = $true)]
            [String]
            $command,

            [Parameter(
                Position = 1,
                ValueFromPipelineByPropertyName = $true)]
            [ArgumentCompleter({
                Get-Module -ListAvailable | Select-Object -ExpandProperty Name
            })]
            [string]
            $Module
        )
    
        $ModuleScope = Get-Module $Module

        & $ModuleScope {$command}
    
}

