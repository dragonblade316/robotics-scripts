{
  lib,
  python3Packages,
  fetchPypi,
  fetchFromGitHub,
}:
python3Packages.buildPythonApplication rec {
  pname = "onshape_to_robot";
  version = "1.8.0";
  pyproject = true;


  src = fetchFromGitHub {
    owner = "nicolas-rabault";
    repo = "onshape-to-robot";
    rev = "b61d08a4a651c5bd167642ca27d1dbbf5f8f3102";
    sha256 = "sha256-wCP8zrtCWqcSdJ1EmEGtgaiuV6gUaJtGyTdNXl5kFkY=";
  };

  build-system = with python3Packages; [setuptools uv-build];

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
