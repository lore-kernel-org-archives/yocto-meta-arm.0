Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2155C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 11:03:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9603.1648465419846833202
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Mar 2022 04:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D4D0D6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 28 Mar 2022 04:03:39 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 291473F66F
	for <meta-arm@lists.yoctoproject.org>; Mon, 28 Mar 2022 04:03:39 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: fix INHERIT assignment
Date: Mon, 28 Mar 2022 12:03:37 +0100
Message-Id: <20220328110337.1253833-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 28 Mar 2022 11:03:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3212

We were accidentally assigning instead of adding to INHERIT.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/fvp-base.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/fvp-base.yml b/ci/fvp-base.yml
index 43b2f190..037e36ef 100644
--- a/ci/fvp-base.yml
+++ b/ci/fvp-base.yml
@@ -7,7 +7,7 @@ machine: fvp-base
=20
 local_conf_header:
   testimagefvp: |
-    INHERIT =3D "fvpboot"
+    INHERIT +=3D "fvpboot"
     # This fails but we can't add to the ignorelist from meta-arm yet
     # https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14604
     TEST_SUITES:remove =3D "parselogs"
--=20
2.25.1


