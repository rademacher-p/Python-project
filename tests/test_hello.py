from python_project import hello


def test_true():
    hello.hello_world()
    assert True


def test_false():
    hello.hello_world()
    assert not False


def test_hello():
    name = "you"
    assert hello.say_hello(name) == f"Hello, {name}!"
