Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8932C43217
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 21:20:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.2874.1642627255393603090
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 13:20:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C3BCED1
	for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jan 2022 13:20:55 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 915AF3F774
	for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jan 2022 13:20:54 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/6] scripts/machine-summary: write per-machine reports with
 more details
Date: Wed, 19 Jan 2022 21:20:49 +0000
Message-Id: <20220119212050.1886613-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119212050.1886613-1-ross.burton@arm.com>
References: <20220119212050.1886613-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jan 2022 21:20:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2874

Rename the updates.html format to just 'report'.

This report has the existing overview as the index.html, and then
per-machine files are written with the patch breakdown.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/machine-summary-updates.html.jinja | 47 -----------------
 scripts/machine-summary.py                 | 21 +++++++-
 scripts/report-base.html.jinja             | 35 +++++++++++++
 scripts/report-details.html.jinja          | 61 ++++++++++++++++++++++
 scripts/report-index.html.jinja            | 44 ++++++++++++++++
 5 files changed, 160 insertions(+), 48 deletions(-)
 delete mode 100644 scripts/machine-summary-updates.html.jinja
 create mode 100644 scripts/report-base.html.jinja
 create mode 100644 scripts/report-details.html.jinja
 create mode 100644 scripts/report-index.html.jinja

diff --git a/scripts/machine-summary-updates.html.jinja b/scripts/machine=
-summary-updates.html.jinja
deleted file mode 100644
index d3ac2ff6..00000000
--- a/scripts/machine-summary-updates.html.jinja
+++ /dev/null
@@ -1,47 +0,0 @@
-<!DOCTYPE html>
-<html>
-  <head>
-    <title>Pending Machine Upgrades Report</title>
-    <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-sca=
le=3D1">
-    <link rel=3D"stylesheet" href=3D"https://cdn.jsdelivr.net/npm/bulma@=
0.9.1/css/bulma.min.css">
-  </head>
-  <body>
-    <section class=3D"section">
-      <div class=3D"content">
-        <h1 class=3D"title">Pending Machine Upgrades Report</h1>
-        <p>Generated at {{ timestamp }}.</p>
-      </div>
-
-      <table class=3D"table is-striped">
-        <thead>
-          <tr>
-            <th>Machine</th>
-            {% for recipe in recipes|sort %}
-            <th>{{ recipe }} ({{releases[recipe]|default("?")}})</th>
-            {% endfor %}
-          </tr>
-        </thead>
-        <tbody>
-          {% for machine, data in data|dictsort %}
-          <tr>
-            <th>{{ machine }}</th>
-            {% for recipe in recipes|sort %}
-              {% if recipe in data %}
-                {% set details =3D data[recipe] %}
-                {% set is_old =3D details.version is old(details.upstrea=
m) %}
-                <td class=3D"{% if is_old %}has-text-weight-bold{% endif=
 %}">
-                {{ details.recipe if details.recipe !=3D recipe}}
-                {{ details.version }}
-                {{ "(patched)" if details.patched }}
-                </td>
-              {% else %}
-                <td>-</td>
-              {% endif %}
-            {% endfor %}
-          </tr>
-          {% endfor %}
-        </tbody>
-      </table>
-    </section>
-  </body>
-</html>
diff --git a/scripts/machine-summary.py b/scripts/machine-summary.py
index 2fef8491..1f98f247 100755
--- a/scripts/machine-summary.py
+++ b/scripts/machine-summary.py
@@ -167,7 +167,26 @@ class TextOverview(Format):
     name =3D "overview.txt"
=20
 class HtmlUpdates(Format):
-    name =3D "updates.html"
+    name =3D "report"
+
+    def render(self, context, output: pathlib.Path):
+        if output.exists() and not output.is_dir():
+            print(f"{output} is not a directory", file=3Dsys.stderr)
+            sys.exit(1)
+
+        if not output.exists():
+            output.mkdir(parents=3DTrue)
+
+        with open(output / "index.html", "wt") as f:
+            f.write(self.get_template(f"report-index.html.jinja").render=
(context))
+
+        subcontext =3D context.copy()
+        del subcontext["data"]
+        for machine, subdata in context["data"].items():
+            subcontext["machine"] =3D machine
+            subcontext["data"] =3D subdata
+            with open(output / f"{machine}.html", "wt") as f:
+                f.write(self.get_template(f"report-details.html.jinja").=
render(subcontext))
=20
 if __name__ =3D=3D "__main__":
     parser =3D argparse.ArgumentParser(description=3D"machine-summary")
