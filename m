Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FB7E77187
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 16:02:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.109063.1734537766473872137
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 08:02:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E879FEC;
	Wed, 18 Dec 2024 08:03:13 -0800 (PST)
Received: from e129527.cambridge.arm.com (unknown [10.1.30.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 747BE3F528;
	Wed, 18 Dec 2024 08:02:44 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH] arm-bsp/documentation: corstone1000: Show flyout menu in sidebar
Date: Wed, 18 Dec 2024 16:02:30 +0000
Message-Id: <20241218160230.3807251-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Dec 2024 16:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6298

Use flyout menu enabled via the `flyout_display`
parameter to show the flyout in the bottom of the sidebar.

The default Read the Docs (RtD) flyout needs to be disabled in order
to not have 2 flyouts showing. It is done by disabling it in the
RtD project settings.

Additionally, the Sphinx theme needs to be upgraded from version
2.0.0 to version 3.0.0. The sphinx and docutils modules also need
to be update for compatibility reason.

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 meta-arm-bsp/documentation/corstone1000/conf.py | 8 ++++++++
 meta-arm-bsp/documentation/requirements.txt     | 8 ++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/conf.py b/meta-arm-b=
sp/documentation/corstone1000/conf.py
index d8b558fa..0202e574 100644
--- a/meta-arm-bsp/documentation/corstone1000/conf.py
+++ b/meta-arm-bsp/documentation/corstone1000/conf.py
@@ -1,3 +1,8 @@
+# SPDX-FileCopyrightText: <text>Copyright 2020-2024 Arm Limited and/or i=
ts
+# affiliates <open-source-office@arm.com></text>
+#
+# SPDX-License-Identifier: MIT
+
 # Configuration file for the Sphinx documentation builder.
 #
 # This file only contains a selection of the most common options. For a =
full
@@ -50,6 +55,9 @@ exclude_patterns =3D ['_build', 'Thumbs.db', '.DS_Store=
', 'docs/infra']
 # a list of builtin themes.
 #
 html_theme =3D 'sphinx_rtd_theme'
+html_theme_options =3D {
+    'flyout_display': 'attached',
+}
=20
 # Define the canonical URL if you are using a custom domain on Read the =
Docs
 html_baseurl =3D os.environ.get("READTHEDOCS_CANONICAL_URL", "")
diff --git a/meta-arm-bsp/documentation/requirements.txt b/meta-arm-bsp/d=
ocumentation/requirements.txt
index 6b4e3bb2..4fc9b99b 100644
--- a/meta-arm-bsp/documentation/requirements.txt
+++ b/meta-arm-bsp/documentation/requirements.txt
@@ -1,4 +1,4 @@
-# Copyright (c) 2022, Arm Limited.
+# Copyright (c) 2022-2024, Arm Limited.
 #
 # SPDX-License-Identifier: MIT
=20
@@ -6,6 +6,6 @@
 jinja2=3D=3D3.1.1
=20
 # Required to build the documentation
-sphinx~=3D5.0
-sphinx_rtd_theme~=3D2.0.0
-docutils=3D=3D0.17.1
+sphinx=3D=3D7.1.2
+sphinx_rtd_theme~=3D3.0.0
+docutils~=3D0.18.1

