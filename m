Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E70C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 17:29:57 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web09.904.1664990987811500334
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 10:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=SjikoPHF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id de14so10763122qvb.5
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 10:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=hGzNBFy6lAs5j3uRMiwOkcI275zYNjFBDZxzTpYJcnk=;
        b=SjikoPHFETMYMhE+fcCKtG5JiY0sI05rtaoB6+CU0FwhwfoEZqT2x8fTscTmxAzeOX
         cYOFGIzrKIjj7GT+kpCfIUoegmRzljv01Gg0w2aU5KM91/PqWs3Krh9oxgNwIVqd3t31
         68d/hQIAZ1dRc1piAPdJ2i0bcxfMS5sU8F1ADh214NFTFvbAXKrze7NIupDCTR6MYUWj
         ODfXXzdydN38dAWIdlmaje2xDbuSrMF+hOgMP6GYlzcgjMEvMwDQ4a1OX++IsLWhqoaX
         Y19hO28wtT9EzLI1kYrx9z7W5OyaAzCH9hbUSuLc5HsXdyj2ZlSWiH7/+7iM9Vz583gm
         WIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=hGzNBFy6lAs5j3uRMiwOkcI275zYNjFBDZxzTpYJcnk=;
        b=aduv3EHxDr3efr6HF6HmtEk0zSD0GiWQcdSGX7i05due0bwM72qEX2o1Dj6A06YPLR
         q1D4vWeP2eNar2haYQsKIfWrFP0LOfLvsSI4UiICumWV4XauAf2BzH6VCMxDnGmlF2jC
         zzsILS38g8SOgyKxEw+cDgO/TSbXsbunXlrOFMhXyZsB7zpsWr8rQvGsPPjcfX9bYRKa
         9kzQSi0c4D2YpRU0Lx11I/zFhCJmO2TrMSOT3Hrp3CyF60BuoxjVfIIiUiNJJCYWtUeo
         KZS1Dqg60lFxOUu5IqXMKafKNJ2fmW+Td1CPt3YrGoWsFQLK2/PD4cHnApAiMlvT8kgA
         DWSw==
X-Gm-Message-State: ACrzQf30XHTodRUqQCPaDL7XXptW15V0m9ogLijnyIYywOOYkXf34DKD
	iaQdntnntQ7100f8MxKyBrhmWyO/iAza4A==
X-Google-Smtp-Source: 
 AMsMyM6y+6HrbEAkwKc/XWms7c70tW8OHER9IebEzBPxK9ocd78/6Y22xOOWDAJu7fjBbHjJehegvg==
X-Received: by 2002:a05:6214:1d05:b0:4b1:7c12:18fa with SMTP id
 e5-20020a0562141d0500b004b17c1218famr674619qvd.4.1664990986413;
        Wed, 05 Oct 2022 10:29:46 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 d6-20020a05620a240600b006cbc40f4b36sm18460719qkn.39.2022.10.05.10.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 10:29:45 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"adam.johnston@arm.com" <adam.johnston@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/linux-yocto: Upgrade kernel to v5.19 for
 N1SDP
Date: Wed,  5 Oct 2022 13:29:35 -0400
Message-Id: <166499097864.3072074.11800589718042369583.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221005114706.2444304-1-adam.johnston@arm.com>
References: <20221005114706.2444304-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Oct 2022 17:29:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3937

On Wed, 5 Oct 2022 12:47:05 +0100, adam.johnston@arm.com wrote:
> This change is to upgrade the Linux kernel version to 5.19 for N1SDP
> target to align with post N1SDP-2022.06.22 refresh
> 
> Adam Johnston (1):
>   arm-bsp/linux-yocto: Upgrade kernel to v5.19 for N1SDP
> 
>  meta-arm-bsp/conf/machine/n1sdp.conf          |  2 +-
>  .../linux/linux-arm-platforms.inc             |  3 +-
>  ...3-workaround-for-ATC_INV_SIZE_ALL-in.patch | 12 +++--
>  ...irk-add-acs-override-for-PCI-devices.patch | 14 ++---
>  ...-for-the-Arm-Neoverse-N1SDP-platform.patch | 54 ++++++++++---------
>  ...uirk-support-enabling-remote-chip-PC.patch | 29 +++++-----
>  ...list-early-Arm-Neoverse-N1-revisions.patch |  8 +--
>  ...disable-config-options-that-does-not.patch | 39 ++++++++++++++
>  .../n1sdp/enable-realtek-R8169.cfg            |  0
>  .../n1sdp/enable-usb_conn_gpio.cfg            |  0
>  .../n1sdp/usb_xhci_pci_renesas.cfg            |  0
>  11 files changed, 106 insertions(+), 55 deletions(-)
>  rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 => linux-yocto-5.19}/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch (80%)
>  rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 => linux-yocto-5.19}/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch (91%)
>  rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 => linux-yocto-5.19}/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch (91%)
>  rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 => linux-yocto-5.19}/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch (87%)
>  rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 => linux-yocto-5.19}/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch (79%)
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.patch
>  rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 => linux-yocto-5.19}/n1sdp/enable-realtek-R8169.cfg (100%)
>  rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 => linux-yocto-5.19}/n1sdp/enable-usb_conn_gpio.cfg (100%)
>  rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 => linux-yocto-5.19}/n1sdp/usb_xhci_pci_renesas.cfg (100%)

Applied, thanks!

[1/1] arm-bsp/linux-yocto: Upgrade kernel to v5.19 for N1SDP
      commit: bb1a229176297021e325e4d82e8b0919f155c061

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

