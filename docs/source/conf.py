# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = "Python-project"
copyright = "2024, Paul Rademacher"
author = "Paul Rademacher"

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = ["sphinx.ext.autodoc", "sphinx.ext.napoleon", "sphinx.ext.imgmath"]

# autoclass_content = "both"
# autodoc_typehints = "description"
# autodoc_default_options = {"special-members": "__call__"}
# autodoc_member_order = "bysource"

napoleon_include_init_with_doc = True
napoleon_include_special_with_doc = True

imgmath_use_preview = True
imgmath_latex_preamble = r"""
\usepackage{amsmath,amssymb,amsfonts,amsthm}
\usepackage[retainorgcmds]{IEEEtrantools}
"""
# imgmath_latex_preamble = "\n".join(
#     [
#         r"\usepackage{amsmath,amssymb,amsfonts,amsthm}",
#         r"\usepackage[retainorgcmds]{IEEEtrantools}",
#     ]
# )

templates_path: list[str] = ["_templates"]
exclude_patterns: list[str] = []


# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

# html_theme = "alabaster"
html_theme = "furo"
# html_theme = "sphinx_rtd_theme"
# html_theme = "pydata_sphinx_theme"

html_static_path = ["_static"]
# html_static_path: list[str] = []
