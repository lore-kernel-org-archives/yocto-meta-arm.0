Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62AECCFA1A
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 11:12:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8994.1762513978999798781
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 03:12:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D56B1153B;
	Fri,  7 Nov 2025 03:12:50 -0800 (PST)
Received: from LXKV206JHX.arm.com (unknown [10.57.85.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 070C03F63F;
	Fri,  7 Nov 2025 03:12:57 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH 2/3] arm-bsp/corstone1000: sysvinit: Make module autoload work at boot
Date: Fri,  7 Nov 2025 11:12:51 +0000
Message-ID: <20251107111252.25711-3-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251107111252.25711-1-hugues.kambampiana@arm.com>
References: <20251107111252.25711-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 07 Nov 2025 11:12:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6761

The image wasn=E2=80=99t autoloading kernel modules even though
`KERNEL_MODULE_AUTOLOAD` populated `/etc/modules-load.d/`. In this
configuration `/etc/init.d/rcS` only executes runlevel scripts from
`/etc/rcS.d` (and `/etc/rc5.d`), and `modutils.sh` was also missing.

This change:

* Includes the loader by adding `modutils-initscripts` to
  `CORE_IMAGE_EXTRA_INSTALL`.
* Enables SysV init by appending `sysvinit` to `DISTRO_FEATURES`,
  ensuring the `S*` start links in `/etc/rcS.d` (and `/etc/rc5.d`)
  call `/etc/init.d/modutils.sh start` during boot.

**Result:** entries in `/etc/modules-load.d/*.conf` now load
automatically at boot.

**Verification**

* Before: `lsmod` empty after boot; manual `modprobe` needed.
* After: `lsmod` shows target modules; `dmesg` contains module init logs.

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 kas/corstone1000-image-configuration.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kas/corstone1000-image-configuration.yml b/kas/corstone1000-=
image-configuration.yml
index b5e17200..5e0ad3e3 100644
--- a/kas/corstone1000-image-configuration.yml
+++ b/kas/corstone1000-image-configuration.yml
@@ -23,6 +23,11 @@ local_conf_header:
     INIT_MANAGER:firmware =3D "mdev-busybox"
     VIRTUAL-RUNTIME_init_manager:firmware =3D "busybox"
=20
+    # This guarantees module auto-loading support at boot
+    # by adding /etc/init.d/modutils.sh and /etc/rcS.d/ files
+    CORE_IMAGE_EXTRA_INSTALL:append =3D " modutils-initscripts"
+    DISTRO_FEATURES:append =3D " sysvinit"
+
     # prevent the kernel image from being included in the intramfs rootf=
s
     PACKAGE_EXCLUDE:firmware +=3D "kernel-image-*"
=20

