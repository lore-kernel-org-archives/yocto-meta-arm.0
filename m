Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDD6C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 20:28:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.94812.1705350504011489662
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Jan 2024 12:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F29882F4
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Jan 2024 12:29:09 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F1C6E3F73F
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Jan 2024 12:28:22 -0800 (PST)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/documentation: upgrade Sphinx slightly
Date: Mon, 15 Jan 2024 20:28:21 +0000
Message-Id: <20240115202821.995840-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Jan 2024 20:28:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5331

From: Ross Burton <ross.burton@arm.com>

Many Sphinx plugins now require Sphinx 5+ ([1], [2], and more), so
sphinx 4.5 isn't usable as the requirements in sphinx itself are not
pinned so you end up with a broken setup with errors such as:

sphinx.errors.VersionRequirementError: The sphinxcontrib.serializinghtml
extension used by this project needs at least Sphinx v5.0; it therefore
cannot be built with this version.

There's a sufficient number of plugins that manually pinning them all is
tedious, so upgrade the documentation to Sphinx 5 (and the corresponding
RTD theme).

Also remove sphinx-copybutton, as this extension is unused.

[1] https://github.com/sphinx-doc/sphinxcontrib-applehelp/commit/ccc77c81=
4a92ef21c300e5ef725b76c40b7ce653
[2] https://github.com/sphinx-doc/sphinxcontrib-devhelp/commit/b2dc14bd8b=
dd7994c565d254772a0ba3ddecfe51

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/documentation/requirements.txt | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/documentation/requirements.txt b/meta-arm-bsp/d=
ocumentation/requirements.txt
index b82e5e07..6b4e3bb2 100644
--- a/meta-arm-bsp/documentation/requirements.txt
+++ b/meta-arm-bsp/documentation/requirements.txt
@@ -6,7 +6,6 @@
 jinja2=3D=3D3.1.1
=20
 # Required to build the documentation
-sphinx=3D=3D4.5.0
-sphinx_rtd_theme=3D=3D1.0.0
-sphinx-copybutton=3D=3D0.5.0
+sphinx~=3D5.0
+sphinx_rtd_theme~=3D2.0.0
 docutils=3D=3D0.17.1
--=20
2.34.1


