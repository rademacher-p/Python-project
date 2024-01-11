from python_project import hello_world, say_hello


def test_true():
    hello_world()
    assert True


def test_false():
    hello_world()
    assert not False


def test_hello_you():
    name = "you"
    assert say_hello(name) == f"Hello, {name}!"
