#! /bin/bash

# Run xcodegen to create .xcodeproj file
{%- if cookiecutter.runXcodeGen == 'y' %}
  xcodegen
{%- endif %}

{%- if cookiecutter.runCocoaPods == 'y' %}
  pod install
{%- endif %}

printf 'all done - enjoy your new project 🤓'