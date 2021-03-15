Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.6104.1615799384237914216
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Mar 2021 02:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: richard.neill@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62F311FB;
	Mon, 15 Mar 2021 02:09:33 -0700 (PDT)
Received: from e125927.arm.com (unknown [10.57.18.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE8E43F70D;
	Mon, 15 Mar 2021 02:09:32 -0700 (PDT)
From: "Richard Neill" <richard.neill@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy/linux-arm-autonomy: Drop mainlined kernel patch for xenbus probe
Date: Mon, 15 Mar 2021 09:11:42 +0000
Message-Id: <20210315091142.17512-1-richard.neill@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The xenbus_probe patch to fix xen initialisation was mainlined in yocto-l=
inux
v5.10.17. As oe-core has upgraded past this version, the patch can now be
dropped.

Issue-Id: SCM-2263
Signed-off-by: Richard Neill <richard.neill@arm.com>
Change-Id: I40e154cdc4dbabfa531a6886d724ecd400657dd9
---
 ...obe-xenbus-as-part-of-an-early-initc.patch | 95 -------------------
 .../linux/linux-arm-autonomy.inc              |  5 -
 2 files changed, 100 deletions(-)
 delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/files/0001-arm=
-xen-Don-t-probe-xenbus-as-part-of-an-early-initc.patch

diff --git a/meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-xen-Do=
n-t-probe-xenbus-as-part-of-an-early-initc.patch b/meta-arm-autonomy/reci=
pes-kernel/linux/files/0001-arm-xen-Don-t-probe-xenbus-as-part-of-an-earl=
y-initc.patch
deleted file mode 100644
index 3ec7fa79..00000000
--- a/meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-xen-Don-t-pro=
be-xenbus-as-part-of-an-early-initc.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From 89b0c20d80a1ab8aa155af287ff4af378862964f Mon Sep 17 00:00:00 2001
-Message-Id: <89b0c20d80a1ab8aa155af287ff4af378862964f.1613583742.git.die=
go.sueiro@arm.com>
-From: Julien Grall <jgrall@amazon.com>
-Date: Wed, 10 Feb 2021 17:06:54 +0000
-Subject: [PATCH] arm/xen: Don't probe xenbus as part of an early initcal=
l
-
-commit c4295ab0b485b8bc50d2264bcae2acd06f25caaf upstream.
-
-After Commit 3499ba8198cad ("xen: Fix event channel callback via
-INTX/GSI"), xenbus_probe() will be called too early on Arm. This will
-recent to a guest hang during boot.
-
-If the hang wasn't there, we would have ended up to call
-xenbus_probe() twice (the second time is in xenbus_probe_initcall()).
-
-We don't need to initialize xenbus_probe() early for Arm guest.
-Therefore, the call in xen_guest_init() is now removed.
-
-After this change, there is no more external caller for xenbus_probe().
-So the function is turned to a static one. Interestingly there were two
-prototypes for it.
-
-Cc: stable@vger.kernel.org
-Fixes: 3499ba8198cad ("xen: Fix event channel callback via INTX/GSI")
-Reported-by: Ian Jackson <iwj@xenproject.org>
-Signed-off-by: Julien Grall <jgrall@amazon.com>
-Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
-Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
-Link: https://lore.kernel.org/r/20210210170654.5377-1-julien@xen.org
-Signed-off-by: Juergen Gross <jgross@suse.com>
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
-
-Upstream-Status: Backport
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
----
- arch/arm/xen/enlighten.c          | 2 --
- drivers/xen/xenbus/xenbus.h       | 1 -
- drivers/xen/xenbus/xenbus_probe.c | 2 +-
- include/xen/xenbus.h              | 2 --
- 4 files changed, 1 insertion(+), 6 deletions(-)
-
-diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
-index 5a957a9a0984..8ad576ecd0f1 100644
---- a/arch/arm/xen/enlighten.c
-+++ b/arch/arm/xen/enlighten.c
-@@ -370,8 +370,6 @@ static int __init xen_guest_init(void)
- 		return -ENOMEM;
- 	}
- 	gnttab_init();
--	if (!xen_initial_domain())
--		xenbus_probe();
-=20
- 	/*
- 	 * Making sure board specific code will not set up ops for
-diff --git a/drivers/xen/xenbus/xenbus.h b/drivers/xen/xenbus/xenbus.h
-index dc1537335414..2a93b7c9c159 100644
---- a/drivers/xen/xenbus/xenbus.h
-+++ b/drivers/xen/xenbus/xenbus.h
-@@ -115,7 +115,6 @@ int xenbus_probe_node(struct xen_bus_type *bus,
- 		      const char *type,
- 		      const char *nodename);
- int xenbus_probe_devices(struct xen_bus_type *bus);
--void xenbus_probe(void);
-=20
- void xenbus_dev_changed(const char *node, struct xen_bus_type *bus);
-=20
-diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenb=
us_probe.c
-index 18ffd0551b54..8a75092bb148 100644
---- a/drivers/xen/xenbus/xenbus_probe.c
-+++ b/drivers/xen/xenbus/xenbus_probe.c
-@@ -683,7 +683,7 @@ void unregister_xenstore_notifier(struct notifier_bl=
ock *nb)
- }
- EXPORT_SYMBOL_GPL(unregister_xenstore_notifier);
-=20
--void xenbus_probe(void)
-+static void xenbus_probe(void)
- {
- 	xenstored_ready =3D 1;
-=20
-diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
-index 2c43b0ef1e4d..bf3cfc7c35d0 100644
---- a/include/xen/xenbus.h
-+++ b/include/xen/xenbus.h
-@@ -192,8 +192,6 @@ void xs_suspend_cancel(void);
-=20
- struct work_struct;
-=20
--void xenbus_probe(void);
--
- #define XENBUS_IS_ERR_READ(str) ({			\
- 	if (!IS_ERR(str) && strlen(str) =3D=3D 0) {		\
- 		kfree(str);				\
---=20
-2.17.1
-
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.in=
c b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
index 57e44ceb..9750cb55 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
@@ -48,9 +48,4 @@ python() {
     if kernelVersion and LooseVersion(kernelVersion) < '5.10':
         if oe.utils.any_distro_features(d, "arm-autonomy-host arm-autono=
my-guest"):
             d.appendVar('SRC_URI', ' file://files/0001-xen-arm-do-not-se=
tup-the-runstate-info-page-if-kpti-.patch' )
-
-    if kernelVersion and LooseVersion(kernelVersion) < '5.10.17' \
-       and pn !=3D 'linux-libc-headers' \
-       and oe.utils.any_distro_features(d, "arm-autonomy-guest"):
-        d.appendVar('SRC_URI', ' file://files/0001-arm-xen-Don-t-probe-x=
enbus-as-part-of-an-early-initc.patch' )
 }
--=20
2.25.1