diff --git a/scripts/report-base.html.jinja b/scripts/report-base.html.ji=
nja
new file mode 100644
index 00000000..be081251
--- /dev/null
+++ b/scripts/report-base.html.jinja
@@ -0,0 +1,35 @@
+<!DOCTYPE html>
+<html>
+  <head>
+    <title>{% block title %}{% endblock %}</title>
+    <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-sca=
le=3D1">
+    <link rel=3D"stylesheet" href=3D"https://cdn.jsdelivr.net/npm/bulma@=
0.9.1/css/bulma.min.css">
+  </head>
+  <body>
+    <section class=3D"section">
+      {# TODO use position: sticky to glue this to the top #}
+      <nav class=3D"breadcrumb is-large">
+        <ul>
+          <li class=3D"{{ "is-active" if machine is undefined }}">
+            <a href=3D"index.html">Recipe Report</a>
+          </li>
+          {% if machine is defined %}
+          <li class=3D"is-active">
+            <a href=3D"#">{{machine}}</a>
+          </li>
+          {% endif %}
+        </ul>
+      </nav>
+
+      <div class=3D"content">
+        {% block content %}{% endblock %}
+      </div>
+    </section>
+
+    <footer class=3D"footer">
+      <div class=3D"content has-text-centered">
+        Generated by <code>machine-summary</code> at {{ timestamp }}.
+      </div>
+    </footer>
+  </body>
+</html>
diff --git a/scripts/report-details.html.jinja b/scripts/report-details.h=
tml.jinja
new file mode 100644
index 00000000..ba66fcf0
--- /dev/null
+++ b/scripts/report-details.html.jinja
@@ -0,0 +1,61 @@
+{% extends "report-base.html.jinja" %}
+{% block title %}Recipe Report for {{ machine }}{% endblock %}
+
+{# Write a tag element using the Upstream-Status to determine the class.=
 #}
+{% macro make_patch_tag(status) -%}
+  {% set status =3D status.split()[0] %}
+  {% if status in ("Unknown", "Pending") %}
+    {% set class =3D "is-danger" %}
+  {% elif status in ("Backport", "Accepted", "Inappropriate") %}
+    {% set class =3D "is-success" %}
+  {% elif status in ("Submitted", "Denied") %}
+    {% set class =3D "is-info" %}
+  {% else %}
+    {% set class =3D "is-info" %}
+  {% endif %}
+  <span class=3D"tag {{ class }}">{{ status }}</span>
+{%- endmacro %}
+
+{% block content %}
+  <!-- TODO table of contents -->
+
+  {% for name, data in data|dictsort if data.needs_update or data.patche=
d %}
+  <h2 class=3D"title is-4">
+    {{ data.recipe }} {{ data.fullversion }}
+    {% if name !=3D data.recipe %}
+      (provides {{ name }})
+    {% endif %}
+    {% if data.needs_update %}<span class=3D"tag is-danger">Upgrade Need=
ed</span>{% endif %}
+    <a id=3D"recipe-{{ data.recipe }}" class=3D"has-text-grey-lighter">#=
</a>
+  </h2>
+
+  {% if data.needs_update %}
+  <p>
+    Recipe is version {{ data.fullversion }}, latest upstream release is=
 <strong>{{ data.upstream }}</strong>.
+  </p>
+  {% endif%}
+
+  {% if data.patched %}
+  <table class=3D"table is-striped is-bordered">
+    <thead>
+      <tr>
+        <th>Patch</th>
+        <th style=3D"width: 20em">Layer</th>
+        <th style=3D"width: 10em">Status</th>
+      </tr>
+    </thead>
+    <tbody>
+      {% for pinfo in data.patches %}
+      <tr>
+        <!-- TODO links to cgit -->
+        <td>{{ pinfo.name }}</td>
+        <td>{{ pinfo.layer }}</td>
+        <!-- TODO: tooltip with full status? -->
+        <td class=3D"has-text-centered">{{ make_patch_tag(pinfo.status)}=
}</td>
+      </tr>
+      {% endfor %}
+    </tbody>
+  </table>
+  {% endif %}
+  {% endfor %}
+{% endblock %}
diff --git a/scripts/report-index.html.jinja b/scripts/report-index.html.=
jinja
new file mode 100644
index 00000000..3e39174f
--- /dev/null
+++ b/scripts/report-index.html.jinja
@@ -0,0 +1,44 @@
+{% extends "report-base.html.jinja" %}
+{% block title %}Recipe Report{% endblock %}
+
+{% block content %}
+  <table class=3D"table is-striped">
+    <thead>
+      <tr>
+        <th>Machine</th>
+        {% for recipe in recipes|sort %}
+        <th>{{ recipe }} ({{releases[recipe]|default("?")}})</th>
+        {% endfor %}
+      </tr>
+    </thead>
+    <tbody>
+      {% for machine, data in data|dictsort %}
+      <tr>
+        <th><a href=3D"{{machine}}.html">{{ machine }}</a></th>
+        {% for recipe in recipes|sort %}
+          {% if recipe in data %}
+            {% set details =3D data[recipe] %}
+            <td style=3D"text-align: center">
+            <a href=3D"{{machine}}.html#recipe-{{details.recipe}}">
+              {{ details.recipe if details.recipe !=3D recipe}}
+              {{ details.version }}
+            </a>
+            {% if details.patches or details.needs_update %}
+            <br>
+            {% if details.patches %}
+              <span class=3D"tag is-info">Patched</span>
+            {% endif %}
+            {% if details.needs_update %}
+              <span class=3D"tag is-danger">Upgrade</span>
+            {% endif %}
+            {% endif %}
+            </td>
+          {% else %}
+            <td>-</td>
+          {% endif %}
+        {% endfor %}
+      </tr>
+      {% endfor %}
+    </tbody>
+  </table>
+{% endblock %}
--=20
2.25.1


