Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.8454.1616680769279452143
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 Mar 2021 06:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2BB01476;
	Thu, 25 Mar 2021 06:59:28 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.27.10])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E9C043F792;
	Thu, 25 Mar 2021 06:59:27 -0700 (PDT)
From: "Peter Hoyes" <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH 2/2] arm-autonomy/linux-arm-autonomy: Fix Dom0 boot issue with preempt_rt kernel
Date: Thu, 25 Mar 2021 14:00:45 +0000
Message-Id: <20210325140045.1463562-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210325140045.1463562-1-peter.hoyes@arm.com>
References: <20210325140045.1463562-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Hoyes <Peter.Hoyes@arm.com>

To fix Dom0 with PREEMPT_RT kernels older than 5.10.24, backport the
following patches:
    0001-xen-events-reset-affinity-of-2-level-event-when-tear.patch
    0002-xen-events-don-t-unmask-an-event-channel-when-an-eoi.patch
    0003-xen-events-avoid-handling-the-same-event-on-two-cpus.patch

Also, add the following fix (waiting to be merged upstream):
    0004-xen-evtchn-Change-irq_info-lock-to-raw_spinlock_t.patch

Issue-Id: SCM-2147
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Change-Id: I0b3a93139b0229ceb6001d87b545704b9bfc581e
---
 ...-affinity-of-2-level-event-when-tear.patch | 119 ++++++
 ...-unmask-an-event-channel-when-an-eoi.patch | 390 ++++++++++++++++++
 ...-handling-the-same-event-on-two-cpus.patch | 130 ++++++
 ...ange-irq_info-lock-to-raw_spinlock_t.patch |  77 ++++
 .../linux/linux-arm-autonomy.inc              |  14 +-
 5 files changed, 727 insertions(+), 3 deletions(-)
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/files/0001-xen=
-events-reset-affinity-of-2-level-event-when-tear.patch
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/files/0002-xen=
-events-don-t-unmask-an-event-channel-when-an-eoi.patch
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/files/0003-xen=
-events-avoid-handling-the-same-event-on-two-cpus.patch
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/files/0004-xen=
-evtchn-Change-irq_info-lock-to-raw_spinlock_t.patch

