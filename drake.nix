{
  lib,
  python3Packages,
  fetchPypi,
}:
python3Packages.buildPythonPackage rec {
  pname = "drake";
  version = "1.49.0";
  pyproject = false;


  src = fetchPypi {
    inherit pname version;
    hash = "sha256-tChhhv0BZCfvRP/C5BxWWIOYvX/Qt9iD1BICGhskBoQ=";
  };

  # build-system = with python3Packages; [setuptools];

  dependencies = with python3Packages; [];

  # nativeBuildInputs = [ pkgs.autoPatchelfHook ];

  meta = {
    # ...
  };
}
