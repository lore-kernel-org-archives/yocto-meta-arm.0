Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10036.1618389819144658740
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 01:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: richard.neill@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 662CD11D4;
	Wed, 14 Apr 2021 01:43:38 -0700 (PDT)
Received: from e125927.arm.com (unknown [10.57.30.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDCF43F73B;
	Wed, 14 Apr 2021 01:43:37 -0700 (PDT)
From: "Richard Neill" <richard.neill@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy/linux-arm-autonomy: Do not apply xen IRQ patch for 5.12+ kernels
Date: Wed, 14 Apr 2021 09:47:18 +0100
Message-Id: <20210414084718.14311-1-richard.neill@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

As the xen event channel kernel patch is mainlined in 5.12, this patch en=
sures
it is only applied to the applicable versions earlier than 5.12.

Signed-off-by: Richard Neill <richard.neill@arm.com>
Change-Id: I03a3dc51281fdc94cd7e9a9da2540b34668a6ad1
---
 meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.in=
c b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
index 79cf9ee..6927987 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
@@ -44,7 +44,7 @@ python() {
        and oe.utils.any_distro_features(d, "arm-autonomy-host arm-autono=
my-guest"):
         if LooseVersion(kernelVersion) < '5.9':
            d.appendVar('SRC_URI', ' file://files/0001-arm-arm64-xen-Fix-=
to-convert-percpu-address-to-gfn-c.patch' )
-        if LooseVersion(kernelVersion) >=3D '5.10':
+        if '5.10' <=3D LooseVersion(kernelVersion) < '5.12':
            d.appendVar('SRC_URI', ' file://files/0001-xen-evtchn-Change-=
irq_info-lock-to-raw_spinlock_t.patch' )
=20
     if kernelVersion and LooseVersion(kernelVersion) < '5.10':
--=20
2.25.1

