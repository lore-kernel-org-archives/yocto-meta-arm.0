Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0E4CA1015
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 17:11:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.245.1757005856518417166
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Sep 2025 10:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB36416F8
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Sep 2025 10:10:47 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A82363F6A8
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Sep 2025 10:10:55 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] CI: align with Poky
Date: Thu,  4 Sep 2025 18:10:50 +0100
Message-ID: <20250904171050.2370998-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250904171050.2370998-1-ross.burton@arm.com>
References: <20250904171050.2370998-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 Sep 2025 17:11:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6688

Originally we customised the CI build for speed, by switching to ipkg
instead of rpm for the packages and disabling graphical output support
in qemu-system-native.

These are admirable goals, but more admirable is sharing sstate and
people may wish to use the output of this CI without having to make the
same alterations.

Drop these two changes so that our configuration matches poky. I've
verified that with this change, a build of core-image-sato for qemuarm64
can be built almost entirely from the autobuilder's sstate[1].

[1] gator-daemon, opencsd, and perf are built as these are not built on
    the AB in this configuration.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index fc18209216..86c924f70e 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -31,8 +31,6 @@ local_conf_header:
     CONF_VERSION =3D "2"
     BB_SERVER_TIMEOUT =3D "300"
   setup: |
-    PACKAGE_CLASSES =3D "package_ipk"
-    PACKAGECONFIG:remove:pn-qemu-system-native =3D "gtk+ sdl"
     PACKAGECONFIG:append:pn-perf =3D " coresight"
     INHERIT +=3D "rm_work"
   extrapackages: |
--=20
2.43.0


