Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web09.3823.1620269409958837745
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 May 2021 19:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=otjx1XxS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id i67so3703400qkc.4
        for <meta-arm@lists.yoctoproject.org>; Wed, 05 May 2021 19:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7hqflpfi6sBtFhQ6p3rHmNO4kbKf1E40F7DDAs2VBCc=;
        b=otjx1XxSqFelfuCjrhZE5goxgwjjKAUobnI/eJhEjtpCo3FY9qMxYxzmtgZgeCiU6e
         0ndItbvtSfn8dj0xbgUWbQbK0IkWIFyCdXf6+DEuMz/eaoob1ZlPcMvST/MjcWTYyJp3
         h8L+pm2rE/IQelkXJRWn+XoL4WcAbkQ4PE7biJb4wWHE/evUUDpUib6uAG89DTbIcVBV
         orFKRnRnWLmBkmI8syCqodlbeql0IL7qmAYBHjeI0/Nmi3hUG2oCuLx+djrH1+YxTec2
         AavifgluDZyDuHGsVhW8hYFYT/nHdjC9UFBCQ+jHIvmTjhZGeo9PgvojNJA7QTGo5YVt
         QWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7hqflpfi6sBtFhQ6p3rHmNO4kbKf1E40F7DDAs2VBCc=;
        b=L/v7hfL7EWa5Nx668h8RV+qjZaM4czaX7yup2GTDIv50FoQy8bLby2U5xii3kogkwD
         Bwxb6Y7cjbt6XU+iR7TnAkZU3dur11wrQvywPMrxh0IceynX7nuqEPOaygEhKbquKJiq
         mCZaJRphHHekYVcwIoKpg89QtAIuVA8SXH/n5ghoh2u+JXRAQ286PNEGEEzKiqAV24fx
         o+rrREaMqJ4xEyvV6oSuwbbuBFcXmEJM9q+TsuNajwXH3aXyj2SDloXwoiRyUhuCOpDI
         8sjxJEDF0RgOR1niFB+qJrkFyJPli9w1lTq9iBJJxafHR0KCtDn8klSofiIrTJ7D7uUD
         VajQ==
X-Gm-Message-State: AOAM5327wOgzbjycfFaLsjIQIOlbs8fpSyqymI4qtJer/BYmErdMXsoE
	UoR7vikU2gczMyisOnUf/ysZwQ==
X-Google-Smtp-Source: ABdhPJz/hu+lRYe+PPGiwYKWVYAwmhk4S38gRzdaRODP15xcugMX6vuI340JvlcKuE9GkczRQ9G6Og==
X-Received: by 2002:a37:ba03:: with SMTP id k3mr1903328qkf.496.1620269409049;
        Wed, 05 May 2021 19:50:09 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:cd46:4666:8655:c170])
        by smtp.gmail.com with ESMTPSA id r1sm1089370qtt.3.2021.05.05.19.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 19:50:08 -0700 (PDT)
Date: Wed, 5 May 2021 22:50:07 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-autonomy/linux-arm-autonomy: Remove Xen irq lock patch
Message-ID: <20210506025007.GA12457@kudzu.us>
References: <20210423164934.3238671-1-peter.hoyes@arm.com>
 <AM6PR08MB3461B34229304863B7669494925A9@AM6PR08MB3461.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AM6PR08MB3461B34229304863B7669494925A9@AM6PR08MB3461.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 04, 2021 at 08:45:32AM +0000, Diego Sueiro wrote:
> Hello Jon,
> 
> Can you please backport this patch to hardknott branch?

Done

