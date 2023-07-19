Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2606EB64DC
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 03:14:53 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.6043.1689736486446579125
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jul 2023 20:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=zmj5/gTS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-403ea0a50f7so22397301cf.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 18 Jul 2023 20:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1689736485; x=1692328485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYUX0AARRYqpmEgOb5X2qu+6nxsQAF3WDXp2oh33UJk=;
        b=zmj5/gTSdQVuhZH2oSCCledCIE4s6C/B82K1lV03bWZJSmuIMvuYxQnKL9+n4sR/us
         ybbO4EsvjhOBwWabbCJVOdPrj7MfFy9GvCKTjebRsNbASl3NK33MAaGFqyqQL+AAM/Jv
         lt0aMciHLT2j2Mx56ZomniAwZxtiRULJXLX3a0YRcPcXZvg9YnvS23wZ3jIPRY2xqhDz
         d++iLAiba2s17b5YzDtuxxSRiIAkkzu35i7shQ0NDydhlADvNP0876qzC2Gu0dVPk5o5
         leiSm07TiKmEeS7LlJ6UlvQ1l0CNuiSb16V19ZSRAGUCcis1Txa5w2CHO+T+qn0Bo2dv
         xN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689736485; x=1692328485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYUX0AARRYqpmEgOb5X2qu+6nxsQAF3WDXp2oh33UJk=;
        b=KbKpEucTMz1b76j8mnNzWSXSIqja90Lxo4mRgdGQgMSKE5p2hbXjDeRXlgc83LKEiD
         78NTnoO1nqHOdB246FcXMFifzODjMr4lsLMoREQA91mB83ILxNAF6hyMKtDp3BfhvfRt
         Ru81dsBFXrjSCm/9fx9rLjyuDXqpBbOr98UEZ97k5V328wYjWzQmlax0ltNoCEWBPEXH
         BdUHOXTpxNQH1c2vAm7HIHgeAi/8kCu3Dw+CH8+zrsruhPC8E1Dvg1kp8kXOHaMJairg
         u5y1syUQb9jYw3AMJo1SpBoM9DmnGzQxwMDEF8Au8QPiAT+Uo1LtwtotgXj+JXFPi/eR
         3Gtg==
X-Gm-Message-State: ABy/qLbD4MA5b/G4zOUrGlEhBqA26dRw1GhzLRGpoeX3i26gcg9oMuVY
	McR15cFh9Ar3GCsJC0b1ixrER1k+7xTAyOqEf54=
X-Google-Smtp-Source: APBJJlEJm9trF2B9G1eapfueldgtOsTyVw3ojZ7gsK5+VXKiOZ6qkWMwgW9hyFqePcJtntoKORSgGw==
X-Received: by 2002:ac8:5844:0:b0:3f6:c0f7:a5d7 with SMTP id h4-20020ac85844000000b003f6c0f7a5d7mr20865167qth.35.1689736484987;
        Tue, 18 Jul 2023 20:14:44 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id h23-20020ac87457000000b003f9b9d7f319sm1054506qtr.70.2023.07.18.20.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 20:14:44 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Cc: Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH v2 1/8] CI: track master
Date: Tue, 18 Jul 2023 23:14:21 -0400
Message-Id: <168973646188.3655543.5867580559283674889.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230719012240.3567881-1-jon.mason@arm.com>
References: <20230719012240.3567881-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jul 2023 03:14:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4903


On Tue, 18 Jul 2023 20:22:33 -0500, Jon Mason wrote:
> 


Applied, thanks!

[1/8] CI: track master
      commit: 3c514763c87d7b8ca22520b7f1f789c86c541f54
[2/8] arm-bsp/u-boot: add temporary 2023.01 recipe
      commit: 41a7a64c665126d87e721543642604709fea6233
[3/8] toolchain: remove pointless provides
      commit: a64fb4a40d707795d9adb7736920fcbeaa7ce5e2
[4/8] arm-bsp/linux-yocto: fix Upstream-Status
      commit: e668762031f8e8d963ca34941a3c15cb89024725
[5/8] arm-bsp/conf: Remove hardcoded .rootfs from image path
      commit: 1a0dd177931eb22b202c8c5d03388501e88c9a29
[6/8] arm/classes: Remove IMAGE_NAME_SUFFIX from image path
      commit: 0731d371cb9582e6045e6cbcdecc38aad8d88337
[7/8] arm-bsp/machine: work around rootfs name issue
      commit: f12f0350936e066e4df91ca26652953d1455fd1a
[8/8] ci/clang: add llvm-native from clang README
      commit: e67d9c4dbc892ef688ff960d68e02627fc99bb53

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

