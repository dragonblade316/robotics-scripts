{
  lib,
  python3Packages,
  fetchPypi,
}:
python3Packages.buildPythonApplication rec {
  pname = "onshape_to_robot";
  version = "1.8.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-TwQ4Ob5y4qvQUYyLVXBTfYCMu3i3DkwUVBFuWQ0LTB0=";
  };

  build-system = with python3Packages; [setuptools uv-build];
  # build-system = with python3Packages; [pdm-backend];

  dependencies = with python3Packages; [
    numpy
    requests
    commentjson
    colorama
    numpy-stl
    transforms3d
    python-dotenv
    pybullet
  ];

  meta = {
    # ...
  };
}
