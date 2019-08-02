function Greet{
    param(
        [string]$Name
    )

    if ( $Name ) {

        "Hello, $Name."

    } else {

        "Hello, my friend."

    }
}