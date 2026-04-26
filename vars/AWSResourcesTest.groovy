/*
 Simple standalone test for AWSResources.groovy
 Run from the project root with:
   groovy AWSResourcesTest.groovy
*/

// Prepare binding with a stub for Jenkins 'error' step
Binding binding = new Binding()
binding.setVariable('error', { String msg -> throw new RuntimeException(msg) })

GroovyShell shell = new GroovyShell(binding)
File scriptFile = new File('AWSResources.groovy')
assert scriptFile.exists() : "AWSResources.groovy not found. Run this test from the project root."

def aws = shell.parse(scriptFile)

// Success cases
assert aws.call('N. Virginia', 'vpc') == ['us-east-1', 'vpc']
assert aws.call('Ohio', 'instance') == ['us-east-2', 'instance']
assert aws.call('Oregon', 's3') == ['us-west-2', 's3']
assert aws.call('Singapore', 'container') == ['ap-southeast-1', 'container']
assert aws.call('Sydney', 'container') == ['ap-southeast-2', 'container']
assert aws.call('N. California', 'instance') == ['us-west-1', 'instance']
assert aws.call('N. Carolina', 'instance') == ['us-west-1', 'instance'] // alias
assert aws.call('São Paulo', 's3') == ['sa-east-1', 's3']

// Error cases
try {
    aws.call('Ireland', 'vpc')
    assert false : "Expected error for unknown region 'Ireland'"
} catch (RuntimeException e) {
    assert e.message.contains("unknown region 'Ireland'")
}

try {
    aws.call('Ohio', 'database')
    assert false : "Expected error for unknown resource 'database'"
} catch (RuntimeException e) {
    assert e.message.contains("unknown resource 'database'")
}

println 'All AWSResources tests passed.'