diff --git a/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-events=
-reset-affinity-of-2-level-event-when-tear.patch b/meta-arm-autonomy/reci=
pes-kernel/linux/files/0001-xen-events-reset-affinity-of-2-level-event-wh=
en-tear.patch
new file mode 100644
index 0000000..7a04073
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-events-reset-=
affinity-of-2-level-event-when-tear.patch
@@ -0,0 +1,119 @@
+From c5844c4a7f3913c9ec6ac0607a7e441df7df1ba4 Mon Sep 17 00:00:00 2001
+From: Juergen Gross <jgross@suse.com>
+Date: Sat, 6 Mar 2021 17:18:31 +0100
+Subject: [PATCH 1/4] xen/events: reset affinity of 2-level event when te=
aring
+ it down
+
+commit 9e77d96b8e2724ed00380189f7b0ded61113b39f upstream.
+
+When creating a new event channel with 2-level events the affinity
+needs to be reset initially in order to avoid using an old affinity
+from earlier usage of the event channel port. So when tearing an event
+channel down reset all affinity bits.
+
+The same applies to the affinity when onlining a vcpu: all old
+affinity settings for this vcpu must be reset. As percpu events get
+initialized before the percpu event channel hook is called,
+resetting of the affinities happens after offlining a vcpu (this is
+working, as initial percpu memory is zeroed out).
+
+Cc: stable@vger.kernel.org
+Reported-by: Julien Grall <julien@xen.org>
+Signed-off-by: Juergen Gross <jgross@suse.com>
+Reviewed-by: Julien Grall <jgrall@amazon.com>
+Link: https://lore.kernel.org/r/20210306161833.4552-2-jgross@suse.com
+Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+Upstream-Status: Backport
+Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
+---
+ drivers/xen/events/events_2l.c       | 15 +++++++++++++++
+ drivers/xen/events/events_base.c     |  1 +
+ drivers/xen/events/events_internal.h |  8 ++++++++
+ 3 files changed, 24 insertions(+)
+
+diff --git a/drivers/xen/events/events_2l.c b/drivers/xen/events/events_=
2l.c
+index da87f3a1e351..a7f413c5c190 100644
+--- a/drivers/xen/events/events_2l.c
++++ b/drivers/xen/events/events_2l.c
+@@ -47,6 +47,11 @@ static unsigned evtchn_2l_max_channels(void)
+ 	return EVTCHN_2L_NR_CHANNELS;
+ }
+=20
++static void evtchn_2l_remove(evtchn_port_t evtchn, unsigned int cpu)
++{
++	clear_bit(evtchn, BM(per_cpu(cpu_evtchn_mask, cpu)));
++}
++
+ static void evtchn_2l_bind_to_cpu(evtchn_port_t evtchn, unsigned int cp=
u,
+ 				  unsigned int old_cpu)
+ {
+@@ -355,9 +360,18 @@ static void evtchn_2l_resume(void)
+ 				EVTCHN_2L_NR_CHANNELS/BITS_PER_EVTCHN_WORD);
+ }
+=20
++static int evtchn_2l_percpu_deinit(unsigned int cpu)
++{
++	memset(per_cpu(cpu_evtchn_mask, cpu), 0, sizeof(xen_ulong_t) *
++			EVTCHN_2L_NR_CHANNELS/BITS_PER_EVTCHN_WORD);
++
++	return 0;
++}
++
+ static const struct evtchn_ops evtchn_ops_2l =3D {
+ 	.max_channels      =3D evtchn_2l_max_channels,
+ 	.nr_channels       =3D evtchn_2l_max_channels,
++	.remove            =3D evtchn_2l_remove,
+ 	.bind_to_cpu       =3D evtchn_2l_bind_to_cpu,
+ 	.clear_pending     =3D evtchn_2l_clear_pending,
+ 	.set_pending       =3D evtchn_2l_set_pending,
+@@ -367,6 +381,7 @@ static const struct evtchn_ops evtchn_ops_2l =3D {
+ 	.unmask            =3D evtchn_2l_unmask,
+ 	.handle_events     =3D evtchn_2l_handle_events,
+ 	.resume	           =3D evtchn_2l_resume,
++	.percpu_deinit     =3D evtchn_2l_percpu_deinit,
+ };
+=20
+ void __init xen_evtchn_2l_init(void)
+diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/event=
s_base.c
+index bbebe248b726..ae9215186093 100644
+--- a/drivers/xen/events/events_base.c
++++ b/drivers/xen/events/events_base.c
+@@ -338,6 +338,7 @@ static int xen_irq_info_pirq_setup(unsigned irq,
+ static void xen_irq_info_cleanup(struct irq_info *info)
+ {
+ 	set_evtchn_to_irq(info->evtchn, -1);
++	xen_evtchn_port_remove(info->evtchn, info->cpu);
+ 	info->evtchn =3D 0;
+ }
+=20
+diff --git a/drivers/xen/events/events_internal.h b/drivers/xen/events/e=
vents_internal.h
+index 0a97c0549db7..18a4090d0709 100644
+--- a/drivers/xen/events/events_internal.h
++++ b/drivers/xen/events/events_internal.h
+@@ -14,6 +14,7 @@ struct evtchn_ops {
+ 	unsigned (*nr_channels)(void);
+=20
+ 	int (*setup)(evtchn_port_t port);
++	void (*remove)(evtchn_port_t port, unsigned int cpu);
+ 	void (*bind_to_cpu)(evtchn_port_t evtchn, unsigned int cpu,
+ 			    unsigned int old_cpu);
+=20
+@@ -54,6 +55,13 @@ static inline int xen_evtchn_port_setup(evtchn_port_t=
 evtchn)
+ 	return 0;
+ }
+=20
++static inline void xen_evtchn_port_remove(evtchn_port_t evtchn,
++					  unsigned int cpu)
++{
++	if (evtchn_ops->remove)
++		evtchn_ops->remove(evtchn, cpu);
++}
++
+ static inline void xen_evtchn_port_bind_to_cpu(evtchn_port_t evtchn,
+ 					       unsigned int cpu,
+ 					       unsigned int old_cpu)
+--=20
+2.17.1
+
diff --git a/meta-arm-autonomy/recipes-kernel/linux/files/0002-xen-events=
-don-t-unmask-an-event-channel-when-an-eoi.patch b/meta-arm-autonomy/reci=
pes-kernel/linux/files/0002-xen-events-don-t-unmask-an-event-channel-when=
-an-eoi.patch
new file mode 100644
index 0000000..8b92eb5
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/files/0002-xen-events-don-t-=
unmask-an-event-channel-when-an-eoi.patch
@@ -0,0 +1,390 @@
+From 3ce11f974986cb4b89126681989e4bafe612592d Mon Sep 17 00:00:00 2001
+From: Juergen Gross <jgross@suse.com>
+Date: Mon, 15 Mar 2021 08:11:29 +0100
+Subject: [PATCH 2/4] xen/events: don't unmask an event channel when an e=
oi is
+ pending
+
+commit 25da4618af240fbec6112401498301a6f2bc9702 upstream.
+
+An event channel should be kept masked when an eoi is pending for it.
+When being migrated to another cpu it might be unmasked, though.
+
+In order to avoid this keep three different flags for each event channel
+to be able to distinguish "normal" masking/unmasking from eoi related
+masking/unmasking and temporary masking. The event channel should only
+be able to generate an interrupt if all flags are cleared.
+
+Cc: stable@vger.kernel.org
+Fixes: 54c9de89895e ("xen/events: add a new "late EOI" evtchn framework"=
)
+Reported-by: Julien Grall <julien@xen.org>
+Signed-off-by: Juergen Gross <jgross@suse.com>
+Reviewed-by: Julien Grall <jgrall@amazon.com>
+Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
+Tested-by: Ross Lagerwall <ross.lagerwall@citrix.com>
+Link: https://lore.kernel.org/r/20210306161833.4552-3-jgross@suse.com
+[boris -- corrected Fixed tag format]
+Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+Upstream-Status: Backport
+Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
+---
+ drivers/xen/events/events_2l.c       |   7 --
+ drivers/xen/events/events_base.c     | 117 ++++++++++++++++++++-------
+ drivers/xen/events/events_fifo.c     |   7 --
+ drivers/xen/events/events_internal.h |   6 --
+ 4 files changed, 88 insertions(+), 49 deletions(-)
+
+diff --git a/drivers/xen/events/events_2l.c b/drivers/xen/events/events_=
2l.c
+index a7f413c5c190..b8f2f971c2f0 100644
+--- a/drivers/xen/events/events_2l.c
++++ b/drivers/xen/events/events_2l.c
+@@ -77,12 +77,6 @@ static bool evtchn_2l_is_pending(evtchn_port_t port)
+ 	return sync_test_bit(port, BM(&s->evtchn_pending[0]));
+ }
+=20
+-static bool evtchn_2l_test_and_set_mask(evtchn_port_t port)
+-{
+-	struct shared_info *s =3D HYPERVISOR_shared_info;
+-	return sync_test_and_set_bit(port, BM(&s->evtchn_mask[0]));
+-}
+-
+ static void evtchn_2l_mask(evtchn_port_t port)
+ {
+ 	struct shared_info *s =3D HYPERVISOR_shared_info;
+@@ -376,7 +370,6 @@ static const struct evtchn_ops evtchn_ops_2l =3D {
+ 	.clear_pending     =3D evtchn_2l_clear_pending,
+ 	.set_pending       =3D evtchn_2l_set_pending,
+ 	.is_pending        =3D evtchn_2l_is_pending,
+-	.test_and_set_mask =3D evtchn_2l_test_and_set_mask,
+ 	.mask              =3D evtchn_2l_mask,
+ 	.unmask            =3D evtchn_2l_unmask,
+ 	.handle_events     =3D evtchn_2l_handle_events,
+diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/event=
s_base.c
+index ae9215186093..101b99576799 100644
+--- a/drivers/xen/events/events_base.c
++++ b/drivers/xen/events/events_base.c
+@@ -96,13 +96,18 @@ struct irq_info {
+ 	struct list_head eoi_list;
+ 	short refcnt;
+ 	short spurious_cnt;
+-	enum xen_irq_type type; /* type */
++	short type;             /* type */
++	u8 mask_reason;         /* Why is event channel masked */
++#define EVT_MASK_REASON_EXPLICIT	0x01
++#define EVT_MASK_REASON_TEMPORARY	0x02
++#define EVT_MASK_REASON_EOI_PENDING	0x04
+ 	unsigned irq;
+ 	evtchn_port_t evtchn;   /* event channel */
+ 	unsigned short cpu;     /* cpu bound */
+ 	unsigned short eoi_cpu; /* EOI must happen on this cpu-1 */
+ 	unsigned int irq_epoch; /* If eoi_cpu valid: irq_epoch of event */
+ 	u64 eoi_time;           /* Time in jiffies when to EOI. */
++	spinlock_t lock;
+=20
+ 	union {
+ 		unsigned short virq;
+@@ -151,6 +156,7 @@ static DEFINE_RWLOCK(evtchn_rwlock);
+  *   evtchn_rwlock
+  *     IRQ-desc lock
+  *       percpu eoi_list_lock
++ *         irq_info->lock
+  */
+=20
+ static LIST_HEAD(xen_irq_list_head);
+@@ -272,6 +278,8 @@ static int xen_irq_info_common_setup(struct irq_info=
 *info,
+ 	info->irq =3D irq;
+ 	info->evtchn =3D evtchn;
+ 	info->cpu =3D cpu;
++	info->mask_reason =3D EVT_MASK_REASON_EXPLICIT;
++	spin_lock_init(&info->lock);
+=20
+ 	ret =3D set_evtchn_to_irq(evtchn, irq);
+ 	if (ret < 0)
+@@ -419,6 +427,34 @@ unsigned int cpu_from_evtchn(evtchn_port_t evtchn)
+ 	return ret;
+ }
+=20
++static void do_mask(struct irq_info *info, u8 reason)
++{
++	unsigned long flags;
++
++	spin_lock_irqsave(&info->lock, flags);
++
++	if (!info->mask_reason)
++		mask_evtchn(info->evtchn);
++
++	info->mask_reason |=3D reason;
++
++	spin_unlock_irqrestore(&info->lock, flags);
++}
++
++static void do_unmask(struct irq_info *info, u8 reason)
++{
++	unsigned long flags;
++
++	spin_lock_irqsave(&info->lock, flags);
++
++	info->mask_reason &=3D ~reason;
++
++	if (!info->mask_reason)
++		unmask_evtchn(info->evtchn);
++
++	spin_unlock_irqrestore(&info->lock, flags);
++}
++
+ #ifdef CONFIG_X86
+ static bool pirq_check_eoi_map(unsigned irq)
+ {
+@@ -546,7 +582,7 @@ static void xen_irq_lateeoi_locked(struct irq_info *=
info, bool spurious)
+ 	}
+=20
+ 	info->eoi_time =3D 0;
+-	unmask_evtchn(evtchn);
++	do_unmask(info, EVT_MASK_REASON_EOI_PENDING);
+ }
+=20
+ static void xen_irq_lateeoi_worker(struct work_struct *work)
+@@ -733,7 +769,8 @@ static void pirq_query_unmask(int irq)
+=20
+ static void eoi_pirq(struct irq_data *data)
+ {
+-	evtchn_port_t evtchn =3D evtchn_from_irq(data->irq);
++	struct irq_info *info =3D info_for_irq(data->irq);
++	evtchn_port_t evtchn =3D info ? info->evtchn : 0;
+ 	struct physdev_eoi eoi =3D { .irq =3D pirq_from_irq(data->irq) };
+ 	int rc =3D 0;
+=20
+@@ -742,14 +779,13 @@ static void eoi_pirq(struct irq_data *data)
+=20
+ 	if (unlikely(irqd_is_setaffinity_pending(data)) &&
+ 	    likely(!irqd_irq_disabled(data))) {
+-		int masked =3D test_and_set_mask(evtchn);
++		do_mask(info, EVT_MASK_REASON_TEMPORARY);
+=20
+ 		clear_evtchn(evtchn);
+=20
+ 		irq_move_masked_irq(data);
+=20
+-		if (!masked)
+-			unmask_evtchn(evtchn);
++		do_unmask(info, EVT_MASK_REASON_TEMPORARY);
+ 	} else
+ 		clear_evtchn(evtchn);
+=20
+@@ -802,7 +838,8 @@ static unsigned int __startup_pirq(unsigned int irq)
+ 		goto err;
+=20
+ out:
+-	unmask_evtchn(evtchn);
++	do_unmask(info, EVT_MASK_REASON_EXPLICIT);
++
+ 	eoi_pirq(irq_get_irq_data(irq));
+=20
+ 	return 0;
+@@ -829,7 +866,7 @@ static void shutdown_pirq(struct irq_data *data)
+ 	if (!VALID_EVTCHN(evtchn))
+ 		return;
+=20
+-	mask_evtchn(evtchn);
++	do_mask(info, EVT_MASK_REASON_EXPLICIT);
+ 	xen_evtchn_close(evtchn);
+ 	xen_irq_info_cleanup(info);
+ }
+@@ -1656,10 +1693,10 @@ void rebind_evtchn_irq(evtchn_port_t evtchn, int=
 irq)
+ }
+=20
+ /* Rebind an evtchn so that it gets delivered to a specific cpu */
+-static int xen_rebind_evtchn_to_cpu(evtchn_port_t evtchn, unsigned int =
tcpu)
++static int xen_rebind_evtchn_to_cpu(struct irq_info *info, unsigned int=
 tcpu)
+ {
+ 	struct evtchn_bind_vcpu bind_vcpu;
+-	int masked;
++	evtchn_port_t evtchn =3D info ? info->evtchn : 0;
+=20
+ 	if (!VALID_EVTCHN(evtchn))
+ 		return -1;
+@@ -1675,7 +1712,7 @@ static int xen_rebind_evtchn_to_cpu(evtchn_port_t =
evtchn, unsigned int tcpu)
+ 	 * Mask the event while changing the VCPU binding to prevent
+ 	 * it being delivered on an unexpected VCPU.
+ 	 */
+-	masked =3D test_and_set_mask(evtchn);
++	do_mask(info, EVT_MASK_REASON_TEMPORARY);
+=20
+ 	/*
+ 	 * If this fails, it usually just indicates that we're dealing with a
+@@ -1685,8 +1722,7 @@ static int xen_rebind_evtchn_to_cpu(evtchn_port_t =
evtchn, unsigned int tcpu)
+ 	if (HYPERVISOR_event_channel_op(EVTCHNOP_bind_vcpu, &bind_vcpu) >=3D 0=
)
+ 		bind_evtchn_to_cpu(evtchn, tcpu);
+=20
+-	if (!masked)
+-		unmask_evtchn(evtchn);
++	do_unmask(info, EVT_MASK_REASON_TEMPORARY);
+=20
+ 	return 0;
+ }
+@@ -1695,7 +1731,7 @@ static int set_affinity_irq(struct irq_data *data,=
 const struct cpumask *dest,
+ 			    bool force)
+ {
+ 	unsigned tcpu =3D cpumask_first_and(dest, cpu_online_mask);
+-	int ret =3D xen_rebind_evtchn_to_cpu(evtchn_from_irq(data->irq), tcpu)=
;
++	int ret =3D xen_rebind_evtchn_to_cpu(info_for_irq(data->irq), tcpu);
+=20
+ 	if (!ret)
+ 		irq_data_update_effective_affinity(data, cpumask_of(tcpu));
+@@ -1714,37 +1750,39 @@ EXPORT_SYMBOL_GPL(xen_set_affinity_evtchn);
+=20
+ static void enable_dynirq(struct irq_data *data)
+ {
+-	evtchn_port_t evtchn =3D evtchn_from_irq(data->irq);
++	struct irq_info *info =3D info_for_irq(data->irq);
++	evtchn_port_t evtchn =3D info ? info->evtchn : 0;
+=20
+ 	if (VALID_EVTCHN(evtchn))
+-		unmask_evtchn(evtchn);
++		do_unmask(info, EVT_MASK_REASON_EXPLICIT);
+ }
+=20
+ static void disable_dynirq(struct irq_data *data)
+ {
+-	evtchn_port_t evtchn =3D evtchn_from_irq(data->irq);
++	struct irq_info *info =3D info_for_irq(data->irq);
++	evtchn_port_t evtchn =3D info ? info->evtchn : 0;
+=20
+ 	if (VALID_EVTCHN(evtchn))
+-		mask_evtchn(evtchn);
++		do_mask(info, EVT_MASK_REASON_EXPLICIT);
+ }
+=20
+ static void ack_dynirq(struct irq_data *data)
+ {
+-	evtchn_port_t evtchn =3D evtchn_from_irq(data->irq);
++	struct irq_info *info =3D info_for_irq(data->irq);
++	evtchn_port_t evtchn =3D info ? info->evtchn : 0;
+=20
+ 	if (!VALID_EVTCHN(evtchn))
+ 		return;
+=20
+ 	if (unlikely(irqd_is_setaffinity_pending(data)) &&
+ 	    likely(!irqd_irq_disabled(data))) {
+-		int masked =3D test_and_set_mask(evtchn);
++		do_mask(info, EVT_MASK_REASON_TEMPORARY);
+=20
+ 		clear_evtchn(evtchn);
+=20
+ 		irq_move_masked_irq(data);
+=20
+-		if (!masked)
+-			unmask_evtchn(evtchn);
++		do_unmask(info, EVT_MASK_REASON_TEMPORARY);
+ 	} else
+ 		clear_evtchn(evtchn);
+ }
+@@ -1755,18 +1793,39 @@ static void mask_ack_dynirq(struct irq_data *dat=
a)
+ 	ack_dynirq(data);
+ }
+=20
++static void lateeoi_ack_dynirq(struct irq_data *data)
++{
++	struct irq_info *info =3D info_for_irq(data->irq);
++	evtchn_port_t evtchn =3D info ? info->evtchn : 0;
++
++	if (VALID_EVTCHN(evtchn)) {
++		do_mask(info, EVT_MASK_REASON_EOI_PENDING);
++		clear_evtchn(evtchn);
++	}
++}
++
++static void lateeoi_mask_ack_dynirq(struct irq_data *data)
++{
++	struct irq_info *info =3D info_for_irq(data->irq);
++	evtchn_port_t evtchn =3D info ? info->evtchn : 0;
++
++	if (VALID_EVTCHN(evtchn)) {
++		do_mask(info, EVT_MASK_REASON_EXPLICIT);
++		clear_evtchn(evtchn);
++	}
++}
++
+ static int retrigger_dynirq(struct irq_data *data)
+ {
+-	evtchn_port_t evtchn =3D evtchn_from_irq(data->irq);
+-	int masked;
++	struct irq_info *info =3D info_for_irq(data->irq);
++	evtchn_port_t evtchn =3D info ? info->evtchn : 0;
+=20
+ 	if (!VALID_EVTCHN(evtchn))
+ 		return 0;
+=20
+-	masked =3D test_and_set_mask(evtchn);
++	do_mask(info, EVT_MASK_REASON_TEMPORARY);
+ 	set_evtchn(evtchn);
+-	if (!masked)
+-		unmask_evtchn(evtchn);
++	do_unmask(info, EVT_MASK_REASON_TEMPORARY);
+=20
+ 	return 1;
+ }
+@@ -1974,8 +2033,8 @@ static struct irq_chip xen_lateeoi_chip __read_mos=
tly =3D {
+ 	.irq_mask		=3D disable_dynirq,
+ 	.irq_unmask		=3D enable_dynirq,
+=20
+-	.irq_ack		=3D mask_ack_dynirq,
+-	.irq_mask_ack		=3D mask_ack_dynirq,
++	.irq_ack		=3D lateeoi_ack_dynirq,
++	.irq_mask_ack		=3D lateeoi_mask_ack_dynirq,
+=20
+ 	.irq_set_affinity	=3D set_affinity_irq,
+ 	.irq_retrigger		=3D retrigger_dynirq,
+diff --git a/drivers/xen/events/events_fifo.c b/drivers/xen/events/event=
s_fifo.c
+index b234f1766810..ad9fe51d3fb3 100644
+--- a/drivers/xen/events/events_fifo.c
++++ b/drivers/xen/events/events_fifo.c
+@@ -209,12 +209,6 @@ static bool evtchn_fifo_is_pending(evtchn_port_t po=
rt)
+ 	return sync_test_bit(EVTCHN_FIFO_BIT(PENDING, word), BM(word));
+ }
+=20
+-static bool evtchn_fifo_test_and_set_mask(evtchn_port_t port)
+-{
+-	event_word_t *word =3D event_word_from_port(port);
+-	return sync_test_and_set_bit(EVTCHN_FIFO_BIT(MASKED, word), BM(word));
+-}
+-
+ static void evtchn_fifo_mask(evtchn_port_t port)
+ {
+ 	event_word_t *word =3D event_word_from_port(port);
+@@ -423,7 +417,6 @@ static const struct evtchn_ops evtchn_ops_fifo =3D {
+ 	.clear_pending     =3D evtchn_fifo_clear_pending,
+ 	.set_pending       =3D evtchn_fifo_set_pending,
+ 	.is_pending        =3D evtchn_fifo_is_pending,
+-	.test_and_set_mask =3D evtchn_fifo_test_and_set_mask,
+ 	.mask              =3D evtchn_fifo_mask,
+ 	.unmask            =3D evtchn_fifo_unmask,
+ 	.handle_events     =3D evtchn_fifo_handle_events,
+diff --git a/drivers/xen/events/events_internal.h b/drivers/xen/events/e=
vents_internal.h
+index 18a4090d0709..4d3398eff9cd 100644
+--- a/drivers/xen/events/events_internal.h
++++ b/drivers/xen/events/events_internal.h
+@@ -21,7 +21,6 @@ struct evtchn_ops {
+ 	void (*clear_pending)(evtchn_port_t port);
+ 	void (*set_pending)(evtchn_port_t port);
+ 	bool (*is_pending)(evtchn_port_t port);
+-	bool (*test_and_set_mask)(evtchn_port_t port);
+ 	void (*mask)(evtchn_port_t port);
+ 	void (*unmask)(evtchn_port_t port);
+=20
+@@ -84,11 +83,6 @@ static inline bool test_evtchn(evtchn_port_t port)
+ 	return evtchn_ops->is_pending(port);
+ }
+=20
+-static inline bool test_and_set_mask(evtchn_port_t port)
+-{
+-	return evtchn_ops->test_and_set_mask(port);
+-}
+-
+ static inline void mask_evtchn(evtchn_port_t port)
+ {
+ 	return evtchn_ops->mask(port);
+--=20
+2.17.1
+
diff --git a/meta-arm-autonomy/recipes-kernel/linux/files/0003-xen-events=
-avoid-handling-the-same-event-on-two-cpus.patch b/meta-arm-autonomy/reci=
pes-kernel/linux/files/0003-xen-events-avoid-handling-the-same-event-on-t=
wo-cpus.patch
new file mode 100644
index 0000000..f99aef3
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/files/0003-xen-events-avoid-=
handling-the-same-event-on-two-cpus.patch
@@ -0,0 +1,130 @@
+From 50e4eb8d1b70197cf682027f501c951a39ddf172 Mon Sep 17 00:00:00 2001
+From: Juergen Gross <jgross@suse.com>
+Date: Mon, 15 Mar 2021 08:23:51 +0100
+Subject: [PATCH 3/4] xen/events: avoid handling the same event on two cp=
us at
+ the same time
+
+commit b6622798bc50b625a1e62f82c7190df40c1f5b21 upstream.
+
+When changing the cpu affinity of an event it can happen today that
+(with some unlucky timing) the same event will be handled on the old
+and the new cpu at the same time.
+
+Avoid that by adding an "event active" flag to the per-event data and
+call the handler only if this flag isn't set.
+
+Cc: stable@vger.kernel.org
+Reported-by: Julien Grall <julien@xen.org>
+Signed-off-by: Juergen Gross <jgross@suse.com>
+Reviewed-by: Julien Grall <jgrall@amazon.com>
+Link: https://lore.kernel.org/r/20210306161833.4552-4-jgross@suse.com
+Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+Upstream-Status: Backport
+Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
+---
+ drivers/xen/events/events_base.c | 26 ++++++++++++++++++--------
+ 1 file changed, 18 insertions(+), 8 deletions(-)
+
+diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/event=
s_base.c
+index 101b99576799..7bd03f6e0422 100644
+--- a/drivers/xen/events/events_base.c
++++ b/drivers/xen/events/events_base.c
+@@ -101,6 +101,7 @@ struct irq_info {
+ #define EVT_MASK_REASON_EXPLICIT	0x01
+ #define EVT_MASK_REASON_TEMPORARY	0x02
+ #define EVT_MASK_REASON_EOI_PENDING	0x04
++	u8 is_active;		/* Is event just being handled? */
+ 	unsigned irq;
+ 	evtchn_port_t evtchn;   /* event channel */
+ 	unsigned short cpu;     /* cpu bound */
+@@ -751,6 +752,12 @@ static void xen_evtchn_close(evtchn_port_t port)
+ 		BUG();
+ }
+=20
++static void event_handler_exit(struct irq_info *info)
++{
++	smp_store_release(&info->is_active, 0);
++	clear_evtchn(info->evtchn);
++}
++
+ static void pirq_query_unmask(int irq)
+ {
+ 	struct physdev_irq_status_query irq_status;
+@@ -781,13 +788,13 @@ static void eoi_pirq(struct irq_data *data)
+ 	    likely(!irqd_irq_disabled(data))) {
+ 		do_mask(info, EVT_MASK_REASON_TEMPORARY);
+=20
+-		clear_evtchn(evtchn);
++		event_handler_exit(info);
+=20
+ 		irq_move_masked_irq(data);
+=20
+ 		do_unmask(info, EVT_MASK_REASON_TEMPORARY);
+ 	} else
+-		clear_evtchn(evtchn);
++		event_handler_exit(info);
+=20
+ 	if (pirq_needs_eoi(data->irq)) {
+ 		rc =3D HYPERVISOR_physdev_op(PHYSDEVOP_eoi, &eoi);
+@@ -1603,6 +1610,8 @@ void handle_irq_for_port(evtchn_port_t port, struc=
t evtchn_loop_ctrl *ctrl)
+ 	}
+=20
+ 	info =3D info_for_irq(irq);
++	if (xchg_acquire(&info->is_active, 1))
++		return;
+=20
+ 	if (ctrl->defer_eoi) {
+ 		info->eoi_cpu =3D smp_processor_id();
+@@ -1778,13 +1787,13 @@ static void ack_dynirq(struct irq_data *data)
+ 	    likely(!irqd_irq_disabled(data))) {
+ 		do_mask(info, EVT_MASK_REASON_TEMPORARY);
+=20
+-		clear_evtchn(evtchn);
++		event_handler_exit(info);
+=20
+ 		irq_move_masked_irq(data);
+=20
+ 		do_unmask(info, EVT_MASK_REASON_TEMPORARY);
+ 	} else
+-		clear_evtchn(evtchn);
++		event_handler_exit(info);
+ }
+=20
+ static void mask_ack_dynirq(struct irq_data *data)
+@@ -1800,7 +1809,7 @@ static void lateeoi_ack_dynirq(struct irq_data *da=
ta)
+=20
+ 	if (VALID_EVTCHN(evtchn)) {
+ 		do_mask(info, EVT_MASK_REASON_EOI_PENDING);
+-		clear_evtchn(evtchn);
++		event_handler_exit(info);
+ 	}
+ }
+=20
+@@ -1811,7 +1820,7 @@ static void lateeoi_mask_ack_dynirq(struct irq_dat=
a *data)
+=20
+ 	if (VALID_EVTCHN(evtchn)) {
+ 		do_mask(info, EVT_MASK_REASON_EXPLICIT);
+-		clear_evtchn(evtchn);
++		event_handler_exit(info);
+ 	}
+ }
+=20
+@@ -1922,10 +1931,11 @@ static void restore_cpu_ipis(unsigned int cpu)
+ /* Clear an irq's pending state, in preparation for polling on it */
+ void xen_clear_irq_pending(int irq)
+ {
+-	evtchn_port_t evtchn =3D evtchn_from_irq(irq);
++	struct irq_info *info =3D info_for_irq(irq);
++	evtchn_port_t evtchn =3D info ? info->evtchn : 0;
+=20
+ 	if (VALID_EVTCHN(evtchn))
+-		clear_evtchn(evtchn);
++		event_handler_exit(info);
+ }
+ EXPORT_SYMBOL(xen_clear_irq_pending);
+ void xen_set_irq_pending(int irq)
+--=20
+2.17.1
+
diff --git a/meta-arm-autonomy/recipes-kernel/linux/files/0004-xen-evtchn=
-Change-irq_info-lock-to-raw_spinlock_t.patch b/meta-arm-autonomy/recipes=
-kernel/linux/files/0004-xen-evtchn-Change-irq_info-lock-to-raw_spinlock_=
t.patch
new file mode 100644
index 0000000..f37be44
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/files/0004-xen-evtchn-Change=
-irq_info-lock-to-raw_spinlock_t.patch
@@ -0,0 +1,77 @@
+From 3bc59ed7bc26c967cfe6eb9c1ef9a1ef9108e99d Mon Sep 17 00:00:00 2001
+From: Luca Fancellu <luca.fancellu@arm.com>
+Date: Tue, 23 Mar 2021 16:16:39 +0000
+Subject: [PATCH 4/4] xen/evtchn: Change irq_info lock to raw_spinlock_t
+
+Unmask operation must be called with interrupt disabled,
+on preempt_rt spin_lock_irqsave/spin_unlock_irqrestore
+don't disable/enable interrupts, so use raw_* implementation
+and change lock variable in struct irq_info from spinlock_t
+to raw_spinlock_t
+
+Issue-Id: SCM-2147
+
+Upstream-Status: Pending
+Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
+---
+ drivers/xen/events/events_base.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/event=
s_base.c
+index 7bd03f6e0422..b91c19b90b8b 100644
+--- a/drivers/xen/events/events_base.c
++++ b/drivers/xen/events/events_base.c
+@@ -108,7 +108,7 @@ struct irq_info {
+ 	unsigned short eoi_cpu; /* EOI must happen on this cpu-1 */
+ 	unsigned int irq_epoch; /* If eoi_cpu valid: irq_epoch of event */
+ 	u64 eoi_time;           /* Time in jiffies when to EOI. */
+-	spinlock_t lock;
++	raw_spinlock_t lock;
+=20
+ 	union {
+ 		unsigned short virq;
+@@ -280,7 +280,7 @@ static int xen_irq_info_common_setup(struct irq_info=
 *info,
+ 	info->evtchn =3D evtchn;
+ 	info->cpu =3D cpu;
+ 	info->mask_reason =3D EVT_MASK_REASON_EXPLICIT;
+-	spin_lock_init(&info->lock);
++	raw_spin_lock_init(&info->lock);
+=20
+ 	ret =3D set_evtchn_to_irq(evtchn, irq);
+ 	if (ret < 0)
+@@ -432,28 +432,28 @@ static void do_mask(struct irq_info *info, u8 reas=
on)
+ {
+ 	unsigned long flags;
+=20
+-	spin_lock_irqsave(&info->lock, flags);
++	raw_spin_lock_irqsave(&info->lock, flags);
+=20
+ 	if (!info->mask_reason)
+ 		mask_evtchn(info->evtchn);
+=20
+ 	info->mask_reason |=3D reason;
+=20
+-	spin_unlock_irqrestore(&info->lock, flags);
++	raw_spin_unlock_irqrestore(&info->lock, flags);
+ }
+=20
+ static void do_unmask(struct irq_info *info, u8 reason)
+ {
+ 	unsigned long flags;
+=20
+-	spin_lock_irqsave(&info->lock, flags);
++	raw_spin_lock_irqsave(&info->lock, flags);
+=20
+ 	info->mask_reason &=3D ~reason;
+=20
+ 	if (!info->mask_reason)
+ 		unmask_evtchn(info->evtchn);
+=20
+-	spin_unlock_irqrestore(&info->lock, flags);
++	raw_spin_unlock_irqrestore(&info->lock, flags);
+ }
+=20
+ #ifdef CONFIG_X86
+--=20
+2.17.1
+
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.in=
c b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
index 9750cb5..dc7accc 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
@@ -40,10 +40,18 @@ python() {
     kernelVersion =3D d.getVar('LINUX_VERSION')
     pn =3D d.getVar('PN')
=20
-    if kernelVersion and LooseVersion(kernelVersion) < '5.9' \
-       and pn !=3D 'linux-libc-headers' \
+    if kernelVersion and pn !=3D 'linux-libc-headers' \
        and oe.utils.any_distro_features(d, "arm-autonomy-host arm-autono=
my-guest"):
-        d.appendVar('SRC_URI', ' file://files/0001-arm-arm64-xen-Fix-to-=
convert-percpu-address-to-gfn-c.patch' )
+        if LooseVersion(kernelVersion) < '5.9':
+           d.appendVar('SRC_URI', ' file://files/0001-arm-arm64-xen-Fix-=
to-convert-percpu-address-to-gfn-c.patch' )
+        if LooseVersion(kernelVersion) =3D=3D '5.10.23':
+           # Kernel version < 5.10.24 needs these backport patches to ap=
ply the
+           # 0004-xen-evtchn-Change-irq_info-lock-to-raw_spinlock_t.patc=
h
+           d.appendVar('SRC_URI', ' file://files/0001-xen-events-reset-a=
ffinity-of-2-level-event-when-tear.patch \
+                file://files/0002-xen-events-don-t-unmask-an-event-chann=
el-when-an-eoi.patch \
+                file://files/0003-xen-events-avoid-handling-the-same-eve=
nt-on-two-cpus.patch' )
+        if LooseVersion(kernelVersion) >=3D '5.10':
+           d.appendVar('SRC_URI', ' file://files/0004-xen-evtchn-Change-=
irq_info-lock-to-raw_spinlock_t.patch' )
=20
     if kernelVersion and LooseVersion(kernelVersion) < '5.10':
         if oe.utils.any_distro_features(d, "arm-autonomy-host arm-autono=
my-guest"):
--=20
2.25.1

