Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB4AC433EF
	for <webhook@archiver.kernel.org>; Sun, 12 Dec 2021 02:42:57 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.30091.1639276975726047383
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 11 Dec 2021 18:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=pr3M3Rvy;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id p4so11266667qkm.7
        for <meta-arm@lists.yoctoproject.org>;
 Sat, 11 Dec 2021 18:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y7Y6pAIIlW5Kgu+ojtjDLL8JFmvZptK0RTa0WldrGug=;
        b=pr3M3Rvy530X0l5AZwAoWnbQUS3popZTj7niraEDQO44MdGVllO91wD8v4ka87wXeM
         ETFgZ53c8Z7fbnzG1PMzbf97vQlJZorBbRUXvWc+k3TvDGJFnOsgNYBXDEPji/lcx7jv
         C6wdCMK53RpgCnaTvoYALrnmUI0WRs5rH5+cb8wz9FUgy6t+Ik2oquI661PjwduGoz2P
         dfdfo47Kjs9I3b8IF6ttr7X2olJkvEd6ByB1HMVlxdQ/6t98r9yQlovgIrpWtMwS5O1j
         t4T3TIwVR9Ry9LzAUw/bOm7fPuL3zljLZVBC90Jrju/4pjK9jCdGlLDCFK+fahgL4XI3
         xo9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y7Y6pAIIlW5Kgu+ojtjDLL8JFmvZptK0RTa0WldrGug=;
        b=y4J9ut1cnZ8sV/hMLWk1RXwc6IDsye2qcydeb1Qc3XrBawBWVTP5gKnPru05iOdM2Z
         iy1fU4DukWWCYGQ2JtXCd/vNoNN5vlVPNcwr1wE4/aHu7UOroQwgo+vQeYsm2vCTZzQl
         KHTXQPRhPpraIeALwyCQDmQGbPoi0TxAdApjcFgUXn5lPCkQrHG6zBmd4PC3SxeNcMol
         4OQVChOT6roIm7UswhjM9Vnxwai/RxcubO2tsHwZ8hECRMLFCI9QUyCEAoSNDUHPaxEs
         UFyXSrPXPNsu94dDgMVl5G5SllD/mKBiPrmQI2AgkiZWme71ndl93F9EnhOejh7/cwpl
         Xc7Q==
X-Gm-Message-State: AOAM530hJetCiHfYKhW9xUGBHdEEHv4ikn4KcHCwFRWFHI3MGMPq2jT5
	cm4Rxkkj3cDQOH4drNde4SVylcTe0OYDkKds
X-Google-Smtp-Source: 
 ABdhPJxM4x3BDrnRnAuQPrul2gPWNU6orW0TI6aI8WpF8v2C8qwnsYkzqQLpT9pnP6aO57dRcEoM7w==
X-Received: by 2002:a37:a64f:: with SMTP id
 p76mr27290367qke.154.1639276974703;
        Sat, 11 Dec 2021 18:42:54 -0800 (PST)
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id
 h19sm5779971qth.63.2021.12.11.18.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 18:42:54 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	abdellatif.elkhlifi@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH][HONISTER 0/9] backport "corstone1000: secure partitions
 patchset"
Date: Sat, 11 Dec 2021 21:34:55 -0500
Message-Id: <163927649499.30557.17364357099516589293.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211211100837.19703-1-abdellatif.elkhlifi@arm.com>
References: <20211211100837.19703-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 12 Dec 2021 02:42:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2635

On Sat, 11 Dec 2021 10:08:28 +0000, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> Backporting already merged commits on master:
> 
> corstone1000: secure partitions patchset
> 
> Abdellatif El Khlifi (2):
>   arm-bsp/u-boot: corstone1000: setting the boot console output
>   arm-bsp/u-boot: corstone1000: remove the use of fdt_addr_r
> 
> [...]

Applied, thanks!

[1/9] arm-bsp/u-boot: corstone1000: setting the boot console output
      commit: 4a66446a51c74c5573a14e1e559e4a4e1833d1d0
[2/9] arm-bsp/u-boot: corstone1000: remove the use of fdt_addr_r
      commit: d83f7c79558fda0c8b59172c998b38315740e26b
[3/9] arm-bsp/trusted-firmware-m: corstone1000: Aligning with TF-M master
      commit: 6a175f4b1ca1c52b674588cefbfbb5a493bf28cb
[4/9] arm-bsp/secure-partitions: add openamp rpc caller
      commit: 9b4cd95b8c381dfb67a9eefe7673e15f78c8fe08
[5/9] arm-bsp/optee-os: add openamp-virtio
      commit: 24ecb7cf1894ff4d5f1aa2ba03df2b1f1f7e8ae1
[6/9] arm-bsp/secure-partitions: Add psa client definitions for ff-m
      commit: fac6216f09d3d447a13b01807e8863ea66aa9c78
[7/9] arm-bsp/secure-partitions: add common service component to ipc support
      commit: 117dd9583a676c550ee0e189ea57450ee701231a
[8/9] arm-bsp/secure-partitions: add secure storage ipc backend
      commit: 1359423f0f12250d542ab813f6de9abde499e7bc
[9/9] arm-bsp/secure-partitions: Use secure storage ipc and openamp for se_proxy
      commit: 8649420ff5cd40c3bfd49cd0344a7b46c4972f7f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

