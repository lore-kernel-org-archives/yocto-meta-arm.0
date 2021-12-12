Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501DAC433F5
	for <webhook@archiver.kernel.org>; Sun, 12 Dec 2021 02:45:39 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.30208.1639277138027262097
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 11 Dec 2021 18:45:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=MIPYBLmR;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id a11so11258980qkh.13
        for <meta-arm@lists.yoctoproject.org>;
 Sat, 11 Dec 2021 18:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DrymMInWXMNnffugNOEs38qyNkKfJ3EjoDIQ/ZAEs3c=;
        b=MIPYBLmRu/Hyqm8X62gWh0aXNhlmyLrz1L9CIblsQkqStO8ZkEITVjow247WYUpoq4
         tDNOFeKZ/18tVPZIvGuKJP85E8MbWN+Yy394e7t2RmtTN6OhhJAWCCdU6d/Fs+52syql
         XZl9mVnGJJYHJx8g7vAVVpRdhgjCYqWh/zFwQai6Kl71xwZhKapUstRdiM/rsissUc6V
         y6nVMIAn132FEs1+6sVCibwpDBw2sbf+UjBWpYFkmziUwQh8FLqDk8ql63bHxjTlXQD1
         ma0swMfEQZR9TQ5hW9ybPQpg20J8oMB2RCyhmdE1lyX79x6fhk/p/2JMXiV/UNR1Ro3k
         NA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DrymMInWXMNnffugNOEs38qyNkKfJ3EjoDIQ/ZAEs3c=;
        b=Ge9q1VKk8USheAMro9/fVi7AfMQX/FNLcdMAsQZ2A4we1A0cSHxMhRuh+798Y19sHw
         kxx6o4Y6owN4cBaHzlxps+/tYirHvHAjrqrz+efnTJxMD13wm+1uMNE0qkZZ02W44c5w
         rXnzQ3dCR/ZY2qx215Uo8KFZLB7QQvop2zCJRNeMuk8PRixRRvBHYqfxG3uUEbJfOR6h
         6hd7n5/5rqQx1IDq6QJfynB87RKOY5IvFUAZfnsMWI5G9efKfxiI0JRLjdCHm17ioa8N
         dhbc6Fwv3yE4mNllBggcCxR3VcvXpXjVidsDsnud4g1mH6Xw/rdAW+IAKHTdYtgrR+fS
         Ir5w==
X-Gm-Message-State: AOAM533F6Rz5iu7Jo8Mb5WISK19vIDPzHNTGBLQGWwTxK1l+LMq9Crsk
	IpQukV9Y/16tBKv4563LFy12XMccEm2OxlGt
X-Google-Smtp-Source: 
 ABdhPJwmjkm15U4i3byXWY3mebsQXf04vwYI33BmniYK07fwL42csjCkD7tW4ZqNNLuTaOSP1Jcrqw==
X-Received: by 2002:a05:620a:2a10:: with SMTP id
 o16mr27086792qkp.357.1639277137126;
        Sat, 11 Dec 2021 18:45:37 -0800 (PST)
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id
 t15sm6086365qta.45.2021.12.11.18.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 18:45:36 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/7] Corstone1000: updating source-code and fixes
Date: Sat, 11 Dec 2021 21:43:31 -0500
Message-Id: <163927701091.31526.11434602560782099038.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211211100226.17180-1-abdellatif.elkhlifi@arm.com>
References: <20211211100226.17180-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 12 Dec 2021 02:45:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2636

On Sat, 11 Dec 2021 10:02:19 +0000, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> Updates and fixes for the following components:
> 
> trusted-firmware-m
> optee-os
> secure-partitions
> u-boot
> 
> [...]

Applied, thanks!

[1/7] arm-bsp/trusted-firmware-m: corstone1000: bump the version to 1.5
      commit: ea8d5b2eeb81a54232e1cdb36051ff698cf0d009
[2/7] arm-bsp/optee-os: corstone1000: unpack sp_manifest_combined_se.dts in WORKDIR
      commit: 55e3fef745bcf898c609dbd971301db4e96d5de9
[3/7] arm-bsp/secure-partitions: rebase TS patches
      commit: 56d2e4e79c82923acfc39cbb4a0854e43677b916
[4/7] arm-bsp/optee-os: cherry pick fixes from upstream integration branch
      commit: 13e4bd913b159755cf7a11546a5eb718d447e95a
[5/7] arm-bsp/u-boot: corstone1000: Fix GetVariable data size issue
      commit: 0bf8eb4caa72f353b5590d72016f242b2a5b5ceb
[6/7] arm/secure-partitions: introducing a common file
      commit: e8432d0333b77c0265c9b0d80553b48cefbb0c2b
[7/7] arm-bsp/secure-partitions: corstone1000: using the default SHA
      commit: f01e8234ab64d7c6bb0e75898fd85ec9145f284d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

