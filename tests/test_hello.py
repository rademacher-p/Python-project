from python_project import hello_world, say_hello


def test_say_hello():
    name = "you"
    assert say_hello(name) == f"Hello, {name}!"


def test_true():
    hello_world()
    assert True
