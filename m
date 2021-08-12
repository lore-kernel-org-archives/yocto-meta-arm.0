Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.20018.1628761796862377834
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Aug 2021 02:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28C1011FB
	for <meta-arm@lists.yoctoproject.org>; Thu, 12 Aug 2021 02:49:56 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C72BD3F718
	for <meta-arm@lists.yoctoproject.org>; Thu, 12 Aug 2021 02:49:55 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] scripts: add machine summary report tool
Date: Thu, 12 Aug 2021 10:49:52 +0100
Message-Id: <20210812094952.3348524-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210812094952.3348524-1-ross.burton@arm.com>
References: <20210812094952.3348524-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

machine-summary.py is a tool to generate a report of what recipes and
versions are used for what machines, and what the latest upstream release
is.

Change-Id: Iecf21a14057df0fd1cb05be9b54c621dfbaddd94
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml                             |   8 ++
 scripts/machine-summary-overview.txt.jinja |  12 ++
 scripts/machine-summary-updates.html.jinja |  47 ++++++++
 scripts/machine-summary.py                 | 122 +++++++++++++++++++++
 4 files changed, 189 insertions(+)
 create mode 100644 scripts/machine-summary-overview.txt.jinja
 create mode 100644 scripts/machine-summary-updates.html.jinja
 create mode 100755 scripts/machine-summary.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index bbd4c91..8ceb980 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -88,6 +88,14 @@ check-layers:
   - kas shell --update --force-checkout ci/base.yml:ci/meta-arm-autonomy=
.yml:ci/meta-openembedded.yml --command \
     "$CI_PROJECT_DIR/ci/check-layers.py $CI_PROJECT_DIR/ci/check-layers.=
yml $CI_PROJECT_DIR $KAS_WORK_DIR"
=20
+pending-updates:
+  extends: .setup
+  artifacts:
+    paths:
+      - update-report.html
+  script:
+  - kas shell ci/qemuarm64.yml:ci/meta-openembedded.yml -c "$CI_PROJECT_=
DIR/scripts/machine-summary.py -t updates.html -o $CI_PROJECT_DIR/update-=
report.html $($CI_PROJECT_DIR/ci/listmachines.py meta-arm meta-arm-bsp)"
+
 corstone500:
   extends: .build
=20
diff --git a/scripts/machine-summary-overview.txt.jinja b/scripts/machine=
-summary-overview.txt.jinja
new file mode 100644
index 0000000..d585065
--- /dev/null
+++ b/scripts/machine-summary-overview.txt.jinja
@@ -0,0 +1,12 @@
+Machine Overview
+Generated at {{ timestamp }}.
+{% for machine, data in data|dictsort %}
+
+MACHINE: {{ machine }}
+{% for recipe in recipes|sort %}
+{% if recipe in data %}
+{% set details =3D data[recipe] %}
+{{ details.recipe }}: {{ details.version }}
+{% endif %}
+{% endfor %}
+{% endfor %}
diff --git a/scripts/machine-summary-updates.html.jinja b/scripts/machine=
-summary-updates.html.jinja
new file mode 100644
index 0000000..d3ac2ff
--- /dev/null
+++ b/scripts/machine-summary-updates.html.jinja
@@ -0,0 +1,47 @@
+<!DOCTYPE html>
+<html>
+  <head>
+    <title>Pending Machine Upgrades Report</title>
+    <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-sca=
le=3D1">
+    <link rel=3D"stylesheet" href=3D"https://cdn.jsdelivr.net/npm/bulma@=
0.9.1/css/bulma.min.css">
+  </head>
+  <body>
+    <section class=3D"section">
+      <div class=3D"content">
+        <h1 class=3D"title">Pending Machine Upgrades Report</h1>
+        <p>Generated at {{ timestamp }}.</p>
+      </div>
+
+      <table class=3D"table is-striped">
+        <thead>
+          <tr>
+            <th>Machine</th>
+            {% for recipe in recipes|sort %}
+            <th>{{ recipe }} ({{releases[recipe]|default("?")}})</th>
+            {% endfor %}
+          </tr>
+        </thead>
+        <tbody>
+          {% for machine, data in data|dictsort %}
+          <tr>
+            <th>{{ machine }}</th>
+            {% for recipe in recipes|sort %}
+              {% if recipe in data %}
+                {% set details =3D data[recipe] %}
+                {% set is_old =3D details.version is old(details.upstrea=
m) %}
+                <td class=3D"{% if is_old %}has-text-weight-bold{% endif=
 %}">
