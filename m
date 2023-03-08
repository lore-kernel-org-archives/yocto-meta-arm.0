Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043A7C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 13:04:01 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.6298.1678280632443352258
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Mar 2023 05:03:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=xjoXbiwl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id z6so17997073qtv.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 08 Mar 2023 05:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1678280631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAfyK9DNMLG/KCXSLUPXo/iiyJ33hja4bv4sDaWI1Ao=;
        b=xjoXbiwlCM8izYANKlvT4nBUViLbTm95HtwKwDHVXEv1ctR2WmnRWciifa39xLKt6R
         dzE3gvlSynK7GPU2Ln+5EHcXDKuCZ9GDP6lvFMhxXZmMNc0QoJPwnWlCmT0aiSRGIWyR
         CXxO960NZEzlHh+ZKpYrG9UvDux3guPqC2T/2Ei1LltXuVQuxYuJzSFIHI1C51BEbbnV
         YyOFRnO9M58cnZoyz+SQweJmLhlcfhtFoSK69tloDbUWzXThk5KJUzfTy3o0abQuKvqq
         NNYekXWMqNafj5CCwtF31rZJIjf2wdKmHwkn2pE2pqtZ5i6uHn/5IbTgwsimkU4Y9LK7
         AWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678280631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAfyK9DNMLG/KCXSLUPXo/iiyJ33hja4bv4sDaWI1Ao=;
        b=PeGFD7h3kUUOOeaxFdylI7QpPw2Gej3HDaveCoFXmy1gIITGZ/RqB/391DuOMRf/2R
         v/LHLv2D605x8Au0wHu5oJKr9Hevqx/3v2jcJprG2I7WWsmvn3DHgEvAhDHu/Q+jVhhr
         U3yJnb2ZnB4eDJvMpmPV8bGA6CkdSV9pseeWny3VyHMOdolWrj1JeK+kaRmydxgzsVlE
         JKomwX9QidacUVdXLsUj7Ff7oHEnJV647RJpYrjKFkxlRdDD1OVFb3lbpiZbbGSVzn9/
         pqbq1G+nGDjQXlwHTgMbXzvF93Z8eKaq5PwBZwn76mMAfB1F9UvrYXkii3ka9ZXVNUQM
         pveQ==
X-Gm-Message-State: AO0yUKVbDMZFWqFSdec5BMUN7jbVZAqEEEj2h/n8uessJAZ84yGwzeg6
	opanzkDnWCv+nrY3rE4x/A82+tB5H/vgVeBox74=
X-Google-Smtp-Source: AK7set/H5EbJWlGf9cKWcvEslJKqr2Fmt3C67TqxQz34zSSkuHZRCk/bLguX4zVvHYb4LADMsW282Q==
X-Received: by 2002:ac8:5b53:0:b0:3b8:6ae9:b10d with SMTP id n19-20020ac85b53000000b003b86ae9b10dmr28877580qtw.2.1678280631118;
        Wed, 08 Mar 2023 05:03:51 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id d2-20020ac851c2000000b003bfd27755d7sm11508675qtn.19.2023.03.08.05.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 05:03:50 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"xueliang.zhong@arm.com" <xueliang.zhong@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/n1sdp: update to linux yocto kernel 6.1
Date: Wed,  8 Mar 2023 08:03:32 -0500
Message-Id: <167828061269.1577224.9115696506830141782.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230303114121.6297-1-xueliang.zhong@arm.com>
References: <20230303114121.6297-1-xueliang.zhong@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Mar 2023 13:04:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4482

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

