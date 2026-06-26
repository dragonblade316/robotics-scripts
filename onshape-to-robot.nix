{
  lib,
  python3Packages,
  fetchPypi,
}:
python3Packages.buildPythonApplication rec {
  pname = "onshape_to_robot";
  version = "1.8.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-wi5cOYWwesSvEF8fOQI14YxoXFwtwZteZQa/qFc51HI=";
  };

  build-system = with python3Packages; [uv-build setuptools];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"uv_build>=0.9.9,<0.10.0"' '"uv_build>=0.9.9"'
  '';
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
