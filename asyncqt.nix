{
  lib,
  python3Packages,
  fetchPypi,
}:
python3Packages.buildPythonPackage rec {
  pname = "asyncqt";
  version = "0.8.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-B6qZPHpLHU7b01rM7UTRvgHaFJuj98mn+phL5M7KiD8=";
  };

  build-system = with python3Packages; [ setuptools ];

  meta = {
    # ...
  };
}
