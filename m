Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61864C43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 16:10:03 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web08.9193.1655914197656144955
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Jun 2022 09:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=BmW147No;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id b133so1054357qkc.6
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Jun 2022 09:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=96UJtcz28PYu6F3N2Uxmy5KXywykIaVoa6+hBpTdTTE=;
        b=BmW147NofmdpBqDFi3r6dM/6KSBLpYsjnQCSn0rJ1zJCaAcls9LaHCL/3pdLFEFUxN
         3x+WPESU3Btb/wAH/H+2XglTI0nqtYCDi+p4arrptzCm3IlHT3JPf3VemxAjmVJ9wmsP
         aJWzzYoCzfShxnMUzzo2YHVRVQmuoQagMX8NbGLFYQt8a48KxG4GXTP6gNN3ywSFZC80
         pDfD2tObDYUubyW26Vb6Q/4n4Cu/NPVxdhoP1C9WpRQb1hiSQc1YgeIsm7w5nckcl4gK
         5OYz8ddehos8DRjCGj1I0pARTfVkWfp9NNbj32Qnr58Ndt0DBU88AE9VX1GgayIknwbI
         YmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=96UJtcz28PYu6F3N2Uxmy5KXywykIaVoa6+hBpTdTTE=;
        b=YLqYUODXKHkYX+qYfPF2CjF8KF0guBCjfOLnBt9bq7KCCsxjbTB9/eDp4oQJ8m1kH4
         2O8ccepbL8ATNKeHqXM6j7SGl2ctZA6vuCwcMOaTY4HNwn/tvlxeANgtr7uOX5MvROnj
         cw374PszeMvkdIUkg0ptK4UVFGRPaIZtb9IdW7u4CEZfT3qJRvARIsgXrIkJ8BvA1+1B
         41p+7W7B4cvG83EsUGxTrtT8IMGnT188/QNM07sOHKPRz5yIUvTFya6MtbKja3GnC7GV
         HFAsBan3UfwpFinZ5nWPWXRXfC5gc6G2Eo84bsNvMAvddW6tk3cjEwosIUdrnxXrMql/
         /BuQ==
X-Gm-Message-State: AJIora/bXAtah3YjYuZbaeLEGF5owEN5pkH/22b40VGaGjEkhL9TyjlH
	ZuWqkzuiXPd1tgdw6Sl5fw0L1tlYXvb9xg==
X-Google-Smtp-Source: 
 AGRyM1u3u6oHuwvlgSrj5fSrNpi3zlH6cfRIjYYhI4kU/3VCcguiKNFQ3w6F5D0J25ECfAlNYyQasA==
X-Received: by 2002:a05:620a:3727:b0:6a7:5055:952 with SMTP id
 de39-20020a05620a372700b006a750550952mr2934657qkb.411.1655914196222;
        Wed, 22 Jun 2022 09:09:56 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 o14-20020a05620a2a0e00b006a79479657fsm17292501qkp.108.2022.06.22.09.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 09:09:55 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"xueliang.zhong@arm.com" <xueliang.zhong@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/n1sdp: fix boot due to TF-A 2.7 update
Date: Wed, 22 Jun 2022 12:09:50 -0400
Message-Id: <165591419005.3734229.1660111246787431478.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220622085907.22892-1-xueliang.zhong@arm.com>
References: <20220622085907.22892-1-xueliang.zhong@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Jun 2022 16:10:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3532

On Wed, 22 Jun 2022 08:59:06 +0000, xueliang.zhong@arm.com wrote:
> The N1SDP board cannot boot after recent TF-A 2.7 update in meta-arm.
> This is due to TF-A 2.7 not configured correctly for N1SDP board to
> support trusted boot feature.
> 
> This patch temporarily brings back TF-A 2.6 recipes for fixing the N1SDP
> boot. A proper fix is in work progress to configure TF-A 2.7 correctly
> to support trusted boot on N1SDP.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/n1sdp: fix boot due to TF-A 2.7 update
      commit: ea3479c27c5e67a1c1a5680d2abb8ecd22e5777f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

