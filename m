Return-Path: <clement.faure@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE4FC87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:04:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2875.1753779877318891689
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 02:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: clement.faure@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC7BA1516;
	Tue, 29 Jul 2025 02:04:28 -0700 (PDT)
Received: from MGC575JXM4.emea.arm.com (unknown [10.34.128.253])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60F443F66E;
	Tue, 29 Jul 2025 02:04:36 -0700 (PDT)
From: Clement Faure <clement.faure@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Clement Faure <clement.faure@arm.com>
Subject: [PATCH] arm-bsp/trusted-firmware-a: corstone1000: upgrade TF-A to 2.13.0
Date: Tue, 29 Jul 2025 11:04:27 +0200
Message-Id: <20250729090427.87003-1-clement.faure@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 29 Jul 2025 09:04:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6625

Upgrade trusted-firmware-a to 2.13.0 for Corstone-1000
Upgrade tf-a-tests to 2.13.0 for Corstone-1000

Signed-off-by: Clement Faure <clement.faure@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc     | 4 ++--
 meta-arm-bsp/documentation/corstone1000/user-guide.rst | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index ecaea64d..99f79331 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -7,8 +7,8 @@ PREFERRED_VERSION_trusted-firmware-m ?=3D "2.1.%"
=20
 # TF-A
 TFA_PLATFORM =3D "corstone1000"
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.12.%"
-PREFERRED_VERSION_tf-a-tests ?=3D "2.12.%"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.13.%"
+PREFERRED_VERSION_tf-a-tests ?=3D "2.13.%"
=20
 TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
 TFA_FIP_BINARY =3D "fip-corstone1000.bin"
diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index b7fb8d84..8dcadeaa 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -91,7 +91,7 @@ Host Processor Components
 +----------+------------------------------------------------------------=
-------------------------------------------+
 | bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/trusted-fi=
rmware-a/trusted-firmware-a_%.bbappend``   |
 +----------+------------------------------------------------------------=
-------------------------------------------+
-| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/trusted-fi=
rmware-a/trusted-firmware-a_2.11.0.bb``    |
+| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/trusted-firmwa=
re-a/trusted-firmware-a_2.13.0.bb``        |
 +----------+------------------------------------------------------------=
-------------------------------------------+
=20
 `Trusted Services <https://trusted-services.readthedocs.io/en/latest/ind=
ex.html>`__

