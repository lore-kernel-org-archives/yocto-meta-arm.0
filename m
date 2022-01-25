Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7170EC433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 16:59:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1.1643129988533728540
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Jan 2022 08:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1987611FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Jan 2022 08:59:48 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B92C53F766
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Jan 2022 08:59:47 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] scripts/machine-summary: remove default Format.render()
Date: Tue, 25 Jan 2022 16:59:35 +0000
Message-Id: <20220125165936.1456059-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125165936.1456059-1-ross.burton@arm.com>
References: <20220125165936.1456059-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 25 Jan 2022 16:59:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2911

There's no shared code anymore, so move the code to TextOverview.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/machine-summary.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/machine-summary.py b/scripts/machine-summary.py
index 5e66cc1b..0849c579 100755
--- a/scripts/machine-summary.py
+++ b/scripts/machine-summary.py
@@ -142,9 +142,7 @@ class Format:
         return cls.registry[name]()
=20
     def render(self, context, output: pathlib.Path):
-        # Default implementation for convenience
-        with open(output, "wt") as f:
-            f.write(self.get_template(f"machine-summary-{self.name}.jinj=
a").render(context))
+        pass
=20
     def get_template(self, name):
         template_dir =3D os.path.dirname(os.path.abspath(__file__))
@@ -160,6 +158,10 @@ class Format:
 class TextOverview(Format):
     name =3D "overview.txt"
=20
+    def render(self, context, output: pathlib.Path):
+        with open(output, "wt") as f:
+            f.write(self.get_template(f"machine-summary-overview.txt.jin=
ja").render(context))
+
 class HtmlUpdates(Format):
     name =3D "report"
=20
--=20
2.25.1


