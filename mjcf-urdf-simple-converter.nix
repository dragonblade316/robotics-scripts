{
  lib,
  python3Packages,
  fetchPypi,
}:
python3Packages.buildPythonApplication rec {
  pname = "mjcf_urdf_simple_converter";
  version = "0.7.3";
  pyproject = true;


  src = fetchPypi {
    inherit pname version;
    hash = "sha256-tChhhv0BZCfvRP/C5BxWWIOYvX/Qt9iD1BICGhskBoQ=";
  };

  build-system = with python3Packages; [setuptools];

  dependencies = with python3Packages; [
    scipy
    numpy-stl
    mujoco
  ];

  meta = {
    # ...
  };
}