+                {{ details.recipe if details.recipe !=3D recipe}}
+                {{ details.version }}
+                {{ "(patched)" if details.patched }}
+                </td>
+              {% else %}
+                <td>-</td>
+              {% endif %}
+            {% endfor %}
+          </tr>
+          {% endfor %}
+        </tbody>
+      </table>
+    </section>
+  </body>
+</html>
diff --git a/scripts/machine-summary.py b/scripts/machine-summary.py
new file mode 100755
index 0000000..7d2eb53
--- /dev/null
+++ b/scripts/machine-summary.py
@@ -0,0 +1,122 @@
+#! /usr/bin/env python3
+
+import os
+import sys
+import argparse
+import datetime
+
+import jinja2
+
+def get_template(name):
+    template_dir =3D os.path.dirname(os.path.abspath(__file__))
+    env =3D jinja2.Environment(
+        loader=3Djinja2.FileSystemLoader(template_dir),
+        autoescape=3Djinja2.select_autoescape(),
+        trim_blocks=3DTrue,
+        lstrip_blocks=3DTrue
+    )
+    def is_old(version, upstream):
+        if "+git" in version:
+            # strip +git and see if this is a post-release snapshot
+            version =3D version.replace("+git", "")
+        return version !=3D upstream
+    env.tests["old"] =3D is_old
+
+    return env.get_template(f"machine-summary-{name}.jinja")
+
+def trim_pv(pv):
+    """
+    Strip anything after +git from the PV
+    """
+    return "".join(pv.partition("+git")[:2])
+
+def layer_path(layername, d):
+    """
+    Return the path to the specified layer, or None if the layer isn't p=
resent.
+    """
+    import re
+    bbpath =3D d.getVar("BBPATH").split(":")
+    pattern =3D d.getVar('BBFILE_PATTERN_' + layername)
+    for path in reversed(sorted(bbpath)):
+        if re.match(pattern, path + "/"):
+            return path
+    return None
+
+def harvest_data(machines, recipes):
+    import bb.tinfoil, bb.utils
+    with bb.tinfoil.Tinfoil() as tinfoil:
+        tinfoil.prepare(config_only=3DTrue)
+        corepath =3D layer_path("core", tinfoil.config_data)
+        sys.path.append(os.path.join(corepath, "lib"))
+    import oe.recipeutils
+    import oe.patch
+
+    # Queue of recipes that we're still looking for upstream releases fo=
r
+    to_check =3D list(recipes)
+
+    # Upstream releases
+    upstreams =3D {}
+    # Machines to recipes to versions
+    versions =3D {}
+
+    for machine in machines:
+        print(f"Gathering data for {machine}...")
+        os.environ["MACHINE"] =3D machine
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            versions[machine] =3D {}
+
+            tinfoil.prepare(quiet=3D2)
+            for recipe in recipes:
+                try:
+                    d =3D tinfoil.parse_recipe(recipe)
+                except bb.providers.NoProvider:
+                    continue
+
+                if recipe in to_check:
+                    try:
+                        info =3D oe.recipeutils.get_recipe_upstream_vers=
ion(d)
+                        upstreams[recipe] =3D info["version"]
+                        to_check.remove(recipe)
+                    except (bb.providers.NoProvider, KeyError):
+                        pass
+
+                details =3D versions[machine][recipe] =3D {}
+                details["recipe"] =3D d.getVar("PN")
+                details["version"] =3D trim_pv(d.getVar("PV"))
+                details["patched"] =3D bool(oe.patch.src_patches(d))
+
+    # Now backfill the upstream versions
+    for machine in versions:
+        for recipe in versions[machine]:
+            versions[machine][recipe]["upstream"] =3D upstreams[recipe]
+
+    return upstreams, versions
+
+# TODO can this be inferred from the list of recipes in the layer
+recipes =3D ("virtual/kernel",
+           "scp-firmware",
+           "trusted-firmware-a",
+           "trusted-firmware-m",
+           "edk2-firmware",
+           "u-boot",
+           "optee-os",
+           "armcompiler-native",
+           "gcc-aarch64-none-elf-native",
+           "gcc-arm-none-eabi-native")
+
+if __name__ =3D=3D "__main__":
+    parser =3D argparse.ArgumentParser(description=3D"machine-summary")
+    parser.add_argument("machines", nargs=3D"+", help=3D"machine names",=
 metavar=3D"MACHINE")
+    parser.add_argument("-t", "--template", required=3DTrue)
+    parser.add_argument("-o", "--output", required=3DTrue, type=3Dargpar=
se.FileType('w', encoding=3D'UTF-8'))
+    args =3D parser.parse_args()
+
+    template =3D get_template(args.template)
+
+    context =3D {}
+    # TODO: include git describe for meta-arm
+    context["timestamp"] =3D str(datetime.datetime.now().strftime("%c"))
+    context["recipes"] =3D sorted(recipes)
+    context["releases"], context["data"] =3D harvest_data(args.machines,=
 recipes)
+
+    args.output.write(template.render(context))
--=20
2.25.1

