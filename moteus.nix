{
  lib,
  python3Packages,
  fetchPypi,
}:
python3Packages.buildPythonPackage rec {
  pname = "moteus";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-1msAMo6Ms/V637VPQ8asttCcIhWAjCQnJezlMPx/n98=";
  };

  build-system = with python3Packages; [ setuptools ];

  dependencies = with python3Packages; [
    importlib-metadata
    packaging
    pyelftools
    pyserial
    python-can
    scipy
  ];

  meta = {
    # ...
  };
}