> 
> Cheers,
> 
> --
> Diego Sueiro
> 
> >-----Original Message-----
> >From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> >On Behalf Of Peter Hoyes via lists.yoctoproject.org
> >Sent: 23 April 2021 17:50
> >To: meta-arm@lists.yoctoproject.org
> >Cc: nd <nd@arm.com>; Peter Hoyes <Peter.Hoyes@arm.com>
> >Subject: [meta-arm] [PATCH] arm-autonomy/linux-arm-autonomy: Remove
> >Xen irq lock patch
> >
> >From: Peter Hoyes <Peter.Hoyes@arm.com>
> >
> >The following patch has been backported to kernel 5.10.30:
> >    0001-xen-evtchn-Change-irq_info-lock-to-raw_spinlock_t.patch
> >
> >Issue-Id: SCM-2307
> >Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> >Change-Id: I9cef017b60891780176dff944e3eca5986746d8a
> >---
> > ...ange-irq_info-lock-to-raw_spinlock_t.patch | 77 -------------------
> > .../linux/linux-arm-autonomy.inc              |  2 -
> > 2 files changed, 79 deletions(-)
> > delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/files/0001-
> >xen-evtchn-Change-irq_info-lock-to-raw_spinlock_t.patch
> >
> >diff --git a/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-evtchn-
> >Change-irq_info-lock-to-raw_spinlock_t.patch b/meta-arm-autonomy/recipes-
> >kernel/linux/files/0001-xen-evtchn-Change-irq_info-lock-to-
> >raw_spinlock_t.patch
> >deleted file mode 100644
> >index f37be44..0000000
> >--- a/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-evtchn-Change-
> >irq_info-lock-to-raw_spinlock_t.patch
> >+++ /dev/null
> >@@ -1,77 +0,0 @@
> >-From 3bc59ed7bc26c967cfe6eb9c1ef9a1ef9108e99d Mon Sep 17 00:00:00
> >2001
> >-From: Luca Fancellu <luca.fancellu@arm.com>
> >-Date: Tue, 23 Mar 2021 16:16:39 +0000
> >-Subject: [PATCH 4/4] xen/evtchn: Change irq_info lock to raw_spinlock_t
> >-
> >-Unmask operation must be called with interrupt disabled, -on preempt_rt
> >spin_lock_irqsave/spin_unlock_irqrestore
> >-don't disable/enable interrupts, so use raw_* implementation -and change
> >lock variable in struct irq_info from spinlock_t -to raw_spinlock_t
> >-
> >-Issue-Id: SCM-2147
> >-
> >-Upstream-Status: Pending
> >-Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> >----
> >- drivers/xen/events/events_base.c | 12 ++++++------
> >- 1 file changed, 6 insertions(+), 6 deletions(-)
> >-
> >-diff --git a/drivers/xen/events/events_base.c
> >b/drivers/xen/events/events_base.c
> >-index 7bd03f6e0422..b91c19b90b8b 100644
> >---- a/drivers/xen/events/events_base.c
> >-+++ b/drivers/xen/events/events_base.c
> >-@@ -108,7 +108,7 @@ struct irq_info {
> >- 	unsigned short eoi_cpu; /* EOI must happen on this cpu-1 */
> >- 	unsigned int irq_epoch; /* If eoi_cpu valid: irq_epoch of event */
> >- 	u64 eoi_time;           /* Time in jiffies when to EOI. */
> >--	spinlock_t lock;
> >-+	raw_spinlock_t lock;
> >-
> >- 	union {
> >- 		unsigned short virq;
> >-@@ -280,7 +280,7 @@ static int xen_irq_info_common_setup(struct irq_info
> >*info,
> >- 	info->evtchn = evtchn;
> >- 	info->cpu = cpu;
> >- 	info->mask_reason = EVT_MASK_REASON_EXPLICIT;
> >--	spin_lock_init(&info->lock);
> >-+	raw_spin_lock_init(&info->lock);
> >-
> >- 	ret = set_evtchn_to_irq(evtchn, irq);
> >- 	if (ret < 0)
> >-@@ -432,28 +432,28 @@ static void do_mask(struct irq_info *info, u8
> >reason)
> >- {
> >- 	unsigned long flags;
> >-
> >--	spin_lock_irqsave(&info->lock, flags);
> >-+	raw_spin_lock_irqsave(&info->lock, flags);
> >-
> >- 	if (!info->mask_reason)
> >- 		mask_evtchn(info->evtchn);
> >-
> >- 	info->mask_reason |= reason;
> >-
> >--	spin_unlock_irqrestore(&info->lock, flags);
> >-+	raw_spin_unlock_irqrestore(&info->lock, flags);
> >- }
> >-
> >- static void do_unmask(struct irq_info *info, u8 reason)
> >- {
> >- 	unsigned long flags;
> >-
> >--	spin_lock_irqsave(&info->lock, flags);
> >-+	raw_spin_lock_irqsave(&info->lock, flags);
> >-
> >- 	info->mask_reason &= ~reason;
> >-
> >- 	if (!info->mask_reason)
> >- 		unmask_evtchn(info->evtchn);
> >-
> >--	spin_unlock_irqrestore(&info->lock, flags);
> >-+	raw_spin_unlock_irqrestore(&info->lock, flags);
> >- }
> >-
> >- #ifdef CONFIG_X86
> >---
> >-2.17.1
> >-
> >diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> >b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> >index 6927987..5361e75 100644
> >--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> >+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> >@@ -44,8 +44,6 @@ python() {
> >        and oe.utils.any_distro_features(d, "arm-autonomy-host arm-autonomy-
> >guest"):
> >         if LooseVersion(kernelVersion) < '5.9':
> >            d.appendVar('SRC_URI', ' file://files/0001-arm-arm64-xen-Fix-to-
> >convert-percpu-address-to-gfn-c.patch' )
> >-        if '5.10' <= LooseVersion(kernelVersion) < '5.12':
> >-           d.appendVar('SRC_URI', ' file://files/0001-xen-evtchn-Change-irq_info-
> >lock-to-raw_spinlock_t.patch' )
> >
> >     if kernelVersion and LooseVersion(kernelVersion) < '5.10':
> >         if oe.utils.any_distro_features(d, "arm-autonomy-host arm-autonomy-
> >guest"):
> >--
> >2.25.1
> 

> 
> 
> 

