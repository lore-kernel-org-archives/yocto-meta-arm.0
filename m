Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1266C3601B
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 14:17:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9665.1743603427864772489
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 07:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E3BC1007;
	Wed,  2 Apr 2025 07:17:10 -0700 (PDT)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.45.25.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9EBFD3F63F;
	Wed,  2 Apr 2025 07:17:06 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH 4/6] optee-client: drop privileges of tee-supplicant
Date: Wed,  2 Apr 2025 16:16:50 +0200
Message-ID: <20250402141652.380180-4-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402141652.380180-1-gyorgy.szing@arm.com>
References: <20250402141652.380180-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Apr 2025 14:17:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6438

Stop the tee-supplicant being run with root privileges when the system
is not using systemd.

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee/optee-client.inc               | 2 ++
 meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/=
recipes-security/optee/optee-client.inc
index 519041d6..ac003a24 100644
--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -32,6 +32,8 @@ do_install:append() {
         install -D -p -m0755 ${UNPACKDIR}/tee-supplicant.sh ${D}${syscon=
fdir}/init.d/tee-supplicant
         sed -i -e s:@sysconfdir@:${sysconfdir}:g \
                -e s:@sbindir@:${sbindir}:g \
+               -e s:@supluser@:teesuppl:g \
+               -e s:@suplgroup@:teesuppl:g \
                   ${D}${sysconfdir}/init.d/tee-supplicant
     fi
     install -o teesuppl -g teesuppl -m 0700 -d ${D}${localstatedir}/lib/=
tee
diff --git a/meta-arm/recipes-security/optee/optee-client/tee-supplicant.=
sh b/meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh
index b4d21950..12e81770 100644
--- a/meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh
+++ b/meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh
@@ -14,7 +14,7 @@ test -f $DAEMON || exit 0
 test -f @sysconfdir@/default/$NAME && . @sysconfdir@/default/$NAME
 test -f @sysconfdir@/default/rcS && . @sysconfdir@/default/rcS
=20
-SSD_OPTIONS=3D"--oknodo --quiet --exec $DAEMON -- -d $OPTARGS"
+SSD_OPTIONS=3D"-c @supluser@:@suplgroup@ --oknodo --quiet --exec $DAEMON=
 -- -d $OPTARGS"
=20
 set -e
=20
--=20
2.43.0


