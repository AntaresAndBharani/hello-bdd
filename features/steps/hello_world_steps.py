from behave import given, when, then
import src.hello_world as hw
from src.hello_world import HelloWorld

@given(u'I have a working environment')
def step_impl(context):
    # Simply verify Python is working by setting a variable
    context.environment_ready = True


@when(u'I execute the Hello World program')
def step_impl(context):
    # Import and call the HelloWorld class from the src folder
    hello = HelloWorld()
    context.output = hello.say_hello()

@then(u'I should see a "Hello, World" message in the output')
def step_impl(context):
    # Check if "Hello World" is in the captured output
    assert "Hello, World" in context.output, (
        f"Expected 'Hello, World' in output, but got:\n{context.output}"
    )