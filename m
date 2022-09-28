Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F7CC6FA90
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 13:42:19 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.8012.1664372533457523380
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 06:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=iy5m7vbU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id r14so1243291qvn.3
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 06:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=yKE6TtR69AmlDo+H4fIGNJRnALm9jKz3PYVLPesfkAs=;
        b=iy5m7vbUmugzqgSXYa/iqPLDdjK2lbfRMYTatyjBSC/mEt5cqKEt2MC5ih5eoSDS2X
         h3gYLCbSWCxEiX0DD0slLVDBupnDN4wnwmEKyj4wLbsL5DrZ1PLd+sOfhIJLDJXYeroa
         W5RZp523vIdz7MEjjOcHXZj73Va3ql6yrxeLR6J+ygaODIDNaND/tOm+PCWb7shNUvs3
         BLmCIzwCILfbQZ3fK7+eaFMD4K8/K9ugMr5//2fxEFsuqzhlpA7oY4HuvcpmcCHmRB+r
         qhxouPmbSWFTxw58pNgFFSYpliRGFzZP8+pbVCW63rjtIATbsGdHIPZnay47NTdeDI8y
         WtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=yKE6TtR69AmlDo+H4fIGNJRnALm9jKz3PYVLPesfkAs=;
        b=ovkWMvfo6noE5X6mHNFQ/faapGoY6ta3NN8ZQmWE7Vqb4kXD//NV37KSRtjP0lYZwv
         uQOmHVNuEi5pa4SjpgkiebaN5m2vSGIMds9Z5AllcEDGSb+lgk0+Eud3DRkfUz69VQqb
         xD66zfKqEAJHB9awDB+AsAU/O74ocWGFZAAS3iSBVkC+qz3NmECqVqQnVBg5TkAe4oGg
         fIpp0eilQyDxcE+O4/Q25Spr/RfwXSO2sl11xIaxFFODU/d9CB7HsAYCcBxAz2EFp41K
         qnoKBtL8UX33BYlm2Rz8wm/QEdKWS9TdAPlfyrz5WRlLpLZjUwC0yBkl3kmfWRX/8eo5
         OhVA==
X-Gm-Message-State: ACrzQf2ozPy1z2j/YzVJ027JzZ+vj/fYXbCNOwrsEmzU23KFkxgwJT5r
	0naVRwjfqkRAxU3j6FHKVl5rdx2MEmdb+g==
X-Google-Smtp-Source: 
 AMsMyM5IHGZiaS5gTVU7x4oMW6loHT+jOMwWkLIF/fx+O7YqUv+BQZdjjdo3FEU8dS8E5vuY+JtgiQ==
X-Received: by 2002:a05:6214:411a:b0:4ac:9402:e7de with SMTP id
 kc26-20020a056214411a00b004ac9402e7demr26531924qvb.128.1664372532113;
        Wed, 28 Sep 2022 06:42:12 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 a10-20020a05622a02ca00b0035d4f68232esm3019789qtx.3.2022.09.28.06.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 06:42:11 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] Add MHU and RPMSG driver for cs1k
Date: Wed, 28 Sep 2022 09:41:57 -0400
Message-Id: <166437252283.2315819.12547058103522713272.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220922145956.56063-1-emekcan.aras@arm.com>
References: <20220922145956.56063-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 28 Sep 2022 13:42:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3853

On Thu, 22 Sep 2022 15:59:54 +0100, emekcan.aras@arm.com wrote:
> The host uses MHUs to send/receive data from the external
> system in corstone1000. These commits add MHU mailbox device
> tree bindings and rpmsg mailbox driver. The host can now use
> the driver under /dev/rpmsg0_ctrl0 to communicate with external
> system.
> 
> Emekcan (2):
>   arm-bsp/u-boot: Add external system MHUs to u-boot device tree
>   arm-bsp/kernel: Add rpmsg_arm_mailbox to corstone1000
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/u-boot: Add external system MHUs to u-boot device tree
      commit: b573b29b766f231b6d3a21b21426738b2ce9d69a
[2/2] arm-bsp/kernel: Add rpmsg_arm_mailbox to corstone1000
      commit: be8890bb034cb7d850e975041baba04cca2fb93e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

