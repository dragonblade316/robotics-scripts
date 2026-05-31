{
  lib,
  python3Packages,
  fetchPypi,
}:
python3Packages.buildPythonApplication rec {
  pname = "moteus-gui";
  version = "0.3.101";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "";
  };

  build-system = with python3Packages; [setuptools uv-build];
  # build-system = with python3Packages; [pdm-backend];

  dependencies = with python3Packages; [
  ];

  meta = {
    # ...
  };
}
