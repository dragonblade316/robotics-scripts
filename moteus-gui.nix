{
  lib,
  python3Packages,
  fetchurl,
  qt6,
  moteus,
  asyncqt,
}:
python3Packages.buildPythonApplication rec {
  pname = "moteus-gui";
  version = "1.0.0";
  pyproject = true;

  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/ba/5e/a6b8984be8250da297cae69431d4d6ec2bd0d579e0e12efbf11120923c66/moteus_gui-1.0.0.tar.gz";
    hash = "sha256-1Uk3ifjGx9YXY//aRSdccMeKAgQZgox9tp5U0s7foqI=";
  };

  build-system = with python3Packages; [ setuptools ];

  nativeBuildInputs = [ qt6.wrapQtAppsHook ];

  buildInputs = [ qt6.qtbase ];

  dependencies = with python3Packages; [
    asyncqt
    matplotlib
    moteus
    pyside6
    qtconsole
    qtpy
    scipy
  ];

  meta = {
    # ...
  };
}
