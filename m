Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B127C52D7D
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 15:04:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.48630.1723475080823177606
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Aug 2024 08:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51165FEC;
	Mon, 12 Aug 2024 08:05:06 -0700 (PDT)
Received: from e129527.arm.com (unknown [10.57.80.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A29633F6A8;
	Mon, 12 Aug 2024 08:04:39 -0700 (PDT)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues Kamba-Mpiana <hugues.kambampiana@arm.com>
Subject: [PATCH 1/2] arm-bsp/documentation: corstone1000: Deprecation of Sphinx context injection
Date: Mon, 12 Aug 2024 16:04:16 +0100
Message-Id: <20240812150417.157272-2-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812150417.157272-1-hugues.kambampiana@arm.com>
References: <20240812150417.157272-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Aug 2024 15:04:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5961

From: Hugues Kamba-Mpiana <hugues.kambampiana@arm.com>

Read the Docs will stop defining `html_baseurl` Sphinx configuration,
which means that projects will need to define it by themselves to keep th=
e
canonical custom domain properly configured.

The `READTHEDOCS_CANONICAL_URL` environment variable is used to define
`html_baseurl` to keep the previous behavior.

Also inject the `READTHEDOCS` variable into the `html_context`.

Code fragment taken from the blog post here:
https://about.readthedocs.com/blog/2024/07/addons-by-default/

Signed-off-by: Hugues Kamba-Mpiana <hugues.kambampiana@arm.com>
---
 .../documentation/corstone1000/conf.py        | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/conf.py b/meta-arm-b=
sp/documentation/corstone1000/conf.py
index e9cab633..b932a52c 100644
--- a/meta-arm-bsp/documentation/corstone1000/conf.py
+++ b/meta-arm-bsp/documentation/corstone1000/conf.py
@@ -10,15 +10,19 @@
 # add these directories to sys.path here. If the directory is relative t=
o the
 # documentation root, use os.path.abspath to make it absolute, like show=
n here.
 #
-# import os
-# import sys
 # sys.path.insert(0, os.path.abspath('.'))
=20
+import os
+import sys
+
+# Append the documentation directory to the path, so we can import varia=
bles
+sys.path.append(os.path.dirname(__file__))
+
=20
 # -- Project information -----------------------------------------------=
------
=20
 project =3D 'corstone1000'
-copyright =3D '2020-2022, Arm Limited'
+copyright =3D '2020-2024, Arm Limited'
 author =3D 'Arm Limited'
=20
=20
@@ -46,6 +50,16 @@ exclude_patterns =3D ['_build', 'Thumbs.db', '.DS_Stor=
e', 'docs/infra']
 #
 html_theme =3D 'sphinx_rtd_theme'
=20
+# Define the canonical URL if you are using a custom domain on Read the =
Docs
+html_baseurl =3D os.environ.get("READTHEDOCS_CANONICAL_URL", "")
+
+# Tell Jinja2 templates the build is running on Read the Docs
+if os.environ.get("READTHEDOCS", "") =3D=3D "True":
+    if "html_context" not in globals():
+        html_context =3D {}
+    html_context["READTHEDOCS"] =3D True
+
+
 # Add any paths that contain custom static files (such as style sheets) =
here,
 # relative to this directory. They are copied after the builtin static f=
iles,
 # so a file named "default.css" will overwrite the builtin "default.css"=
.

