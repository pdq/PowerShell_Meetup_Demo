$Results = Invoke-Pester -PassThru 


$XMLString = @"
<?xml version="1.0" encoding="utf-8"?>
<testsuites>
  <testsuite Failures="$($Results.FailedCount)" Name="Automated Tests" tests="$($Results.TotalCount)">
      
  </testsuite>
</testsuites>
"@

$XML = New-Object System.Xml.XmlDocument
$XML.LoadXml($XMLString)

foreach ($test in $Results.TestResult) {
    $NewElement = $XML.CreateElement("testcase")
    $NewElement.SetAttribute("classname", "$($test.Describe)")
    $NewElement.SetAttribute("name", $test.Name)

    if (!$test.Passed) {
        $FailureElement = $XML.CreateElement("failure")
        $FailureElement.SetAttribute("type", "FailedTest")
        $FailureElement.InnerText = $test.Result

        $NewElement.AppendChild($FailureElement)
    }

    $XML.SelectSingleNode("testsuites").SelectSingleNode("testsuite").AppendChild($NewElement)
}

$XML.Save("$PSScriptRoot\testResults.xml")