import python_project


def test_true():
    python_project.hello_world()
    assert True


def test_false():
    python_project.hello_world()
    assert not False
