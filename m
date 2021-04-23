Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.66.1619196571339085262
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Apr 2021 09:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54A271396;
	Fri, 23 Apr 2021 09:49:30 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.60.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA5173F774;
	Fri, 23 Apr 2021 09:49:29 -0700 (PDT)
From: "Peter Hoyes" <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm-autonomy/linux-arm-autonomy: Remove Xen irq lock patch
Date: Fri, 23 Apr 2021 17:49:34 +0100
Message-Id: <20210423164934.3238671-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Hoyes <Peter.Hoyes@arm.com>

The following patch has been backported to kernel 5.10.30:
    0001-xen-evtchn-Change-irq_info-lock-to-raw_spinlock_t.patch

Issue-Id: SCM-2307
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I9cef017b60891780176dff944e3eca5986746d8a
---
 ...ange-irq_info-lock-to-raw_spinlock_t.patch | 77 -------------------
 .../linux/linux-arm-autonomy.inc              |  2 -
 2 files changed, 79 deletions(-)
 delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/files/0001-xen=
-evtchn-Change-irq_info-lock-to-raw_spinlock_t.patch

diff --git a/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-evtchn=
-Change-irq_info-lock-to-raw_spinlock_t.patch b/meta-arm-autonomy/recipes=
-kernel/linux/files/0001-xen-evtchn-Change-irq_info-lock-to-raw_spinlock_=
t.patch
deleted file mode 100644
index f37be44..0000000
--- a/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-evtchn-Change=
-irq_info-lock-to-raw_spinlock_t.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 3bc59ed7bc26c967cfe6eb9c1ef9a1ef9108e99d Mon Sep 17 00:00:00 2001
-From: Luca Fancellu <luca.fancellu@arm.com>
-Date: Tue, 23 Mar 2021 16:16:39 +0000
-Subject: [PATCH 4/4] xen/evtchn: Change irq_info lock to raw_spinlock_t
-
-Unmask operation must be called with interrupt disabled,
-on preempt_rt spin_lock_irqsave/spin_unlock_irqrestore
-don't disable/enable interrupts, so use raw_* implementation
-and change lock variable in struct irq_info from spinlock_t
-to raw_spinlock_t
-
-Issue-Id: SCM-2147
-
-Upstream-Status: Pending
-Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
----
- drivers/xen/events/events_base.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/event=
s_base.c
-index 7bd03f6e0422..b91c19b90b8b 100644
---- a/drivers/xen/events/events_base.c
-+++ b/drivers/xen/events/events_base.c
-@@ -108,7 +108,7 @@ struct irq_info {
- 	unsigned short eoi_cpu; /* EOI must happen on this cpu-1 */
- 	unsigned int irq_epoch; /* If eoi_cpu valid: irq_epoch of event */
- 	u64 eoi_time;           /* Time in jiffies when to EOI. */
--	spinlock_t lock;
-+	raw_spinlock_t lock;
-=20
- 	union {
- 		unsigned short virq;
-@@ -280,7 +280,7 @@ static int xen_irq_info_common_setup(struct irq_info=
 *info,
- 	info->evtchn =3D evtchn;
- 	info->cpu =3D cpu;
- 	info->mask_reason =3D EVT_MASK_REASON_EXPLICIT;
--	spin_lock_init(&info->lock);
-+	raw_spin_lock_init(&info->lock);
-=20
- 	ret =3D set_evtchn_to_irq(evtchn, irq);
- 	if (ret < 0)
-@@ -432,28 +432,28 @@ static void do_mask(struct irq_info *info, u8 reas=
on)
- {
- 	unsigned long flags;
-=20
--	spin_lock_irqsave(&info->lock, flags);
-+	raw_spin_lock_irqsave(&info->lock, flags);
-=20
- 	if (!info->mask_reason)
- 		mask_evtchn(info->evtchn);
-=20
- 	info->mask_reason |=3D reason;
-=20
--	spin_unlock_irqrestore(&info->lock, flags);
-+	raw_spin_unlock_irqrestore(&info->lock, flags);
- }
-=20
- static void do_unmask(struct irq_info *info, u8 reason)
- {
- 	unsigned long flags;
-=20
--	spin_lock_irqsave(&info->lock, flags);
-+	raw_spin_lock_irqsave(&info->lock, flags);
-=20
- 	info->mask_reason &=3D ~reason;
-=20
- 	if (!info->mask_reason)
- 		unmask_evtchn(info->evtchn);
-=20
--	spin_unlock_irqrestore(&info->lock, flags);
-+	raw_spin_unlock_irqrestore(&info->lock, flags);
- }
-=20
- #ifdef CONFIG_X86
---=20
-2.17.1
-
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.in=
c b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
index 6927987..5361e75 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
@@ -44,8 +44,6 @@ python() {
        and oe.utils.any_distro_features(d, "arm-autonomy-host arm-autono=
my-guest"):
         if LooseVersion(kernelVersion) < '5.9':
            d.appendVar('SRC_URI', ' file://files/0001-arm-arm64-xen-Fix-=
to-convert-percpu-address-to-gfn-c.patch' )
-        if '5.10' <=3D LooseVersion(kernelVersion) < '5.12':
-           d.appendVar('SRC_URI', ' file://files/0001-xen-evtchn-Change-=
irq_info-lock-to-raw_spinlock_t.patch' )
=20
     if kernelVersion and LooseVersion(kernelVersion) < '5.10':
         if oe.utils.any_distro_features(d, "arm-autonomy-host arm-autono=
my-guest"):
--=20
2.25.1

