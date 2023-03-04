Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707EFC64EC4
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 17:00:06 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.12831.1677949196140033241
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 04 Mar 2023 08:59:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=d5YPL3TE;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id c19so6230881qtn.13
        for <meta-arm@lists.yoctoproject.org>; Sat, 04 Mar 2023 08:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1677949195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAfyK9DNMLG/KCXSLUPXo/iiyJ33hja4bv4sDaWI1Ao=;
        b=d5YPL3TEa2PqZNBqCX/WLZ9EMbWwhTJuFU5xrDj4AClg36967jwuqWTSeT4QG5Fdut
         Z7doVpFjlrAQPCqqzpBZ+EYib3Sxxcorn2zVgJegq5nR5FP4eLIKHrBS1HK3sxLIJ6v3
         1MJponW6Y9mxRKwc1V3xbIk2ailLJyj6o7sQ3eM8HwOdJv2V/bWHWWPjz4HYqxiTTDLo
         bUITJk8K88wK7+LRJyhqfoRZWIxs4Tg0QjGcaMxQRNEECPQM5iE8jMxEmqqR+s+XhZru
         We1ufm1x4TDtBuUiDkMzkJuJtdYDpTNcGOcq8FJek7lm7B+xiTJhis0KuRiUglaeOecE
         vg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAfyK9DNMLG/KCXSLUPXo/iiyJ33hja4bv4sDaWI1Ao=;
        b=xKHx9MEGtj8+YK4t76CIJSLTxhh2Bj8JfOqyVaSJI9n4FhqQCzNZowivYTquceF7R/
         wNDhR0AxMZHoHy/rytJMKZb8MoFeD+fnVW/UKKmp8XWgDsSuPRoQmF/GYQoiwMMYpz0r
         X1v0MgzHLnPgm7W26EjwvRP1p1+yu8PKKfZP8xLsYd+UrjdbGrNa5Zmz7Z+qV0Or9DXN
         qAGHOQnkdh5FlPyanBLfRYHR8KDkdHqNDAU24ZSicN0tX/y1IfIpH2O0Z9P0zsc10PXS
         2yLvpr/Rk8T2L20sAZbg2tN59qJuVypqAmxnN/GOBodeEKyf7Tti15f7AlrUC47UkhCE
         0EmA==
X-Gm-Message-State: AO0yUKXZhxBXUg7zBnsgSPx+R+36gNSH6WXv10s6dRxjcJ9VBSEPOqZG
	jZf1Q2WptqQRlMZ96WPrnJgAPWMbRUqGzKcLhT8=
X-Google-Smtp-Source: AK7set9zeFpy0CrqTPMNomqksM9w59i9+k0AgPqb4eLj7fQzRBWDh+TB4z8ZW09gOPTWolK41nlSDA==
X-Received: by 2002:a05:622a:1752:b0:3b8:6801:9092 with SMTP id l18-20020a05622a175200b003b868019092mr10017833qtk.9.1677949194820;
        Sat, 04 Mar 2023 08:59:54 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id x21-20020a05620a01f500b0071eddd3bebbsm4026579qkn.81.2023.03.04.08.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 08:59:54 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"xueliang.zhong@arm.com" <xueliang.zhong@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/n1sdp: update to linux yocto kernel 6.1
Date: Sat,  4 Mar 2023 11:59:47 -0500
Message-Id: <167794918716.51677.14945125713144431674.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230303114121.6297-1-xueliang.zhong@arm.com>
References: <20230303114121.6297-1-xueliang.zhong@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 04 Mar 2023 17:00:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4474

On Fri, 3 Mar 2023 11:41:20 +0000, xueliang.zhong@arm.com wrote:
> This patch set rebased N1SDP kernel PCIe quirk patches on 6.1 kernel.
> 
> Xueliang Zhong (1):
>   arm-bsp/n1sdp: update to linux yocto kernel 6.1
> 
>  meta-arm-bsp/conf/machine/n1sdp.conf          |  2 +-
>  .../linux/linux-arm-platforms.inc             |  3 +-
>  ...3-workaround-for-ATC_INV_SIZE_ALL-in.patch | 13 +++--
>  ...irk-add-acs-override-for-PCI-devices.patch | 18 ++++---
>  ...-for-the-Arm-Neoverse-N1SDP-platform.patch | 52 +++++++++++--------
>  ...uirk-support-enabling-remote-chip-PC.patch | 37 +++++++------
>  ...list-early-Arm-Neoverse-N1-revisions.patch | 14 +++--
>  ...disable-config-options-that-does-not.patch |  1 +
>  .../linux-yocto-6.1/n1sdp/enable-nvme.cfg     |  3 ++
>  .../n1sdp/enable-realtek-R8169.cfg            |  0
>  .../n1sdp/enable-usb_conn_gpio.cfg            |  0
>  .../n1sdp/usb_xhci_pci_renesas.cfg            |  0
>  .../recipes-kernel/linux/linux-yocto_5.19.bb  | 28 ----------
>  13 files changed, 85 insertions(+), 86 deletions(-)
>  rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch (83%)
>  rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch (91%)
>  rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch (90%)
>  rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch (84%)
>  rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch (75%)
>  rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.patch (95%)
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enable-nvme.cfg
>  rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/enable-realtek-R8169.cfg (100%)
>  rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/enable-usb_conn_gpio.cfg (100%)
>  rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/usb_xhci_pci_renesas.cfg (100%)
>  delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.19.bb

Applied, thanks!

[1/1] arm-bsp/n1sdp: update to linux yocto kernel 6.1
      commit: 7c8ce7f5a0d4c56b308d5b0026ce9f278c80820c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

